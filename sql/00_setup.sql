CREATE TABLE rides (
    fare_amount FLOAT,
    pickup_datetime TIMESTAMP,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    passenger_count INT,
    hour INT,
    day_of_week VARCHAR(20),
    month INT,
    year INT
);

SELECT * FROM rides LIMIT 5;

-- Ride Completion Funnel Analysis
-- Shows rides count by hour with completion rate

SELECT 
    hour,
    COUNT(*) AS total_rides,
    COUNT(CASE WHEN fare_amount >= 5 AND passenger_count >= 1 THEN 1 END) AS completed_rides,
    ROUND(COUNT(CASE WHEN fare_amount >= 5 AND passenger_count >= 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS completion_rate
FROM rides
GROUP BY hour
ORDER BY hour;

-- Rider Retention Cohort Analysis
-- Shows how many riders return by year and month

SELECT 
    year,
    month,
    COUNT(*) AS total_rides,
    ROUND(AVG(fare_amount)::numeric, 2) AS avg_fare,
    ROUND(AVG(passenger_count)::numeric, 1) AS avg_passengers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY year), 2) AS monthly_share
FROM rides
GROUP BY year, month
ORDER BY year, month;

-- Rider Lifetime Value Analysis
-- Shows revenue contribution by passenger count segment

SELECT 
    passenger_count,
    COUNT(*) AS total_rides,
    ROUND(AVG(fare_amount)::numeric, 2) AS avg_fare,
    ROUND(SUM(fare_amount)::numeric, 2) AS total_revenue,
    ROUND((SUM(fare_amount)::numeric * 100.0 / SUM(SUM(fare_amount)::numeric) OVER ()), 2) AS revenue_share
FROM rides
GROUP BY passenger_count
ORDER BY total_revenue DESC;

-- Cancellation Rate Analysis
-- Shows cancellation pattern by hour of day

SELECT 
    hour,
    COUNT(*) AS total_rides,
    COUNT(CASE WHEN fare_amount < 5 THEN 1 END) AS cancelled_rides,
    ROUND(COUNT(CASE WHEN fare_amount < 5 THEN 1 END) * 100.0 / COUNT(*)::numeric, 2) AS cancellation_rate,
    ROUND(AVG(fare_amount)::numeric, 2) AS avg_fare
FROM rides
GROUP BY hour
ORDER BY cancellation_rate DESC;

-- Driver Supply vs Demand Gap Analysis
-- Shows busiest hours and days

SELECT 
    hour,
    day_of_week,
    COUNT(*) AS total_rides,
    ROUND(AVG(fare_amount)::numeric, 2) AS avg_fare,
    CASE 
        WHEN COUNT(*) >= 1500 THEN 'High Demand'
        WHEN COUNT(*) >= 800 THEN 'Medium Demand'
        ELSE 'Low Demand'
    END AS demand_level
FROM rides
GROUP BY hour, day_of_week
ORDER BY total_rides DESC; 

-- Surge Revenue Analysis
-- Shows revenue patterns by hour and fare category

SELECT 
    hour,
    COUNT(*) AS total_rides,
    ROUND(AVG(fare_amount)::numeric, 2) AS avg_fare,
    ROUND(SUM(fare_amount)::numeric, 2) AS total_revenue,
    CASE 
        WHEN AVG(fare_amount) >= 15 THEN 'High Surge'
        WHEN AVG(fare_amount) >= 10 THEN 'Medium Surge'
        ELSE 'Low Surge'
    END AS surge_level
FROM rides
GROUP BY hour
ORDER BY total_revenue DESC;
