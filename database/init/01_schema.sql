-- PHASE 1: TEARDOWN
DROP TABLE IF EXISTS streaming_sessions CASCADE;
DROP TABLE IF EXISTS billing_history CASCADE;
DROP TABLE IF EXISTS profiles CASCADE;
DROP TABLE IF EXISTS devices CASCADE;
DROP TABLE IF EXISTS content CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- PHASE 2: BUILD SCHEMA
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE profiles (
    profile_id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    profile_name VARCHAR(100) NOT NULL,
    maturity_rating VARCHAR(10)
);

CREATE TABLE billing_history (
    billing_id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    subscription_tier VARCHAR(50) NOT NULL
);

CREATE TABLE content (
    content_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    content_rating VARCHAR(10),
    release_year INT
);

CREATE TABLE devices (
    device_id UUID PRIMARY KEY,
    device_type VARCHAR(50) NOT NULL,
    os VARCHAR(50) NOT NULL,
    last_online TIMESTAMP
);

CREATE TABLE streaming_sessions (
    session_id UUID PRIMARY KEY,
    profile_id UUID NOT NULL REFERENCES profiles(profile_id) ON DELETE CASCADE,
    content_id INT NOT NULL REFERENCES content(content_id) ON DELETE CASCADE,
    device_id UUID NOT NULL REFERENCES devices(device_id) ON DELETE SET NULL,
    start_timestamp TIMESTAMP NOT NULL,
    end_timestamp TIMESTAMP,
    average_bitrate INT,             
    is_offline_playback BOOLEAN NOT NULL DEFAULT FALSE,     
    experiment_variant_id VARCHAR(50)
);

-- PHASE 3: INDEXES
CREATE INDEX idx_sessions_variant ON streaming_sessions(experiment_variant_id);