-- Define a CTE named "retrive_data" to select specific columns from the "users" table.
WITH retrive_data AS (
    SELECT
        id,
        user_name
    FROM
        users
)

-- Retrieve all records from the "retrive_data" CTE.
SELECT
    *
FROM
    retrive_data;

-- Define another CTE named "top_5_dev_users" to get the top 5 developers.
WITH top_5_dev_users AS (
    SELECT
        TOP 5 id,
        user_name,
        user_email,
        user_number,
        user_role
    FROM
        users
    WHERE
        user_role = 'dev'
    ORDER BY
        user_number DESC
)

-- Retrieve all records from the "top_5_dev_users" CTE.
SELECT
    *
FROM
    top_5_dev_users;

-- Define a CTE named "new_users" to create a set of new user records.
WITH new_users AS (
    SELECT 101 AS id, 'John Doe' AS user_name, 'john@example.com' AS user_email, 'dev' AS user_role
    UNION ALL
    SELECT 102, 'Jane Smith', 'jane@example.com', 'dev'
)

-- Insert data from the CTE into the "users" table.
INSERT INTO users (id, user_name, user_email, user_role)
SELECT id, user_name, user_email, user_role
FROM new_users;

-- Define a CTE to select dev users with outdated email domains
WITH dev_users AS (
    SELECT id, user_email
    FROM users
    WHERE id = '22' AND user_email LIKE '%@example.com'
)

-- Update the email domain for these users.
UPDATE dev_users
SET id = REPLACE(id, '@example.com', '@updated.com');

-- Verify the update by selecting dev users with the updated email domain
SELECT *
FROM users
WHERE user_role = 'dev' AND id LIKE '%@updated.com';

-- Define a CTE to select the user with id = 7
WITH specific_user AS (
    SELECT id
    FROM users
    WHERE id = 7
)

-- Delete the record from the users table based on the ID in the CTE.
DELETE FROM users
WHERE id IN (SELECT id FROM specific_user);

-- Verify the deletion by selecting from the users table where id = 7.
SELECT *
FROM users
WHERE id = 7;
