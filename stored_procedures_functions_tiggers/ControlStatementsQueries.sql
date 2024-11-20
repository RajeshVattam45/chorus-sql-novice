CREATE PROCEDURE PrintBalances
AS
BEGIN
    DECLARE @counter INT; -- Declare variable
    DECLARE @maxId INT;

    SET @counter = 1; -- Initialize variable

    -- Get the maximum account_id
    SELECT @maxId = MAX(account_id) FROM BankAccount;

    WHILE @counter <= @maxId
    BEGIN
        -- Fetch account details for the current counter
        SELECT account_id, account_holder_name, balance
        FROM BankAccount
        WHERE account_id = @counter;

        -- Increment the counter
        SET @counter = @counter + 1;
    END;
END;

-- Execuite procedure.
EXEC PrintBalances;

CREATE PROCEDURE DisplayBalence (@account_id INT)
AS
BEGIN
    DECLARE @balance DECIMAL(10, 2);

    -- Get the balance from the BankAccount table
    SELECT @balance = balance
    FROM BankAccount
    WHERE account_id = @account_id;

    -- Check balance and use GOTO for control flow
    IF @balance < 1000
        GOTO LowBalance;

    PRINT 'Sufficient balance.';
    RETURN;

LowBalance:
    PRINT 'Low balance. Please deposit more funds.';
END;

EXEC DisplayBalence @account_id = 1;
