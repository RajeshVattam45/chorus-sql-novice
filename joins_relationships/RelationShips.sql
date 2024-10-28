-- One-to-One Relationship.
CREATE TABLE student (
    id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    student_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE subjects (
    id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    maths INT NOT NULL,
    chemistry INT NOT NULL,
    physics INT NOT NULL,
    telugu INT NOT NULL,
    student_name VARCHAR(30),
    FOREIGN KEY (student_name) REFERENCES student(student_name)
);

INSERT INTO
    student (student_name)
VALUES
    ('Rajesh V'),
    ('Lokesh V'),
    ('Murali M');

INSERT INTO
    subjects (maths, chemistry, physics, telugu, student_name)
VALUES
    (20, 30, 40, 40, 'Rajesh V'),
    (20, 30, 40, 40, 'Lokesh V'),
    (20, 30, 40, 40, 'Murali M');

SELECT
    *
FROM
    student
    JOIN subjects ON student.student_name = subjects.student_name
ORDER BY
    subjects.id ASC;

-- One-To-Multiple Relationships.
-- Table for storing customer information.
CREATE TABLE customers_table (
    id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    customer_name VARCHAR(30),
    customer_email VARCHAR(30) NOT NULL UNIQUE
);

-- Table for storing product information.
CREATE TABLE customers_products (
    id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    product_id INT NOT NULL UNIQUE,
    product_name VARCHAR(30) NOT NULL
);

-- Table for storing orders with foreign key relationships.
CREATE TABLE customers_orders (
    id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    price INT NOT NULL,
    product_id INT,
    customer_email VARCHAR(30),
    FOREIGN KEY (customer_email) REFERENCES customers_table(customer_email),
    FOREIGN KEY (product_id) REFERENCES customers_products(product_id)
);


INSERT INTO customers_table (customer_name, customer_email)
VALUES
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Smith', 'bob.smith@example.com'),
    ('Charlie Brown', 'charlie.brown@example.com'),
    ('David Williams', 'david.williams@example.com'),
    ('Emma Watson', 'emma.watson@example.com');

INSERT INTO customers_products (product_id, product_name)
VALUES
    (1, 'Laptop'),
    (2, 'Smartphone'),
    (3, 'Tablet'),
    (4, 'Smartwatch'),
    (5, 'Headphones');

INSERT INTO customers_orders (order_id, price, product_id, customer_email)
VALUES
    (101, 1000, 1, 'alice@example.com'),
    (102, 500,  2, 'alice@example.com'),
    (103, 300,  3, 'bob.smith@example.com'),
    (104, 200,  4, 'charlie.brown@example.com'),
    (105, 150,  5, 'emma.watson@example.com'),
    (106, 1000, 1, 'bob.smith@example.com'),
    (107, 500,  2, 'charlie.brown@example.com'),
    (108, 300,  3, 'emma.watson@example.com'),
    (109, 200,  4, 'david.williams@example.com'),
    (110, 150,  5, 'david.williams@example.com');

