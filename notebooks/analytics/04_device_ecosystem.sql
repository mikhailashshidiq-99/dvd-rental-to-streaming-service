SELECT d.os, d.device_type, COUNT(DISTINCT ss.profile_id) AS unique_profiles,
               COUNT(ss.session_id) AS total_streams
        FROM streaming_sessions ss
        JOIN devices d ON ss.device_id = d.device_id
        GROUP BY d.os, d.device_type
        ORDER BY total_streams DESC;