WITH LastUserStream AS (
            SELECT p.user_id, MAX(ss.start_timestamp) AS last_stream_date
            FROM profiles p
            LEFT JOIN streaming_sessions ss ON p.profile_id = ss.profile_id
            GROUP BY p.user_id
        )
        SELECT u.email, b.subscription_tier, lus.last_stream_date,
               EXTRACT(DAY FROM (CURRENT_TIMESTAMP - lus.last_stream_date)) AS days_since_last_stream
        FROM users u
        JOIN LastUserStream lus ON u.user_id = lus.user_id
        JOIN billing_history b ON u.user_id = b.user_id
        WHERE lus.last_stream_date < CURRENT_TIMESTAMP - INTERVAL '30 days' OR lus.last_stream_date IS NULL;