# TASK4_SQL

Project: Extracting and analyzing data using SQL queries in MySQL Workbench
📌 Objective
Perform SQL-based data analysis using SELECT, WHERE, ORDER BY, GROUP BY, JOINs, subqueries, aggregate functions, views, and optimization techniques.
🛠️ Tools & Technologies
- Database: MySQL
- IDE: MySQL Workbench
- Data Format: Structured (Tables, CSV)

📜 Instructions – Step-by-Step Guide
1️⃣ Setup Database & Tables
- Install MySQL Workbench
- Create the database:
CREATE DATABASE sales_analysis;
USE sales_analysis;
- Create tables:
CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    TotalSales DECIMAL(10,2)
);


2️⃣ Insert Sample Data
INSERT INTO sales_data (OrderID, OrderDate, ProductName, Category, Quantity, Price, TotalSales) VALUES
(1, '2025-06-01', 'Laptop', 'Electronics', 2, 75000, 150000),
(2, '2025-06-02', 'Smartphone', 'Electronics', 3, 30000, 90000),
(3, '2025-06-03', 'Headphones', 'Accessories', 5, 2000, 10000),
(4, '2025-06-04', 'Washing Machine', 'Home Appliances', 1, 25000, 25000),
(5, '2025-06-05', 'Television', 'Electronics', 2, 50000, 100000);


3️⃣ Basic Queries
- View first 10 records:
SELECT * FROM sales_data LIMIT 10;
- Filter by Category:
SELECT * FROM sales_data WHERE Category = 'Electronics';
 - Sort by Total Sales:
SELECT * FROM sales_data ORDER BY TotalSales DESC;


4️⃣ Grouping & Aggregate Functions
- Total revenue per category:
SELECT Category, SUM(TotalSales) AS TotalRevenue FROM sales_data GROUP BY Category;
- Average price per product:
SELECT ProductName, AVG(Price) AS AvgPrice FROM sales_data GROUP BY ProductName;


5️⃣ JOINs – Connecting Multiple Tables
Inner Join
SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
INNER JOIN customer_data c ON s.OrderID = c.OrderID;


Left Join
SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
LEFT JOIN customer_data c ON s.OrderID = c.OrderID;


Right Join
SELECT s.OrderID, s.ProductName, c.CustomerName, c.Region
FROM sales_data s
RIGHT JOIN customer_data c ON s.OrderID = c.OrderID;


6️⃣ Subqueries
- Find products making more revenue than the average:
SELECT ProductName, TotalSales  
FROM sales_data  
WHERE TotalSales > (SELECT AVG(TotalSales) FROM sales_data);


7️⃣ Creating Views for Analysis
- Create a view for high-value orders:
CREATE VIEW HighValueOrders AS  
SELECT OrderID, ProductName, TotalSales  
FROM sales_data WHERE TotalSales > 50000;
- Query the view:
SELECT * FROM HighValueOrders;


8️⃣ Query Optimization
- Speed up category searches:
CREATE INDEX idx_category ON sales_data(Category);
- Avoid SELECT * usage:
SELECT OrderID, ProductName, TotalSales FROM sales_data;
  - Analyze query performance:
EXPLAIN SELECT * FROM sales_data WHERE Category = 'Electronics';


9️⃣ Saving Queries & Documentation
- Store all queries in a .sql file (sales_analysis.sql)
