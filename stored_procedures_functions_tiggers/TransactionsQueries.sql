-- Query to Create table.
CREATE TABLE BankAccount (
    account_id INT,
    account_holder_name VARCHAR(30) NOT NULL,
    balance DECIMAL(18, 2)
);

-- Query to insert data into BankAccount table.
INSERT INTO
    BankAccount (account_id, account_holder_name, balance)
VALUES
    (1, 'Rajesh V', 10000),
    (2, 'Lokesh V', 5000),
    (3, 'Murali M', 100);

-- Transaction Example.
BEGIN TRANSACTION;

-- Deduct 500 from Rajesh account.
UPDATE
    BankAccount
SET
    balance = balance - 500
WHERE
    account_id = 1;

-- Check if Rajesh AC has inof amount.
IF @@ROWCOUNT = 0
OR (
    SELECT
        balance
    FROM
        BankAccount
    WHERE
        account_id = 1
) < 0 BEGIN ROLLBACK TRANSACTION PRINT 'Unsufficient Balance';
RETURN;
END;

-- Update Lokesh (reciver) Account.
UPDATE
    Balance
SET
    balance = balance + 500
WHERE
    account_id = 2;

-- Commit the transaction if all operations sucess.
COMMIT TRANSACTION;

-- EX2:
-- Transaction Example.
BEGIN TRANSACTION;

-- Deduct 500 from Rajesh account.
UPDATE
    BankAccount
SET
    balance = balance - 500
WHERE
    account_id = 3;

-- Check if Rajesh AC has inof amount.
IF @@ROWCOUNT = 0
OR (
    SELECT
        balance
    FROM
        BankAccount
    WHERE
        account_id = 3
) < 0 BEGIN ROLLBACK TRANSACTION PRINT 'Unsufficient Balance';
RETURN;
END;

-- Update Lokesh Account.
UPDATE
    BankAccount
SET
    balance = balance + 500
WHERE
    account_id = 2;

-- Commit the transaction if all operations sucess.
COMMIT TRANSACTION;
