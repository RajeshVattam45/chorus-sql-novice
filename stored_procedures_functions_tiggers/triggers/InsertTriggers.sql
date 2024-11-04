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