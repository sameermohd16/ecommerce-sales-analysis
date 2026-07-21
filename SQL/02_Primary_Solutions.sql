-- Business summary

-- select count(*) as total_customers from customers
-- select count(*) as total_orders from orders
-- select count(*) as total_products from products
-- count(*) as total_categories from categories
-- select sum(quantity) as total_units_sold from order_items 

-- Customers change

-- select date_format(order_date, '%y-%m') as month,
-- count( order_id) as total_orders from orders
-- group by date_format(order_date, '%y-%m') 

-- Order Fulfilment  

-- select status,count(order_id) as total_orders 
-- from orders
-- group by status

-- Month-wise cancelled orders

-- select date_format(order_date,'%y-%m') as month,
-- count(order_id) as cancelled_orders
-- from orders
-- where status = 'Cancelled'
-- group by date_format(order_date,'%y-%m')
-- order by month

-- States with highest customers

-- select state, count(customer_id) as total_customers
-- from customers
-- group by state
-- order by total_customers desc

-- Cities with highest customers

-- select city, count(customer_id) as total_customers
-- from customers
-- group by city
-- order by total_customers desc

-- Most loyal customers

-- select c.customer_name,count(o.order_id) as total_orders
-- from orders o
-- inner join customers c
-- on o.customer_id = c.customer_id
-- group by c.customer_name
-- order by total_orders desc

-- Customer retention

-- select c.customer_name, count(o.order_id) as total_orders
-- from orders o 
-- inner join customers c
-- on o.customer_id = c.customer_id
-- group by c.customer_id,c.customer_name
-- having total_orders = 1

-- High Demand Products

-- select p.product_name,sum(oi.quantity) as total_units_sold
-- from order_items oi
-- inner join products p
-- on oi.product_id = p.product_id
-- group by p.product_name
-- order by total_units_sold desc

-- Slow moving products 

-- select p.product_name,sum(oi.quantity) as total_units_sold
-- from order_items oi
-- inner join products p
-- on oi.product_id = p.product_id
-- group by p.product_name
-- order by total_units_sold asc

-- product catalogue review 

-- select ca.category_name,count( p.product_id) as total_products
-- from products p
-- left join categories ca
-- on p.category_id = ca.category_id
-- group by ca.category_name

-- Category performance

-- select   ca.category_name,sum(oi.quantity) as total_sales
-- from order_items oi
-- inner join orders o
-- on o.order_id = oi.order_id
-- inner join products p
-- on oi.product_id = p.product_id
-- inner join categories ca
-- on p.category_id = ca.category_id
-- group by ca.category_name

-- Different products in orders

-- select  order_id,count(distinct product_id) as different_products
-- from order_items oi
-- group by order_id
-- order by different_products desc

-- Packing workload

-- select order_id,sum(quantity) as total_units
-- from order_items
-- group by order_id
-- order by total_units desc

-- Average number of products in a single order

-- select order_id,round(avg(product_count),0) as avg_products
-- from ( select order_id,count(distinct product_id) as product_count
--        from order_items
-- 		group by order_id ) as t
-- group by order_id
-- order by avg_products desc;

-- Correct solution
-- select round(avg(product_count),2) as avg_products_per_order
-- from ( select order_id,count (distinct product_id) as product_count
--        from order_items
-- 	   group by order_id ) as t
-- order by avg_products_per_order desc;

-- Average products units purchased per order 

-- select order_id, round((total_units),0)as avg_units
-- from ( select order_id,sum(quantity) as total_units
--        from order_items
-- 	   group by order_id ) as t
-- group by order_id
-- order by avg_units desc

-- Correct solution
-- select  round(avg(total_units),2)as avg_units_per_order
-- from ( select order_id,sum(quantity) as total_units
--        from order_items
-- 	   group by order_id ) as t
-- order by avg_units_per_order desc

-- premium products

-- select product_name,price from products
-- order by price desc

-- lowest priced products 

-- select product_name,price from products
-- order by price asc

-- Average price per category

-- select category_name,round(avg(p.price),2) as avg_price
-- from products p
-- inner join categories ca
-- on p.category_id = ca.category_id
-- group by ca.category_name
-- order by avg_price desc

-- product performance report

-- select p.product_name,
-- ca.category_name,
-- p.price,
-- sum(oi.quantity) as units_sold
-- from order_items oi
-- inner join products p 
-- on oi.product_id = p.product_id
-- inner join categories ca
-- on p.category_id = ca.category_id
-- group by p.product_id,p.product_name,p.price,ca.category_name
-- order by units_sold desc


