-- Available Tables
-- Show tables

-- Customers Table ---------------------------------------------------------------------------------------

-- select count(distinct customer_id) from customers
-- select distinct state from customers
-- select distinct city from customers

-- select state, count(*) as total_customers from customers
--  group by state
-- order by total_customers desc

-- select city, count(*) as total_customers from customers
-- group by city
-- order by total_customers desc

-- select customer_id,count(*) from customers
-- group by customer_id
-- having count(*) > 1

-- Orders Table -----------------------------------------------------------------------------------------

 -- select count(*) from orders 
-- select count(customer_id)  from orders
-- select count( distinct customer_id) as unique_customers from orders 

-- select status,count(*) total_orders from orders
-- group by status

-- select date_format(order_date, '%y-%m') as month,
-- count(*) as total_orders from orders
-- group by date_format(order_date, '%y-%m')
-- order by month

-- select date_format(order_date, '%y- %m') as month,
-- count(order_id) as total_orders,status from orders
-- group by date_format(order_date, '%y- %m'),status
-- order by month

-- select min(order_date) as first_order,
-- max(order_date) as last_order from orders

-- Order_items Table --------------------------------------------------------------------------------------------

-- select count(*) as total_orders_items  from order_items
-- select sum(quantity) as total_sold from order_items 

-- select order_id,sum(quantity) as units_sold from order_items
-- group by order_id
-- order by units_sold desc

-- select product_id, sum(quantity) as units from order_items
-- group by product_id
-- order by units desc

-- select order_id,count(product_id) as total_products from order_items
-- group by order_id
-- order by total_products desc

-- select avg(quantity) as average_quantity from order_items

-- select avg(product_count) as avg_products_per_order
--  from (select order_id, count(product_id) as product_count
--         from order_items group by order_id ) as t;

-- Products Table -----------------------------------------------

-- select * from products limit 5
-- select count(distinct product_id) as total_products from products
 
-- select min(price) as lowest_price,
-- max(price) as highest_price from products

-- select category_id,count(*) as total_products from products
-- group by category_id

-- select count(distinct category_id) as total_categories from products

-- Category Table -----------------------------------------------------------------------------------------

-- select * from categories 
-- select count(*) from categories

