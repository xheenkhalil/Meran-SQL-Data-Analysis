-- --------------- MERAN STORE ANALYSIS-US -----------------------------------
CREATE DATABASE meran_store;

-- Data details --------
-- 1. There are 5 tables containing various informations about the store
-- ---------------------------------------------------------------------------

-- Questions for each TABLE 
-- ------------------------------------------------

-- 1. --- ---- Customers Table --------------------------------

-- How many customers are registered in the database?
SELECT COUNT(*) AS total_customers
FROM customers;

-- Which states has the highest number of customers?
SELECT state, COUNT(*) AS customer_count
FROM customers
GROUP BY state
ORDER BY customer_count DESC
LIMIT 5;

-- How many customers registered each month?
SELECT DATE_FORMAT(registration_date, '%Y-%m') AS registration_month, COUNT(*) AS new_customers
FROM customers
GROUP BY registration_month
ORDER BY registration_month;

-- What is the distribution of customers by city?
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;

-- Which customer has the most recent registration date?
SELECT customer_id, first_name, last_name, registration_date
FROM customers
ORDER BY registration_date DESC
LIMIT 1;

-- How many customers have provided a phone number?
SELECT COUNT(*) AS customers_with_phone
FROM customers
WHERE phone IS NOT NULL AND phone != '';

-- What is the average length of customer names (first name + last name)?
SELECT AVG(LENGTH(CONCAT(first_name, ' ', last_name))) AS avg_name_length
FROM customers;

-- Which email domain (e.g., gmail.com, yahoo.com) is most commonly used?
SELECT SUBSTRING_INDEX(email, '@', -1) AS email_domain, COUNT(*) AS domain_count
FROM customers
GROUP BY email_domain
ORDER BY domain_count DESC
LIMIT 1;

-- How many customers are from each ZIP code?
SELECT zip_code, COUNT(*) AS customer_count
FROM customers
GROUP BY zip_code
ORDER BY customer_count DESC;

-- What is the total number of unique cities in the customer database?
SELECT COUNT(DISTINCT city) AS unique_cities
FROM customers;


-- 2. -- ---Products Table ------------------------------------

-- How many products are available in each category?
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;

-- What is the average price of products in each category?
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- Which product is the most expensive?
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;

-- Which product has the highest stock quantity?
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity DESC
LIMIT 5;

-- How many products are out of stock (stock_quantity = 0)?
SELECT COUNT(*) AS out_of_stock_products
FROM products
WHERE stock_quantity = 0;

-- Which supplier provides the most products?
SELECT supplier, COUNT(*) AS product_count
FROM products
GROUP BY supplier
ORDER BY product_count DESC
LIMIT 1;

-- What is the total value of all products in stock (price * stock_quantity)?
SELECT SUM(price * stock_quantity) AS total_stock_value
FROM products;

-- What is the price range (min, max) of products in each category?
SELECT category, MIN(price) AS min_price, MAX(price) AS max_price
FROM products
GROUP BY category;

-- How many products have a price above $500?
SELECT COUNT(*) AS products_above_500
FROM products
WHERE price > 500;

-- Which product has the lowest stock quantity?
SELECT product_name, stock_quantity
FROM products
ORDER BY stock_quantity ASC
LIMIT 1;


-- ----3. Orders Table ------------------
-- How many orders have been placed in total?
SELECT COUNT(*) AS total_orders
FROM orders;

-- What is the total revenue generated from all orders?
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- How many orders are in each status (e.g., Pending, Shipped, Delivered)?
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- What is the average order value (total_amount)?
SELECT AVG(total_amount) AS average_order_value
FROM orders;

-- Which month had the highest number of orders?
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, COUNT(*) AS order_count
FROM orders
GROUP BY order_month
ORDER BY order_count DESC
LIMIT 1;

-- What is the total revenue generated each month?
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- How many orders were placed by each customer?
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC;

-- What is the highest total amount for a single order?
SELECT MAX(total_amount) AS highest_order_amount
FROM orders;

-- How many orders were canceled?
SELECT COUNT(*) AS canceled_orders
FROM orders
WHERE status = 'Cancelled';

-- What is the distribution of orders by day of the week?
SELECT DAYNAME(order_date) AS day_of_week, COUNT(*) AS order_count
FROM orders
GROUP BY day_of_week
ORDER BY order_count DESC;




-- ---4. Order_Items Table------------------

-- How many items have been ordered in total?
SELECT SUM(quantity) AS total_items_ordered
FROM order_items;

