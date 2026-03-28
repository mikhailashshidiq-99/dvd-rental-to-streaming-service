SELECT DATE(ss.start_timestamp) AS streaming_date,
               COUNT(DISTINCT p.user_id) AS daily_active_users,
               SUM(EXTRACT(EPOCH FROM (ss.end_timestamp - ss.start_timestamp))/3600) AS total_hours_watched
        FROM streaming_sessions ss
        JOIN profiles p ON ss.profile_id = p.profile_id
        GROUP BY DATE(ss.start_timestamp)
        ORDER BY streaming_date DESC;