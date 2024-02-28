CREATE DATABASE votting_db;

CREATE TABLE voters(
    student_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    student_year VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    registration_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_level INT(1) UNSIGNED NOT NULL
);

ALTER TABLE voters ADD COLUMN gender ENUM('male', 'female') NOT NULL AFTER student_year;