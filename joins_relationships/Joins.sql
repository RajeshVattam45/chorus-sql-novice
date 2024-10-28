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

