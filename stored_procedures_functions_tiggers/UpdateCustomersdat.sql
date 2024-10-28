-- Create a stored procedure to update customer data.
CREATE PROCEDURE UpdatacCustomersData
@id INT,
@customer_name NVARCHAR(30),
@customer_email NVARCHAR(30)
AS BEGIN
-- Update the customer record in the customers_table where the ID matches.
UPDATE customers_table
SET
    customer_name = @customer_name,
    customer_email = @customer_email
WHERE id = @id;
END;

-- Execute the stored procedure to update a specific customer's data.
EXEC UpdatacCustomersData
@id = 1,
@customer_name = 'hello',
@customer_email = 'hello@gmail.com';

-- Query to retrive the all data.
SELECT * FROM customers_table;
