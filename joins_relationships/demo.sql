CREATE TABLE demo_one (
    id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    type VARCHAR(30) NOT NULL
);

CREATE TABLE demo_two (
    customer_id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    customer_name VARCHAR(30) NOT NULL,
    customer_mail VARCHAR(30) NOT NULL,
    id INT,
    FOREIGN KEY (id) REFERENCES demo_one(id)
);

INSERT INTO
    demo_one (name, type)
VALUES
    ('Rajesh', 'DEV'),
    ('lokesh', 'QA'),
    ('John', 'DEV'),
    ('Jerry', 'QA'),
    ('Max', 'DEV');

INSERT INTO
    demo_two (customer_name, customer_mail, id)
VALUES
    ('Rajesh', 'rajesh.v@gmail.com', 1),
    ('Lokesh', 'lokesh.v@gmail.com', 2),
    ('Jhon', 'jhon.w@gmail.com', 3),
    ('Jerry', 'jerry.h@gmail.com', 4);
