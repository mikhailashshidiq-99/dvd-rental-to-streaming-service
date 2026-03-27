INSERT INTO devices (device_id, device_type, os, last_online)
VALUES ('550e8400-e29b-41d4-a716-446655440000', 'Autonomous Drone', 'Linux Edge', '2024-05-15 14:30:00');

INSERT INTO streaming_sessions (session_id, device_id, profile_id, content_id, start_timestamp, end_timestamp, average_bitrate, is_offline_playback, experiment_variant_id)
VALUES (
    '11111111-2222-3333-4444-555555555555', 
    '550e8400-e29b-41d4-a716-446655440000', 
    '99999999-8888-7777-6666-555555555555', 
    101,                                    
    '2024-05-15 14:30:00', 
    '2024-05-15 16:30:00', 
    1500,                                   
    FALSE,                                  
    'B'
);