CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    age INT
);
INSERT INTO customers
VALUES
(1,'Akshara','Delhi',22),
(2,'Rahul','Mumbai',25),
(3,'Priya','Bhopal',21),
(4,'Aman','Lucknow',24),
(5,'Neha','Pune',23);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price INT
);
INSERT INTO products
VALUES
(101,'Laptop','Electronics',50000),
(102,'Mobile','Electronics',25000),
(103,'Headphones','Accessories',2000),
(104,'Shoes','Fashion',3000),
(105,'Watch','Fashion',5000);
SELECT * FROM products;
SELECT * FROM products;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT
);
INSERT INTO orders
VALUES
(1,1,101,1),
(2,2,102,2),
(3,3,103,1),
(4,1,104,3),
(5,5,105,1);
SELECT * FROM orders;
USE ecommerce_db;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT
);
INSERT INTO orders
VALUES
(1,1,101,1),
(2,2,102,2),
(3,3,103,1),
(4,1,104,3),
(5,5,105,1);
SELECT
c.customer_name,
p.product_name,
o.quantity
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN products p
ON p.product_id = o.product_id;
SELECT
p.category,
SUM(o.quantity) AS total_items_sold
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category;
SELECT
    city,
    COUNT(*) AS total_customers
FROM customers
GROUP BY city;
SELECT
    p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
SELECT
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
SELECT
    category,
    AVG(price) AS avg_price
FROM products
GROUP BY category;