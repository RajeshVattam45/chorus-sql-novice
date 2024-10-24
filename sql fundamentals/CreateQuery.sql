-- Query to create table.
CREATE TABLE customers (
    id INT PRIMARY KEY IDENTITY(1, 1),
    customer_name VARCHAR(30) NOT NULL,
    customer_mail VARCHAR(30) NOT NULL,
    salary INT NOT NULL
);

-- Query to create demo table.
CREATE TABLE demo (id INT PRIMARY KEY IDENTITY(1, 1));
