-- 1. Bussiness summary

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_categories
FROM categories;

SELECT SUM(quantity) AS total_units_sold
FROM order_items;

-- 2.Monthly Order Analysis

SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY DATE_FORMAT(order_date,'%Y-%m')
ORDER BY month;

-- 3.Order Status Analysis

SELECT
    status,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY status
ORDER BY total_orders DESC;

-- 4.Monthly Cancelled Orders

SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS month,
    COUNT(order_id) AS cancelled_orders
FROM orders
WHERE status='Cancelled'
GROUP BY DATE_FORMAT(order_date,'%Y-%m')
ORDER BY month;

-- 5.Customerrs by State

SELECT
    state,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY state
ORDER BY total_customers DESC;

-- 6.Customers by City

SELECT
    city,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- 7.Most Loyal Customers

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- 9.Top Selling Products

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold DESC;

-- 10. Least Selling Products

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_units_sold ASC;

-- 11.Products by Category

SELECT
    c.category_id,
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
INNER JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_products DESC;

-- 12. Category Sales Analysis based on Units Sold

SELECT
    c.category_id,
    c.category_name,
    SUM(oi.quantity) AS total_units_sold
FROM categories c
INNER JOIN products p
ON c.category_id = p.category_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_units_sold DESC;

-- 13. Orders with Most Different products

SELECT
    order_id,
    COUNT(DISTINCT product_id) AS different_products
FROM order_items
GROUP BY order_id
ORDER BY different_products DESC;

-- 14. Orders with Highest Quantity

SELECT
    order_id,
    SUM(quantity) AS total_units
FROM order_items
GROUP BY order_id
ORDER BY total_units DESC;

-- 15. Average products per Order

SELECT
    ROUND(AVG(product_count),2) AS avg_products_per_order
FROM
(
    SELECT
        order_id,
        COUNT(DISTINCT product_id) AS product_count
    FROM order_items
    GROUP BY order_id
) AS order_summary;

-- 16. Average Units per Order

SELECT
    ROUND(AVG(total_units),2) AS avg_units_per_order
FROM
(
    SELECT
        order_id,
        SUM(quantity) AS total_units
    FROM order_items
    GROUP BY order_id
) AS order_summary;

-- 17. Premium Products

SELECT
    product_id,
    product_name,
    price
FROM products
ORDER BY price DESC;

-- 18. Lowest Priced Products

SELECT
    product_id,
    product_name,
    price
FROM products
ORDER BY price ASC;

-- 19. Average Price by Category

SELECT
    c.category_id,
    c.category_name,
    ROUND(AVG(p.price),2) AS average_price
FROM categories c
INNER JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
ORDER BY average_price DESC;

-- 20. Product Performance Report

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    SUM(oi.quantity) AS total_units_sold
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name,
    p.price
ORDER BY total_units_sold DESC;