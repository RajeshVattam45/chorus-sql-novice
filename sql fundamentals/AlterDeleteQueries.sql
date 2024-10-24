-- Query to add an extra column 'type' to the 'customers' table.
ALTER TABLE customers ADD type VARCHAR(20);

-- Query to delete the 'type' column from the 'customers' table.
ALTER TABLE customers DROP COLUMN type;

-- Query to delete 'customers' table.
-- Note: The DROP TABLE command permanently deletes the table along with all its data. 
-- This action cannot be undone, so use it with caution. 
DROP TABLE customers;

-- Query to add two extra columns 'name' and 'type' to the 'demo' table.
ALTER TABLE demo ADD name VARCHAR(20), type VARCHAR(20) NOT NULL;

-- Query to delete a specific row where 'id' is 1 from the 'demo' table.
DELETE FROM demo WHERE id = 1;

-- Query to delete the 'type' column from the 'demo' table.
ALTER TABLE demo DROP COLUMN type;

-- Query to delete 'demo' table
-- Note: The DROP TABLE command permanently deletes the table along with all its data. 
-- This action cannot be undone, so use it with caution. 
DROP TABLE demo;
