-- Create a table to log DDL operations.
CREATE TABLE ddl_log (
    log_id INT IDENTITY(1, 1) PRIMARY KEY,
    event_type NVARCHAR(50),
    event_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    command_text NVARCHAR(MAX)
);

-- Create a DDL trigger to log DROP TABLE events.
CREATE TRIGGER log_table_drops
ON DATABASE
FOR DROP_TABLE
AS
BEGIN
    INSERT INTO ddl_log (event_type, command_text)
    VALUES ('DROP_TABLE', EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'));
END;

-- This will log the event in `ddl_log`.
DROP TABLE triggers_table;

-- Query the log.
SELECT * FROM ddl_log;

-- Create a trigger to log CREATE TABLE operations.
CREATE TRIGGER log_table_creates
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
    -- Log the event type and the SQL command text into ddl_log table.
    INSERT INTO ddl_log (event_type, command_text)
    VALUES ('CREATE_TABLE', EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'));
END;

-- Create a trigger to log ALTER TABLE operations.
CREATE TRIGGER log_table_alters
ON DATABASE
FOR ALTER_TABLE
AS
BEGIN
    -- Log the event type and the SQL command text into ddl_log table.
    INSERT INTO ddl_log (event_type, command_text)
    VALUES ('ALTER_TABLE', EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'));
END;

-- Query to create new table.
CREATE TABLE test_table (id INT PRIMARY KEY);
select * from test_table;

-- Query to add column to test_table.
ALTER TABLE test_table 
ADD name NVARCHAR(100);

-- View the ddl_log table
SELECT * FROM ddl_log;
