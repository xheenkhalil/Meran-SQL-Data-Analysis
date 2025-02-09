# Meran-SQL-Data-Analysis
---
 **Dataset Documentation: E-Commerce Retail Platform**

### **Overview**
This dataset simulates a **retail e-commerce platform** and contains transactional data related to customers, products, orders, order items, and payments. The dataset is designed to support **SQL-based analysis** and provides insights into customer behavior, product performance, sales trends, and payment patterns.

The dataset consists of **five tables**:
1. **Customers**: Contains customer demographic and registration details.
2. **Products**: Contains product details, including pricing and stock information.
3. **Orders**: Contains order details, including order dates, total amounts, and statuses.
4. **Order_Items**: Contains details of individual items within each order.
5. **Payments**: Contains payment details for orders.

---

### **Table Descriptions**

#### **1. Customers Table**
This table stores information about the platform's registered customers.

| Column Name        | Data Type | Description                                      |
|--------------------|-----------|--------------------------------------------------|
| `customer_id`      | INT       | Unique identifier for each customer (Primary Key).|
| `first_name`       | VARCHAR   | Customer's first name.                           |
| `last_name`        | VARCHAR   | Customer's last name.                            |
| `email`            | VARCHAR   | Customer's email address.                        |
| `phone`            | VARCHAR   | Customer's phone number.                         |
| `address`          | VARCHAR   | Customer's address.                              |
| `city`             | VARCHAR   | Customer's city.                                 |
| `state`            | VARCHAR   | Customer's state.                                |
| `zip_code`         | VARCHAR   | Customer's ZIP code.                             |
| `registration_date`| DATE      | Date the customer registered on the platform.    |

---

#### **2. Products Table**
This table stores information about the products available on the platform.

| Column Name        | Data Type | Description                                      |
|--------------------|-----------|--------------------------------------------------|
| `product_id`       | INT       | Unique identifier for each product (Primary Key).|
| `product_name`     | VARCHAR   | Name of the product.                             |
| `category`         | VARCHAR   | Category of the product (e.g., Electronics).     |
| `price`            | DECIMAL   | Price of the product.                            |
| `stock_quantity`   | INT       | Quantity of the product in stock.                |
| `supplier`         | VARCHAR   | Name of the supplier.                            |

---

#### **3. Orders Table**
This table stores information about customer orders.

| Column Name        | Data Type | Description                                      |
|--------------------|-----------|--------------------------------------------------|
| `order_id`         | INT       | Unique identifier for each order (Primary Key).  |
| `customer_id`      | INT       | Identifier linking to the customer (Foreign Key).|
| `order_date`       | DATE      | Date the order was placed.                       |
| `total_amount`     | DECIMAL   | Total amount of the order.                       |
| `status`           | VARCHAR   | Status of the order (e.g., Pending, Delivered).  |

---

#### **4. Order_Items Table**
This table stores details of individual items within each order.

| Column Name        | Data Type | Description                                      |
|--------------------|-----------|--------------------------------------------------|
| `order_item_id`    | INT       | Unique identifier for each order item (Primary Key).|
| `order_id`         | INT       | Identifier linking to the order (Foreign Key).   |
| `product_id`       | INT       | Identifier linking to the product (Foreign Key). |
| `quantity`         | INT       | Quantity of the product ordered.                 |
| `price_per_unit`   | DECIMAL   | Price of the product at the time of the order.   |

---

#### **5. Payments Table**
This table stores payment details for orders.

| Column Name        | Data Type | Description                                      |
|--------------------|-----------|--------------------------------------------------|
| `payment_id`       | INT       | Unique identifier for each payment (Primary Key).|
| `order_id`         | INT       | Identifier linking to the order (Foreign Key).   |
| `payment_date`     | DATE      | Date the payment was made.                       |
| `payment_method`   | VARCHAR   | Payment method used (e.g., Credit Card, PayPal). |
| `amount`           | DECIMAL   | Amount paid.                                     |

---

### **Relationships Between Tables**
1. **Customers → Orders**: A customer can place multiple orders (`customers.customer_id` → `orders.customer_id`).
2. **Orders → Order_Items**: An order can contain multiple items (`orders.order_id` → `order_items.order_id`).
3. **Orders → Payments**: An order can have one or more payments (`orders.order_id` → `payments.order_id`).
4. **Products → Order_Items**: A product can be part of multiple order items (`products.product_id` → `order_items.product_id`).

---

### **Purpose of the Dataset**
This dataset is designed to support **SQL-based analysis** for the following purposes:
1. **Customer Analysis**: Understanding customer demographics, registration trends, and spending behavior.
2. **Product Analysis**: Analyzing product performance, stock levels, and revenue by category.
3. **Order Analysis**: Tracking order trends, statuses, and revenue over time.
4. **Payment Analysis**: Examining payment methods, amounts, and trends.
5. **Cross-Table Analysis**: Deriving insights by combining multiple tables (e.g., customer spending by product category).

---

### **Example Use Cases**
1. **Customer Segmentation**: Identify high-value customers based on total spending.
2. **Inventory Management**: Identify products with low stock levels or high demand.
3. **Sales Performance**: Analyze monthly revenue trends and top-selling products.
4. **Payment Trends**: Determine the most popular payment methods and their impact on revenue.
5. **Order Fulfillment**: Track order statuses and identify delays or cancellations.

---

### **Dataset Limitations**
1. **Synthetic Data**: The dataset is generated programmatically and may not reflect real-world complexities.
2. **Limited Historical Data**: The dataset covers a limited time range (e.g., 1-2 years).
3. **Simplified Relationships**: Relationships between tables are simplified for ease of analysis.

---

### **How to Use the Dataset**
1. **Load the Dataset**: Import the CSV files into your SQL database (e.g., MySQL, PostgreSQL).
2. **Write SQL Queries**: Use SQL queries to analyze the data and derive insights.
3. **Visualize Results**: Use tools like Tableau, Power BI, or Python libraries (e.g., Matplotlib, Seaborn) to visualize the results.

---

 **Acknowledgments**
This dataset was generated using Python and the `Faker` library. It is intended for educational purposes and SQL practice.

---

