# E-commerce Database Management System

This repository contains the SQL script for setting up a relational database for an e-commerce store using MySQL.

## Objective

The objective was to design and implement a full-featured relational database, including well-structured tables, proper constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE), and relationships (One-to-One, One-to-Many, Many-to-Many).

## Database Schema

The database, named `ecommerce_db`, consists of the following tables:

### 1. `Customers`
Stores customer information.
- `customer_id` (PRIMARY KEY, INT, AUTO_INCREMENT)
- `first_name` (NOT NULL, VARCHAR(50))
- `last_name` (NOT NULL, VARCHAR(50))
- `email` (NOT NULL, UNIQUE, VARCHAR(100))
- `address` (VARCHAR(255))
- `city` (VARCHAR(100))
- `state` (VARCHAR(50))
- `zip_code` (VARCHAR(10))

### 2. `Categories`
Organizes products into categories.
- `category_id` (PRIMARY KEY, INT, AUTO_INCREMENT)
- `category_name` (NOT NULL, UNIQUE, VARCHAR(100))

### 3. `Suppliers`
Stores supplier information.
- `supplier_id` (PRIMARY KEY, INT, AUTO_INCREMENT)
- `supplier_name` (NOT NULL, UNIQUE, VARCHAR(100))
- `contact_person` (VARCHAR(100))
- `phone` (VARCHAR(20))
- `email` (VARCHAR(100))

### 4. `Products`
Stores product details.
- `product_id` (PRIMARY KEY, INT, AUTO_INCREMENT)
- `product_name` (NOT NULL, UNIQUE, VARCHAR(255))
- `description` (TEXT)
- `price` (NOT NULL, DECIMAL(10, 2))
- `stock_quantity` (NOT NULL, INT)
- `category_id` (FOREIGN KEY to `Categories(category_id)`, INT)
- `supplier_id` (FOREIGN KEY to `Suppliers(supplier_id)`, INT)

### 5. `Orders`
Records customer orders.
- `order_id` (PRIMARY KEY, INT, AUTO_INCREMENT)
- `customer_id` (FOREIGN KEY to `Customers(customer_id)`, INT)
- `order_date` (NOT NULL, DATE)
- `total_amount` (NOT NULL, DECIMAL(10, 2))
- `order_status` (VARCHAR(50), e.g., 'Pending', 'Completed', 'Shipped')

### 6. `Order_Items`
Links products to orders and specifies quantities.
- `order_item_id` (PRIMARY KEY, INT, AUTO_INCREMENT)
- `order_id` (FOREIGN KEY to `Orders(order_id)`, INT)
- `product_id` (FOREIGN KEY to `Products(product_id)`, INT)
- `quantity` (NOT NULL, INT)
- `price` (NOT NULL, DECIMAL(10, 2))

## Relationships

The database establishes the following relationships between tables:

### One-to-Many Relationships:
-   **Categories to Products:** One category can be associated with multiple products.
-   **Suppliers to Products:** One supplier can provide multiple products.
-   **Customers to Orders:** One customer can place multiple orders.
-   **Orders to Order_Items:** One order can contain multiple items.

### Many-to-Many Relationships:
-   **Products and Orders:** A many-to-many relationship exists between `Products` and `Orders`, implemented through the `Order_Items` junction table. A product can be part of many orders, and an order can include many products.

## Setup and Usage

To set up and use this database, follow these steps:

1.  **Ensure MySQL is installed:** Make sure you have MySQL server installed and running on your system.

2.  **Access MySQL:** Open your MySQL client (e.g., MySQL Workbench, command-line client).

3.  **Execute the SQL script:** Run the `ecommerce_database.sql` file.

    ```bash
    mysql -u your_username -p < ecommerce_database.sql
    ```
    Replace `your_username` with your MySQL username. You will be prompted to enter your password.

    Alternatively, you can copy and paste the contents of `ecommerce_database.sql` into your MySQL client and execute it.

4.  **Verify Setup:** Once the script is executed, the `ecommerce_db` database will be created, and all tables will be populated with sample data.

    You can verify this by running:

    ```sql
    USE ecommerce_db;
    SHOW TABLES;
    SELECT * FROM Customers;
    -- And so on for other tables
    ```

## Deliverables

The `ecommerce_database.sql` file contains:
-   `CREATE DATABASE` statement
-   `CREATE TABLE` statements with proper constraints
-   Relationship constraints (FOREIGN KEYs)
-   Sample `INSERT INTO` statements to populate the tables.
