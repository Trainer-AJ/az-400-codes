-- Create a new database
CREATE DATABASE tbt_14_feb;

-- Connect to the new database
\c tbt_14_feb;

-- Create a table to store information about users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATE
);

-- Insert some sample data into the users table
INSERT INTO users (username, email, birthdate) VALUES
    ('john_doe', 'john.doe@example.com', '1990-05-15'),
    ('jane_smith', 'jane.smith@example.com', '1985-09-20'),
    ('bob_jones', 'bob.jones@example.com', '1978-03-10');

-- Create a table to store information about products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Insert some sample data into the products table
INSERT INTO products (product_name, price) VALUES
    ('Laptop', 999.99),
    ('Smartphone', 599.99),
    ('Headphones', 99.99);

-- Create a table to store information about orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Insert some sample data into the orders table
INSERT INTO orders (user_id, product_id, quantity, order_date) VALUES
    (1, 1, 2, '2024-02-13 10:00:00'),
    (2, 2, 1, '2024-02-13 11:30:00'),
    (3, 3, 3, '2024-02-13 12:45:00');

-- show all tables
--  \dt or \dt+ command in psql to show tables in a specific database
 \dt
-- Query to display all users
SELECT * FROM users;

-- Query to display all products
SELECT * FROM products;

-- Query to display all orders
SELECT * FROM orders;
