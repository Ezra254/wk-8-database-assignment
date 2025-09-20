CREATE DATABASE IF NOT EXISTS ecommerce_db;

USE ecommerce_db;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(10)
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL UNIQUE,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Populate Categories Table
INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Books'),
('Home & Kitchen'),
('Clothing'),
('Sports & Outdoors');

-- Populate Suppliers Table
INSERT INTO Suppliers (supplier_name, contact_person, phone, email) VALUES
('ElectroCorp', 'John Doe', '123-456-7890', 'john.doe@electrocorp.com'),
('BookHaven', 'Jane Smith', '098-765-4321', 'jane.smith@bookhaven.com'),
('HomeEssentials', 'Peter Jones', '111-222-3333', 'peter.jones@homeessentials.com');

-- Populate Customers Table
INSERT INTO Customers (first_name, last_name, email, address, city, state, zip_code) VALUES
('Alice', 'Brown', 'alice.b@example.com', '123 Oak Ave', 'Springfield', 'IL', '62701'),
('Bob', 'White', 'bob.w@example.com', '456 Pine St', 'Shelbyville', 'KY', '40065'),
('Charlie', 'Green', 'charlie.g@example.com', '789 Maple Dr', 'Capital City', 'NY', '12201');

-- Populate Products Table
INSERT INTO Products (product_name, description, price, stock_quantity, category_id, supplier_id) VALUES
('Laptop Pro', 'Powerful laptop for professionals', 1200.00, 50, 1, 1),
('Wireless Mouse', 'Ergonomic wireless mouse', 25.00, 200, 1, 1),
('SQL for Dummies', 'A beginner\'s guide to SQL', 35.50, 150, 2, 2),
('Cookbook Deluxe', 'Recipes from around the world', 45.00, 100, 3, 3),
('T-Shirt Cotton', 'Comfortable cotton T-shirt', 15.00, 300, 4, NULL);

-- Populate Orders Table
INSERT INTO Orders (customer_id, order_date, total_amount, order_status) VALUES
(1, '2023-01-15', 1225.00, 'Completed'),
(2, '2023-01-20', 35.50, 'Pending'),
(1, '2023-02-01', 45.00, 'Shipped'),
(3, '2023-02-10', 15.00, 'Completed');

-- Populate Order_Items Table
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 25.00),
(2, 3, 1, 35.50),
(3, 4, 1, 45.00),
(4, 5, 1, 15.00);
