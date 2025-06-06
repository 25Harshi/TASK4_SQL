CREATE DATABASE sales_analysis;
USE sales_analysis; 
CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    TotalSales DECIMAL(10,2)
);
INSERT INTO sales_data (OrderID, OrderDate, ProductName, Category, Quantity, Price, TotalSales) VALUES
(1, '2025-06-01', 'Laptop', 'Electronics', 2, 75000, 150000),
(2, '2025-06-02', 'Smartphone', 'Electronics', 3, 30000, 90000),
(3, '2025-06-03', 'Headphones', 'Accessories', 5, 2000, 10000),
(4, '2025-06-04', 'Washing Machine', 'Home Appliances', 1, 25000, 25000),
(5, '2025-06-05', 'Television', 'Electronics', 2, 50000, 100000);

SELECT * FROM sales_data;

SELECT * FROM sales_data WHERE Category = 'Electronics';

SELECT * FROM sales_data ORDER BY TotalSales DESC;

SELECT Category, SUM(TotalSales) AS TotalRevenue FROM sales_data GROUP BY Category;

SELECT Category, AVG(Price) AS AvgPrice FROM sales_data GROUP BY Category;


SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
INNER JOIN customer_data c ON s.OrderID = c.OrderID;


SHOW TABLES; 
CREATE TABLE customer_data (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Region VARCHAR(100)
);


INSERT INTO customer_data (OrderID, CustomerName, Region) VALUES
(1, 'Amit Sharma', 'India'),
(2, 'Sophia Lee', 'USA'),
(3, 'Carlos Garcia', 'Spain'),
(4, 'Mei Wang', 'China'),
(5, 'John Doe', 'UK');
SELECT * FROM sales_data;
SELECT * FROM customer_data;

SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
INNER JOIN customer_data c ON s.OrderID = c.OrderID;


INSERT INTO sales_data (OrderID, ProductName, Category, TotalSales) VALUES
(1, 'Laptop', 'Electronics', 150000),
(2, 'Smartphone', 'Electronics', 90000),
(3, 'Headphones', 'Accessories', 10000),
(4, 'Washing Machine', 'Home Appliances', 25000),
(5, 'Television', 'Electronics', 100000);

INSERT INTO customer_data (OrderID, CustomerName, Region) VALUES
(1, 'Amit Sharma', 'India'),
(2, 'Sophia Lee', 'USA'),
(3, 'Carlos Garcia', 'Spain'),
(6, 'Mei Wang', 'China'); -- This OrderID does not exist in sales_data


SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
INNER JOIN customer_data c ON s.OrderID = c.OrderID;

SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
LEFT JOIN customer_data c ON s.OrderID = c.OrderID;

SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
RIGHT JOIN customer_data c ON s.OrderID = c.OrderID;

SELECT c.OrderID, c.CustomerName 
FROM customer_data c
LEFT JOIN sales_data s ON c.OrderID = s.OrderID
WHERE s.ProductName IS NULL;


SELECT c.CustomerName, COUNT(s.OrderID) AS TotalOrders
FROM customer_data c
LEFT JOIN sales_data s ON c.OrderID = s.OrderID
GROUP BY c.CustomerName
HAVING COUNT(s.OrderID) > 1;

SELECT ProductName, SUM(TotalSales) AS TotalRevenue
FROM sales_data
GROUP BY ProductName
ORDER BY TotalRevenue DESC;

CREATE VIEW FrequentCustomers AS 
SELECT c.CustomerName, COUNT(s.OrderID) AS TotalOrders
FROM customer_data c
LEFT JOIN sales_data s ON c.OrderID = s.OrderID
GROUP BY c.CustomerName
HAVING COUNT(s.OrderID) > 1;



SELECT * FROM FrequentCustomers;


CREATE INDEX idx_order_sales ON sales_data(OrderID);
CREATE INDEX idx_order_customer ON customer_data(OrderID);

CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    TotalSales DECIMAL(10,2)
);

INSERT INTO sales_data (OrderID, ProductName, Category, TotalSales) VALUES
(1, 'Laptop', 'Electronics', 150000),
(2, 'Smartphone', 'Electronics', 90000),
(3, 'Headphones', 'Accessories', 10000),
(4, 'Washing Machine', 'Home Appliances', 25000),
(5, 'Television', 'Electronics', 100000);

# Subqueries – Find High Revenue Products
SELECT ProductName, TotalSales 
FROM sales_data 
WHERE TotalSales > (SELECT AVG(TotalSales) FROM sales_data);

# Creating Views for Analysis

CREATE VIEW HighValueOrders AS 
SELECT OrderID, ProductName, TotalSales 
FROM sales_data WHERE TotalSales > 50000;

SELECT * FROM HighValueOrders;

# Query Optimization

CREATE INDEX idx_category ON sales_data(Category);

SELECT OrderID, ProductName, TotalSales FROM sales_data;

EXPLAIN SELECT * FROM sales_data WHERE Category = 'Electronics';



SELECT ProductName, SUM(TotalSales) AS TotalRevenue 
FROM sales_data 
GROUP BY ProductName 
ORDER BY TotalRevenue DESC 
LIMIT 5;

SELECT * FROM sales_data 
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);


















