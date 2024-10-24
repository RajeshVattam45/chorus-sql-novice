-- Query to modify the data type of the 'type' column in the 'customers' table.
ALTER TABLE customers ALTER COLUMN type VARCHAR(100);

-- Query to rename the 'type' column to 'types' in the 'customers' table.
EXEC sp_rename 'customers.type', 'types', 'COLUMN';

-- Query to modify the data type of the 'type' column in the 'demo' table.
ALTER TABLE demo ALTER COLUMN type INT;

-- Query to rename the 'type' column to 'types' in the 'demo' table.
EXEC sp_rename 'demo.type', 'types', 'COLUMN';
