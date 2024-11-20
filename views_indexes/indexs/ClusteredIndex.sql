-- Query to create table.
CREATE TABLE sample_users (
    user_id INT PRIMARY KEY,
    user_name NVARCHAR(100),
    email NVARCHAR(255) NOT NULL,
    phone_number NVARCHAR(15),
    user_role NVARCHAR(50)
);

-- Query to inser the data.
INSERT INTO sample_users (user_id, user_name, email, phone_number, user_role)
VALUES 
(1, 'Alice', 'alice@example.com', '1234567890', 'Admin'),
(2, 'Bob', 'bob@example.com', '9876543210', 'User'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'Moderator'),
(4, 'Diana', 'diana@example.com', '9988776655', 'Admin'),
(5, 'Eve', 'eve@example.com', '5566778899', 'User');

-- Create a non-clustered index on the 'email' column to optimize lookups by email.
CREATE NONCLUSTERED INDEX idx_email ON sample_users (email);

-- Create a non-clustered index on the 'phone_number' column to optimize searches by phone number.
CREATE NONCLUSTERED INDEX idx_phone_number ON sample_users (phone_number);

-- Create a composite non-clustered index on 'email' & 'user_role' to optimize queries filtering by both email and role.
CREATE NONCLUSTERED INDEX idx_email_role ON sample_users (email, user_role);

-- Find a User by user_id (Clustered Index).
SELECT * FROM sample_users WHERE user_id = 3;

-- Search by Email (Non-Clustered Index).
SELECT * FROM sample_users WHERE email = 'alice@example.com';

-- Query Using Composite Index (email, user_role).
SELECT * FROM sample_users WHERE email = 'bob@example.com' AND user_role = 'User';

-- Search by Phone Number (Non-Clustered Index).
SELECT * FROM sample_users WHERE phone_number = '1122334455';
