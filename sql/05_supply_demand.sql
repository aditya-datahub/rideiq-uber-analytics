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