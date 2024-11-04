-- Trigger to log deletions from triggers_table.
CREATE TRIGGER trg_after_delete
ON triggers_table
-- Specifies that this trigger will fire after a DELETE operation.
AFTER DELETE
AS
BEGIN
-- Query to insert deleted record into delete_trigger_table.
    INSERT INTO delete_trigger_table (
        original_id,
        name,
        email,
        type
    )
    SELECT 
        d.id,
        d.name, 
        d.email, 
        d.type 
    FROM deleted d;
END;

DELETE FROM triggers_table WHERE id = 1;
