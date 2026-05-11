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