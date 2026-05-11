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