-- Trigger to log updates made to records in triggers_table.
CREATE TRIGGER update_trigger
ON triggers_table
-- Specifies that this trigger will fire after an UPDATE operation.
AFTER UPDATE
    AS
    BEGIN
-- Insert the updated record's details into update_trigger_table.
INSERT INTO
    update_trigger_table (
        original_id,
        old_name,
        new_name,
        old_email,
        new_email,
        old_type,
		new_type
    )
SELECT
    d.id,
    d.name,
    i.name,
    d.email,
    i.email,
    d.type,
    i.type
FROM
    deleted d
    INNER JOIN inserted i ON d.id = i.id;
END;


UPDATE triggers_table
SET name = 'Lokesh V', email = 'lokesh.v@example.com', type = 'qa'
WHERE id = 1;

-- Query to drop the table.
DROP TRIGGER update_trigger;
