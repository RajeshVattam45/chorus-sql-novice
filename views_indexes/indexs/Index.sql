-- Query to create index table.
CREATE TABLE index_table (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    role VARCHAR(30) NOT NULL,
    type VARCHAR(30) NOT NULL
);

-- Query to create index to columns in a table.
CREATE INDEX indexs ON index_table (id, name);

-- Show all indexes on 'index_table'.
EXEC sp_helpindex 'index_table';

-- Query to delete the index
DROP INDEX indexs ON index_table;
