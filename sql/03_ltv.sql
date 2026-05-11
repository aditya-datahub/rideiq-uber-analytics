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