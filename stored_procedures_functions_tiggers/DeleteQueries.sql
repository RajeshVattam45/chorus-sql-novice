-- Create a stored procedure to delete a customer record.
CREATE PROCEDURE DeleteCustomersData
    @id INT
AS BEGIN
-- Delete the customer record from customers_table where the ID matches.
DELETE FROM
    customers_table
WHERE
    id = @id;
END;
-- Execute the stored procedure to delete a customer with ID.
EXEC DeleteCustomersData @id = 1;
