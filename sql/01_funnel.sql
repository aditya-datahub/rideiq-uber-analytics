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