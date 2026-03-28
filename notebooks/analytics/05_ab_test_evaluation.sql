SELECT experiment_variant_id, COUNT(session_id) AS total_sessions,
               AVG(average_bitrate)::INT AS avg_variant_bitrate,
               SUM(CASE WHEN is_offline_playback = TRUE THEN 1 ELSE 0 END) AS offline_downloads
        FROM streaming_sessions
        WHERE experiment_variant_id IS NOT NULL
        GROUP BY experiment_variant_id;