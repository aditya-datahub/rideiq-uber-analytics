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