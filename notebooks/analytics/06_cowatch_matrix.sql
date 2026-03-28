SELECT c1.title AS watched_movie, c2.title AS also_watched_movie,
               COUNT(DISTINCT ss1.profile_id) AS shared_viewers
        FROM streaming_sessions ss1
        JOIN streaming_sessions ss2 
            ON ss1.profile_id = ss2.profile_id AND ss1.content_id != ss2.content_id
        JOIN content c1 ON ss1.content_id = c1.content_id
        JOIN content c2 ON ss2.content_id = c2.content_id
        GROUP BY c1.title, c2.title
        ORDER BY shared_viewers DESC
        LIMIT 5;