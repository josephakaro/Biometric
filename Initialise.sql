-- Create and use Database
CREATE DATABASE IF NOT EXISTS biometricUser;
USE biometricUser;

-- Create and grant Privilege on app user to connect to the program:
CREATE USER IF NOT EXISTS 'biometric_admin'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON biometricUser.* To 'biometric_admin'@'localhost';

-- ==== Creating Tables ====
-- UserID           : Primary Key
-- FirstName        : String Not Empty
-- LastName         : String Not Empty
-- DateOfBirth      : Date || datetime (Python)
-- Gender           : Enum, Selective Options
-- Email            : String
-- PhoneNumber      : String || bigint || Int(10)
-- BiometricData    : Blob, binary format
-- BiometricType    : Enum Selective Options
-- RegistrationDate : Timestamp, Date Registered
-- LastModified     : Timestamp, Date modified
-- =========================

DROP TABLE biometrics;

CREATE TABLE IF NOT EXISTS biometrics(
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    SurName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    OtherName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female'),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    BiometricData BLOB,
    BiometricType ENUM('Fingerprint', 'Facial', 'Iris', 'Other'),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastModified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);