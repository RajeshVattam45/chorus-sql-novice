-- Query to create triggers_table table.
CREATE TABLE triggers_table (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    type VARCHAR(39) NOT NULL
);

-- Query to create insert_trigger_table table.
CREATE TABLE insert_trigger_table (
    log_id INT IDENTITY(1, 1) PRIMARY KEY,
    original_id INT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    type VARCHAR(39) NOT NULL,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Query to create update_trigger_table table.
CREATE TABLE update_trigger_table (
    log_id INT IDENTITY(1, 1) PRIMARY KEY,
    original_id INT,
    old_name VARCHAR(30),
    new_name VARCHAR(30) NOT NULL,
    old_email VARCHAR(30),
    new_email VARCHAR(30) NOT NULL,
    old_type VARCHAR(39),
    new_type VARCHAR(39) NOT NULL,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Query to create delete_trigger_table table.
CREATE TABLE delete_trigger_table (
    log_id INT IDENTITY(1, 1) PRIMARY KEY,
    original_id INT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    type VARCHAR(39) NOT NULL,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP
);
