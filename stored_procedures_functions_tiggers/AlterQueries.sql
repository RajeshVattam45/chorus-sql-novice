-- Create a stored procedure to add a new column to the customers_table.
CREATE PROCEDURE AlterTableCustomersData AS BEGIN

-- Add the new column 'type' of type NVARCHAR(30) to the customers_table.
ALTER TABLE
    customers_table
ADD
    type NVARCHAR(30);
END;

EXEC AlterTableCustomersData;