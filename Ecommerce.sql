USE ecommerce_db;

-- section - Data validation

#10

Select customer_id From Orders
Where customer_id NOT IN (select customer_id from customers);

# Every order have valid customer_id


#11

Select o.order_id From orders as o
JOIN payments as p
ON o.order_id = p.order_id
Where p.payment_status LIKE "Failed" or p.payment_status LIKE "Pending";

#This gives order id, where payment status is either failed or pending.



#12

Select order_id From Payments
Where order_id NOT IN (select order_id from orders);

#This checks whether every order_id present in or referenced in Payment table  is related to orginal order_id present in orders table.




-- Basic Queries

-- Retrieve all customer details.
Select * From Customers;


-- List all orders with their total amount and status.
Select order_id,total_amount,status From Orders;


-- Find all products that belong to the ‘Electronics’ category.
Select product_id,product_name From Products
Where category LIKE "Electronics";



-- Intermediate Queries (Joins & Aggregations)


-- Find the total number of orders placed by each customer (customer_id and count)
Select CONCAT(c.first_name," ",c.last_name) as customer_name,COUNT(o.order_id) as Orders_placed
From Customers as c
JOIN Orders as o
ON c.customer_id = o.customer_id
Group By customer_name
Order By Orders_placed DESC;



-- Retrieve a list of all orders, including customer names and order status.
Select CONCAT(c.first_name," ",c.last_name) as customer_name,o.order_id as orders,o.status as order_status
From Customers as c
JOIN Orders as o
ON c.customer_id = o.customer_id;


-- Find the total revenue (sum of all orders) generated.
Select ROUND(SUM(total_amount)) as total_revenue From orders;


-- Identify customers who have placed more than 3 orders.
Select CONCAT(c.first_name," ",c.last_name) as customer_name,COUNT(o.order_id) as Orders_placed
From Customers as c
JOIN Orders as o
ON c.customer_id = o.customer_id
Group By customer_name
Having Orders_placed > 3
Order By Orders_placed DESC;

-- Retrieve all completed payments and include the associated order details.
Select order_id,customer_id,order_date,total_amount From Orders
Where order_id IN (Select order_id From Payments Where payment_status = "Completed");


-- Advanced Queries


-- Find the top 5 customers who have spent the most on orders.
Select CONCAT(c.first_name," ",c.last_name) as customer_name,ROUND(SUM(o.total_amount)) as Amount_Spent
From Customers as c
JOIN Orders as o
ON c.customer_id = o.customer_id
Group By customer_name
Order BY Amount_Spent desc
LIMIT 5;


-- List all orders where the payment was either ‘Pending’ or ‘Failed’.
Select o.order_id,o.order_date From orders as o
JOIN payments as p
ON o.order_id = p.order_id
Where p.payment_status LIKE "Failed" or p.payment_status LIKE "Pending";



-- Find the most popular product category based on the number of orders.
Select p.category,COUNT(o.Order_id) as number_of_orders From products as p
JOIN Orders as o
ON o.Product_id = p.product_id
Group By p.category
Order By number_of_orders DESC;

# Books are most popular category



-- Identify orders that were placed but have no successful payment recorded.

Select o.order_id From orders as o
JOIN payments as p
ON o.order_id = p.order_id
Where (o.status LIKE "Delivered" or o.status LIKE "Shipped") 
and (p.payment_status LIKE "Failed" or p.payment_status LIKE "Pending" or p.payment_status LIKE "Refunded");


-- Calculate the average order value (AOV) per customer.
Select CONCAT(c.first_name," ",c.last_name) as customer_name,AVG(o.total_amount) as AOV
From Customers as c
JOIN Orders as o
ON c.customer_id = o.customer_id
Group By customer_name;


-- Business-Oriented Analytical Questions



-- Identify which payment method is most commonly used.
Select payment_method,COUNT(order_id) as no_of_times_used From payments
Group By payment_method
Order By no_of_times_used DESC;


-- Determine the percentage of orders that were canceled.
Select (COUNT(order_id)/(Select COUNT(order_id) From orders))*100 as percentage_of_orders_Cancelled
From Orders where status = "Cancelled";



-- Find out the month in which the most orders were placed.
Select MONTH(order_date) as Month,COUNT(order_id) as total_orders From orders
Group BY MONTH(order_date)
Order BY total_orders DESC;
