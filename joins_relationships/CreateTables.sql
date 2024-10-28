-- Query to create table.
CREATE TABLE table_one (
    user_id INT IDENTITY(1, 1) PRIMARY KEY,
    user_name VARCHAR(20),
    user_type VARCHAR(30)
);

-- Create the second table (customers)
CREATE TABLE table_two (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(30),
    salary INT NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES table_one(user_id)
);

-- Query to insert data.
INSERT INTO table_one (user_name, user_type) VALUES 
('John Doe', 'Admin'),
('Jane Smith', 'User'),
('Alice Johnson', 'Admin'),
('Robert Brown', 'User'),
('Emily Davis', 'Admin'),
('Michael Wilson', 'User'),
('Sophia Moore', 'Admin'),
('James Taylor', 'User'),
('Olivia Anderson', 'Admin'),
('William Thomas', 'User'),
('Mia Jackson', 'Admin'),
('Liam White', 'User'),
('Noah Harris', 'Admin'),
('Ava Martin', 'User'),
('Isabella Thompson', 'Admin'),
('Ethan Garcia', 'User'),
('Charlotte Martinez', 'Admin'),
('Amelia Robinson', 'User'),
('Harper Clark', 'Admin'),
('Lucas Rodriguez', 'User'),
('Mason Lewis', 'Admin'),
('Evelyn Walker', 'User'),
('Logan Hall', 'Admin'),
('Oliver Allen', 'User'),
('Aiden Young', 'Admin'),
('Benjamin King', 'User'),
('Elijah Wright', 'Admin'),
('Henry Scott', 'User'),
('Sebastian Green', 'Admin'),
('Alexander Baker', 'User');

-- Query to insert data.
INSERT INTO table_two (customer_id, customer_name, salary, user_id) VALUES
(1, 'Customer One', 50000, 1),
(2, 'Customer Two', 60000, 2),
(3, 'Customer Three', 55000, 3),
(4, 'Customer Four', 65000, 4),
(5, 'Customer Five', 50000, 5),
(6, 'Customer Six', 62000, 6),
(7, 'Customer Seven', 48000, 7),
(8, 'Customer Eight', 70000, 8),
(9, 'Customer Nine', 75000, 9),
(10, 'Customer Ten', 51000, 10),
(11, 'Customer Eleven', 56000, 11),
(12, 'Customer Twelve', 54000, 12),
(13, 'Customer Thirteen', 59000, 13),
(14, 'Customer Fourteen', 53000, 14),
(15, 'Customer Fifteen', 68000, 15),
(16, 'Customer Sixteen', 61000, 16),
(17, 'Customer Seventeen', 66000, 17),
(18, 'Customer Eighteen', 74000, 18),
(19, 'Customer Nineteen', 72000, 19),
(20, 'Customer Twenty', 63000, 20),
(21, 'Customer Twenty-One', 52000, 21),
(22, 'Customer Twenty-Two', 58000, 22),
(23, 'Customer Twenty-Three', 54000, 23),
(24, 'Customer Twenty-Four', 67000, 24),
(25, 'Customer Twenty-Five', 69000, 25),
(26, 'Customer Twenty-Six', 61000, 26),
(27, 'Customer Twenty-Seven', 60000, 27),
(28, 'Customer Twenty-Eight', 65000, 28),
(29, 'Customer Twenty-Nine', 70000, 29),
(30, 'Customer Thirty', 73000, 30);

