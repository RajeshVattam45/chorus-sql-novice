-- Creating the stored procedure.
CREATE PROCEDURE GetCustomerEmail @customer_id INT,
@customer_name NVARCHAR(30) OUTPUT AS BEGIN
SELECT
    customer_email
FROM
    customers_table
WHERE
    id = @customer_id;

-- If no records found.
IF @@ROWCOUNT = 0
SET
    @customer_name = 'EMAIL NOT FOUND';
END;

-- Declaring the variable to store output.
DECLARE @Email VARCHAR(30);

-- Executing the stored procedure.
EXEC GetCustomerEmail @customer_id = 1,
@customer_name = @Email OUTPUT;

-- EX:2
-- Creating the stored procedure.
CREATE PROCEDURE GetCustomersNames @customer_id INT,
@customet_name NVARCHAR(30) OUTPUT AS BEGIN
SELECT
    customer_name
FROM
WHERE
    customer_id = @customer_id;

-- If no records found.
IF @ @ROWCOUNT = 0
SET
    @customer_name = 'Not Found';
END;

-- Declaring the variable to store output.
DECLARE @customer_name VARCHAR(30);

-- Executing the stored procedure.
EXEC GetCustomersNames @customer_id = '1',
@customer_name = @customer_name OUTPUT;

-- EX3:
-- Creating stored procedure.
CREATE PROCEDURE DisplayCustomersData @customer_id INT,
@customer_name NVARCHAR(30) OUTPUT,
@customer_email NVARCHAR(30) OUTPUT AS BEGIN
SELECT
    customer_name,
    customer_email
FROM
    customers
WHERE
    customer_id = @customer_id;

-- If no rows found.
IF @@ROWCOUNT = 0
SET
    @customer_name = 'Name Not Found';
SET
    @customer_email = 'Name Not Found';
END;

-- Declaring the variable to store output.
DECLARE @CustomerName VARCHAR(30),
@CustomerMail VARCHAR(30);

-- Execuite stored procedure.
EXEC DisplayCustomersData @customer_id = 1,
@customer_name = @CustomerName OUTPUT,
@customer_email = @CustomerMail OUTPUT
