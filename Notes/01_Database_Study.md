Customers Table---------------------------------------------------------------------------------------



Customer table stores the details of customers who placed orders and registered in company.

It records customer name and customers location.



This table consists of various columns like customer id, customer name, customer city, customer state



Primary key is customer-id



Observations

* There are total 100 customers.
* These customers live in total 7 states of India, mostly southern states.
* Maharashtra and Karnataka recorded majority of customers.







Orders Table ----------------------------------------------------------------------------------------------



Order table stores the information about every order placed by customers.

It records when an order was placed, which customer placed it, and the order status.

Each row represents one order.



This tables consists of various columns like order id, customer id, order date, status.



Primary key is order-id and foreign key is customer-id.



Observations



* There are 500 orders placed in total
* There are 100 unique customers.
* Customers can place various orders multiple times on different dates.
* Every order is tracked by status like delivered, cancelled, pending.
* 90% of the orders where delivered successfully.
* March and may recorded the highest number of orders during this period.







Order-items-Table ------------------------------------------------------------------------------------------



Order-items-table stores the details of customer orders in sequential list.

It records list of orders placed, different products ordered in each order with total quantity of product.



This tables consists of various columns like order-item-id, order id, product id, quantity.



Primary key is order-item-id and foreign keys are order id, product id.



Observations



* The table contains 1230 order item records, where each row represents one product is added into order.
* This table acts a bridge between orders table and products table.
* Almost 2000+ units of products have been sold by company.
* Few orders contain more products than other orders, this shows few customers ordered many products then other.
* Some products have significantly higher units sold than others.
* Average quantity ordered per order and average different products ordered per order is low.





Products Table -----------------------------------------------------------------------------------------------



Products table stores the details of various products that have been listed by company to sale.

It records the products with specific unique id with product price and its specific category with category id.



Table contains columns like product id,  product name, category id, price.

Each row represents product details with price.



Primary key is Product-id and foreign key is category-id.



Observations



* Table contains total 30 different products listed.
* Products catalog contain items across various price ranges, indicating mix of budget and premium products.
* There are total 8 different category products listed.
* The products distribution among different categories is almost evenly managed.



Categories Table ---------------------------------------------------------------------------------------------



Categories tables stores the different categories with unique ids.



Primary key is category-id.



Observations

* 
* There 8 distinct categories listed.
* Each row represents category name and category id.
* The company offer products across various categories, provides diverse products catalog.





Database Summary ------------------------------------------------------------------------------------------



• Total Customers : 100



• Total Orders : 500



• Total Order Items : 1230



• Total Products : 30



• Total Categories : 8



• Dataset Duration : January 2026 – June 2026





