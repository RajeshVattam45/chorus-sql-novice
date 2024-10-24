-- Query to update a specific record in the 'customers' table.
UPDATE
    customers
SET
    customer_name = 'Rajesh v'
WHERE
    customer_name = 'Elijah Nelson';

-- Query to update customer names and emails in the 'customers' table.
UPDATE
    customers
SET
    customer_name = CASE
        WHEN customer_name = 'Lokesh V' THEN 'Lokesh V'
        WHEN customer_name = 'Murali M' THEN 'Murali M'
    END,
    customer_mail = CASE
        WHEN customer_mail = 'abigail.hill@example.com' THEN 'rajesh.v@example.com'
        WHEN customer_mail = 'noah.adams@example.com' THEN 'lokesh.v@example.com'
    END
WHERE
    customer_name IN (
        'Lokesh V',
        'Murali M',
        'Noah Adams',
        'Amelia Scott'
    )
    OR customer_mail IN (
        'abigail.hill@example.com',
        'noah.adams@example.com'
    );