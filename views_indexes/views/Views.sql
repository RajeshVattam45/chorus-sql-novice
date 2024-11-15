-- Note: create the users table if it does not already exist.
CREATE TABLE users (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL,
    user_email VARCHAR(30) NOT NULL,
    user_number INT NOT NULL,
    user_role VARCHAR(30) NOT NULL
);

-- Create a view to display basic user information.
CREATE VIEW user_info AS
SELECT
    id,
    user_name,
    user_email
FROM
    users;

-- Query to delete the view.
DROP VIEW user_info;

-- Query to display data from user_info view.
SELECT
    *
FROM
    user_info;

CREATE VIEW user_info_details AS
SELECT
    *
FROM
    users
WHERE
    id = 5;

-- Query to retrieve data from the updated user_info_details view.
SELECT
    *
FROM
    user_info_details;

-- Query to delete the view.
DROP VIEW user_info_details;

-- Create a view to display all information for the user with user_name 'rajesh'.
CREATE VIEW [User Rajesh] AS
SELECT
    *
FROM
    users
WHERE
    user_name = 'rajesh';

-- Query to retrieve data from the 'User Rajesh' view.
SELECT
    *
FROM
    [User Rajesh];
