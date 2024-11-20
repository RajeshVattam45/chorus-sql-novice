-- Trigger to log insertions into triggers_table.
CREATE TRIGGER after_insert ON triggers_table
-- Specifies that this trigger will fire after an INSERT operation.
AFTER INSERT
    AS BEGIN
-- Insert the new record's into insert_trigger_table.
INSERT INTO
    insert_trigger_table (original_id, name, email, type)
SELECT
    id,
    name,
    email,
    type
FROM
    inserted;

END;

INSERT INTO
    triggers_table (name, email, type)
VALUES
    ('Rajesh V', 'rajesh.v@example.com', 'dev');

-- Create an INSTEAD OF INSERT trigger for the `triggers_table`.
CREATE TRIGGER instead_of_insert ON triggers_table
INSTEAD OF INSERT
AS
BEGIN
    -- inserts only if 'type' is 'dev' or 'qa'.
    IF EXISTS (SELECT * FROM inserted WHERE type NOT IN ('dev', 'qa'))
    BEGIN
        THROW 50001, 'Invalid "type". Only "dev" or "qa" allowed.', 1;
    END

    -- Proceed with the INSERT operation.
    INSERT INTO triggers_table (name, email, type)
    SELECT name, email, type FROM inserted;
END;

-- Query to insert data with proper type.
INSERT INTO triggers_table (name, email, type)
VALUES ('John Doe', 'john@example.com', 'dev');

-- This will fail with an error message.
INSERT INTO triggers_table (name, email, type)
VALUES ('Jane Doe', 'jane@example.com', 'manager');
