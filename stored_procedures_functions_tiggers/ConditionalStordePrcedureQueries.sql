-- Creatig stored procedure queries.
CREATE PROCEDURE CheckAccountBalence @account_id INT,
@balance INT OUTPUT;
AS BEGIN
SELECT
    balance
FROM
    BankAccount
WHERE
    account_id = @account_id;

-- Set @balance if no rows affected.
IF @@ROWCOUNT = 0
SET
    @balance = 'No Balence Found';
END;

-- Declare the variable to store the output balance.
DECLARE @Balance INT;

-- Execute the stored procedure and pass the output parameter.
EXEC CheckAccountBalence @account_id = 1,
@balance = @Balance OUTPUT;

-- Check if the returned balance is -1, which indicates no balance was found.
IF @Balance = -1 PRINT 'Balance: No Balance Found';
-- If the balance is not -1, print the balance.
ELSE PRINT 'Balance: ' + CAST(@Balance AS VARCHAR);

-- Example for case.
SELECT 
    account_id,
    account_holder_name,
    balance,
    CASE 
        WHEN balance >= 5000 THEN 'High Balance'
        WHEN balance BETWEEN 1000 AND 4999 THEN 'Medium Balance'
        ELSE 'Low Balance'
    END AS BalanceCategory
FROM BankAccount;
