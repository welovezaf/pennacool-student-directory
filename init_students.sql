-- Create database if it doesn't exist (safety)
CREATE DATABASE IF NOT EXISTS studentsdb
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE studentsdb;

-- Drop table if it already exists (for clean re-runs)
DROP TABLE IF EXISTS students;

-- Create students table
CREATE TABLE students (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    class VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample data
INSERT INTO students (first_name, last_name, class, email) VALUES
('Aaliyah',  'Charles',   'Std 3 Red',   'aaliyah.charles@example.com'),
('Jamal',    'Ramdeen',   'Std 4 Blue',  'jamal.ramdeen@example.com'),
('Kiana',    'Sookhai',   'Std 5 Green', 'kiana.sookhai@example.com'),
('Malik',    'Joseph',    'Std 2 Gold',  'malik.joseph@example.com'),
('Sasha',    'Ali',       'Std 1 Purple','sasha.ali@example.com'),
('Deven',    'Singh',     'Std 3 Red',   'deven.singh@example.com'),
('Tariq',    'Phillip',   'Std 4 Blue',  'tariq.phillip@example.com'),
('Leah',     'Gomes',     'Std 5 Green', 'leah.gomes@example.com');
