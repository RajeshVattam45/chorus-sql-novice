-- Create a stored procedure named GetAllData to retrive the all data.
CREATE PROCEDURE GetAllData AS BEGIN
SELECT
    *
FROM
    customers_orders;

END;

-- Execuite query to retrieve all data from the customers_orders table.
EXEC GetAllData;

/* If you want to delete a stored procedure after it has been created */
DROP PROCEDURE GetAllData;

-- Create a stored procedure named GetOrdersByEmail with a parameter for the customer's email.
CREATE PROCEDURE GetOrdersByEmail @customerEmail NVARCHAR(50) AS BEGIN
SELECT
    *
FROM
    customers_orders
WHERE
    customer_email = @customerEmail;

END;

-- Execute the GetOrdersByEmail procedure with a specific email to retrieve matching records.
EXEC GetOrdersByEmail 'alice@example.com';

-- Create a stored procedure named GetProductId with an integer parameter for product ID.
CREATE PROCEDURE GetProductId @product_id INT AS BEGIN
SELECT
    *
FROM
    customers_orders
WHERE
    product_id = @product_id;

END;

-- Execute the GetProductId procedure with an integer value for product_id.
EXEC GetProductId 100;

CREATE PROCEDURE GetAllPrise @price INT AS BEGIN
SELECT
    price
FROM
    customers_orders
WHERE
    price > 1000;

END;

EXEC GetAllPrise;

-- Create a procedure with parameters.
CREATE PROCEDURE GetAllPrise @price INT AS BEGIN
SELECT
    price
FROM
    customers_orders
WHERE
    price < @price;

END;

-- Execute the stored procedure.
EXEC GetAllPrise @price = 1000;

-- Get the price without perameter.
/* CREATE PROCEDURE GetPriseData AS BEGIN
 SELECT price FROM customers_orders
 WHERE price < 1000;
 END;
 EXEC GetPriseData; */