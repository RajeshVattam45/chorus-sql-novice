-- Query to join the both tables and return the data.
SELECT
    *
FROM
    table_one
    JOIN table_two ON table_one.user_id = table_two.user_id;

-- Inner join.
SELECT
    *
FROM
    student
    INNER JOIN subjects ON subjects.student_name = student.student_name;

-- Left Join.
SELECT
    *
FROM
    student
    LEFT JOIN subjects ON subjects.student_name = student.student_name;

-- Right join.
SELECT DISTINCT
    customers_table.customer_name,
    customers_table.customer_email,
    customers_orders.order_id
FROM
    customers_table
    RIGHT JOIN customers_orders ON customers_orders.customer_email = customers_table.customer_email;

-- Full join.
SELECT
    *
FROM
    table_one FULL
    JOIN table_two ON table_one.user_id = table_two.user_id;

-- Self join.
SELECT
    t1.user_id,
    t1.user_name
FROM
    table_one t1
    INNER JOIN table_one t2 ON t1.user_id = t2.user_id;

-- Cross join.
SELECT
    t1.user_name,
    t2.customer_name
FROM
    table_one t1
    CROSS JOIN table_two t2;

-- Joining All Four Tables.
SELECT
    t1.user_name AS user_name,
    t2.customer_name AS table_two_customer_name,
    d1.name AS demo_one_name,
    d2.customer_name AS demo_two_customer_name
FROM
    table_one t1
    INNER JOIN table_two t2 ON t1.user_id = t2.user_id
    INNER JOIN demo_one d1 ON d1.id = t2.customer_id
    INNER JOIN demo_two d2 ON d1.id = d2.id;

-- Query for bulk update.
UPDATE
    table_two
SET
    salary = CASE
        -- If user type is Admin, increase salary by 20%.
        WHEN t1.user_type = 'Admin' THEN salary * 1.2
        -- If user type is User, Increase by 10% for Staff.
        WHEN t1.user_type = 'User' THEN salary * 1.1
        ELSE salary
    END
FROM
    table_two t2
    INNER JOIN table_one t1 ON t2.user_id = t1.user_id;
