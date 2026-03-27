DROP TABLE IF EXISTS daily_device_telemetry_summary CASCADE;
DROP TABLE IF EXISTS streaming_sessions CASCADE;
DROP TABLE IF EXISTS devices CASCADE;

CREATE TABLE devices (
    device_id UUID PRIMARY KEY,
    device_type VARCHAR(50) NOT NULL,
    os VARCHAR(50) NOT NULL,
    last_online TIMESTAMP
);

CREATE TABLE streaming_sessions (
    session_id UUID PRIMARY KEY,
    device_id UUID,
    profile UUID,
    content_id INT,
    start_timestamp TIMESTAMP,
    end_timestamp TIMESTAMP,
    average_bitrate INT,
    is_offline_playback BOOLEAN,
    experiment_variant_id VARCHAR(50),
    CONSTRAINT fk_device
        FOREIGN KEY (device_id)
        REFERENCES devices(device_id)
);

CREATE TABLE daily_device_telemetry_summary (
    report_date DATE,
    device_type VARCHAR(50),
    total_sessions INT,
    average_bitrate NUMERIC(10, 2),
    PRIMARY KEY (report_dat, device_type)
);