-- What is the total quantity of each product sold?
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC;

-- Which product has been ordered the most (by quantity)?
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 1;

-- What is the average quantity of items per order?
SELECT AVG(quantity) AS avg_quantity_per_order
FROM order_items;

-- What is the total revenue generated by each product?
SELECT product_id, SUM(quantity * price_per_unit) AS total_revenue
FROM order_items
GROUP BY product_id
ORDER BY total_revenue DESC;

-- How many unique products have been ordered?
SELECT COUNT(DISTINCT product_id) AS unique_products_ordered
FROM order_items;

-- What is the average price per unit for each product?
SELECT product_id, AVG(price_per_unit) AS avg_price_per_unit
FROM order_items
GROUP BY product_id
ORDER BY avg_price_per_unit DESC;

-- Which order has the most items?
SELECT order_id, SUM(quantity) AS total_items
FROM order_items
GROUP BY order_id
ORDER BY total_items DESC
LIMIT 1;

-- What is the total revenue generated from order items?
SELECT SUM(quantity * price_per_unit) AS total_revenue
FROM order_items;

-- How many items were sold at a discounted price (price_per_unit < original price)?
SELECT COUNT(*) AS discounted_items
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE oi.price_per_unit < p.price;


-- ----5. Payments Table------------------

-- How many payments have been made in total?
SELECT COUNT(*) AS total_payments
FROM payments;

-- What is the total amount of payments received?
SELECT SUM(amount) AS total_payments_received
FROM payments;

-- Which payment method is the most popular?
SELECT payment_method, COUNT(*) AS payment_count
FROM payments
GROUP BY payment_method
ORDER BY payment_count DESC
LIMIT 1;

-- What is the total amount paid using each payment method?
SELECT payment_method, SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;

-- How many payments were made each month?
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS payment_month, COUNT(*) AS payment_count
FROM payments
GROUP BY payment_month
ORDER BY payment_month;

-- What is the average payment amount?
SELECT AVG(amount) AS average_payment_amount
FROM payments;

-- Which order has the highest payment amount?
SELECT order_id, MAX(amount) AS highest_payment_amount
FROM payments
GROUP BY order_id
ORDER BY highest_payment_amount DESC
LIMIT 1;

-- How many payments were made for orders with a status of "Cancelled"?
SELECT COUNT(*) AS payments_for_cancelled_orders
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE o.status = 'Cancelled';

-- What is the distribution of payment amounts (e.g., <100,100,100-500,>500,>500)?
SELECT 
    CASE 
        WHEN amount < 100 THEN '<$100'
        WHEN amount BETWEEN 100 AND 500 THEN '$100-$500'
        ELSE '>$500'
    END AS payment_range,
    COUNT(*) AS payment_count
FROM payments
GROUP BY payment_range
ORDER BY payment_range;

-- Are there any orders with missing payments?
SELECT o.order_id, o.order_date, o.total_amount
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;



-- -- 6. Cross-Table Analysis--------------------

-- Which customer has spent the most in total?
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- What is the total revenue generated by each product category?
SELECT p.category, SUM(oi.quantity * oi.price_per_unit) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- Which product category has the highest average order value?
SELECT p.category, AVG(o.total_amount) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_order_value DESC
LIMIT 1;

-- How many customers have not placed any orders?
SELECT COUNT(*) AS customers_without_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- What is the total revenue generated by customers from each state?
SELECT c.state, SUM(o.total_amount) AS state_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY state_revenue DESC;

-- Which supplier’s products have generated the most revenue?
SELECT p.supplier, SUM(oi.quantity * oi.price_per_unit) AS supplier_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.supplier
ORDER BY supplier_revenue DESC
LIMIT 1;

-- What is the average time between order date and payment date?
SELECT AVG(DATEDIFF(p.payment_date, o.order_date)) AS avg_payment_delay
FROM orders o
JOIN payments p ON o.order_id = p.order_id;

-- Which product has the highest profit margin (price_per_unit - cost)?
SELECT p.product_name, AVG(oi.price_per_unit - p.price) AS avg_profit_margin
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_profit_margin DESC
LIMIT 1;

-- How many orders include products from multiple categories?
SELECT COUNT(DISTINCT o.order_id) AS orders_with_multiple_categories
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING COUNT(DISTINCT p.category) > 1;

-- What is the customer retention rate (customers with more than one order)?
SELECT COUNT(*) AS retained_customers
FROM (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS retained;

-- -- Desclaimer: All data in this project are synthetic data.---------



