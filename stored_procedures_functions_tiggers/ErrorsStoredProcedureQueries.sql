-- Creating stored procedure with error handling
CREATE PROCEDURE GetAccountHolderName
    @account_id INT,
    @account_holder_name NVARCHAR(30) OUTPUT
AS
BEGIN
    BEGIN TRY
        -- Check if the input is a valid integer.
        IF ISNUMERIC(@account_id) = 0
        BEGIN
            -- Raise an error if the input is not numeric.
            THROW 50001, 'Invalid input: account_id must be an integer.', 1;
        END

        -- Query to fetch account holder name and balance.
        SELECT 
            @account_holder_name = account_holder_name
        FROM 
            BankAccount 
        WHERE 
            account_id = @account_id;

        -- Check if the account exists.
        IF @@ROWCOUNT = 0
        BEGIN
            -- Raise an error if the account is not found.
            THROW 50002, 'Account ID not found.', 1;
        END
    END TRY
    BEGIN CATCH
        -- Handle errors and display error messages.
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR);
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS VARCHAR);
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR);
    END CATCH
END;

DECLARE @account_holder_name NVARCHAR(30);

-- Execute the stored procedure for a valid account_id.
EXEC GetAccountHolderName 
    @account_id = 1,
    @account_holder_name = @account_holder_name OUTPUT;

-- Print the account holder name.
PRINT 'Account Holder Name: ' + @account_holder_name;

-- EX2:
-- Query to create procedure.
CREATE PROCEDURE InsertNewCustomer
    @customer_name NVARCHAR(50),
    @customer_email NVARCHAR(30)
AS
BEGIN
    BEGIN TRY
        -- Check if a customer with the same name or email already exists.
        IF EXISTS (SELECT 1 FROM customers_table WHERE customer_name = @customer_name AND customer_email = @customer_email)
        BEGIN
            THROW 50002, 'Customer with the same name already exists.', 1;
        END

        -- Insert the new customer without specifying the ID.
        INSERT INTO customers_table (customer_name, customer_email)
        VALUES (@customer_name, @customer_email);

        PRINT 'Customer added successfully.';
    END TRY
    BEGIN CATCH
        -- Handle errors.
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH
END;

-- Execution procedure:
EXEC InsertNewCustomer @customer_name = 'Rohit', @customer_email = 'rohit@gmail.com';

-- Query to delete the procedure.
DROP PROCEDURE IF EXISTS InsertNewCustomer;
