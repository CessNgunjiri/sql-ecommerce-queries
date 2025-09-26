-- Which cities/states have the most engaged users?
SELECT 
    state,
    city,
    traffic_source,
    COUNT(DISTINCT user_id) as unique_users,
    COUNT(*) as total_events,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT user_id), 2) as events_per_user,
    COUNT(DISTINCT event_type) as unique_actions_taken,
    ROUND(COUNT(CASE WHEN event_type = 'purchase' THEN 1 END) * 100.0 / COUNT(*), 2) as purchase_rate
FROM events
WHERE state IS NOT NULL AND city IS NOT NULL
GROUP BY state, city, traffic_source
HAVING COUNT(DISTINCT user_id) > 5
ORDER BY events_per_user DESC
LIMIT 15;