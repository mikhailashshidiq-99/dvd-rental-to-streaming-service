SELECT c.title, c.content_rating, COUNT(ss.session_id) AS total_plays,
               AVG(EXTRACT(EPOCH FROM (ss.end_timestamp - ss.start_timestamp))/60)::INT AS avg_watch_minutes
        FROM streaming_sessions ss
        JOIN content c ON ss.content_id = c.content_id
        WHERE ss.end_timestamp IS NOT NULL
        GROUP BY c.title, c.content_rating
        ORDER BY avg_watch_minutes DESC
        LIMIT 10;