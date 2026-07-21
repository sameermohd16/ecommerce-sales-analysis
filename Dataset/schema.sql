CREATE DATABASE indian_ecommerce;
USE indian_ecommerce;

CREATE TABLE categories(category_id INT PRIMARY KEY, category_name VARCHAR(50));
CREATE TABLE products(product_id INT PRIMARY KEY, product_name VARCHAR(100), category_id INT, price DECIMAL(10,2));
CREATE TABLE customers(customer_id INT PRIMARY KEY, customer_name VARCHAR(100), city VARCHAR(50), state VARCHAR(50));
CREATE TABLE orders(order_id INT PRIMARY KEY, customer_id INT, order_date DATE, status VARCHAR(20));
CREATE TABLE order_items(order_item_id INT PRIMARY KEY, order_id INT, product_id INT, quantity INT);
