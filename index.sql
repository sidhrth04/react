CREATE DATABASE IF NOT EXISTS multi_login;

USE multi_login;

-- Table for storing user information
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    role ENUM('admin', 'clerk') NOT NULL
);

-- Table for storing system settings
CREATE TABLE IF NOT EXISTS system_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(255) NOT NULL,
    setting_value TEXT
);

-- Table for storing parcel information
CREATE TABLE IF NOT EXISTS parcels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tracking_number VARCHAR(255) NOT NULL,
    recipient_name VARCHAR(255) NOT NULL,
    recipient_address TEXT NOT NULL,
    status ENUM('collected', 'shipped', 'in-transit', 'arrived', 'out-for-delivery') NOT NULL
);

-- Table for storing parcel tracks
CREATE TABLE IF NOT EXISTS parcel_tracks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    parcel_id INT NOT NULL,
    status ENUM('collected', 'shipped', 'in-transit', 'arrived', 'out-for-delivery') NOT NULL,
    track_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing mpesa verification
CREATE TABLE IF NOT EXISTS mpesa_verification (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    status ENUM('verified', 'pending') NOT NULL
);

-- Table for storing branch information
CREATE TABLE IF NOT EXISTS branches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);