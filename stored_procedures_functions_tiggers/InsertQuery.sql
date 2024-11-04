-- Note: Execute this query if the table does not exist.
CREATE TABLE customers_table (
    id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    customer_name VARCHAR(30) NOT NULL,
    customer_email VARCHAR(30) NOT NULL
);

-- Create a stored procedure to insert customer data.
CREATE PROCEDURE InsertCustomersTableData @customer_name NVARCHAR(30),
@customer_email NVARCHAR(30) AS BEGIN
INSERT INTO
    customers_table (customer_name, customer_email)
VALUES
    (@customer_name, @customer_email);
END;

-- Execute the stored procedure with sample data.
EXEC InsertCustomersTableData @customer_name = 'REMO',
@customer_email = 'REMO@gmail.com';