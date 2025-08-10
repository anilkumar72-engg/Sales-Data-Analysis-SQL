
-- Sales Data Analysis SQL Project
-- 1. Create Database
CREATE DATABASE SalesDB;
USE SalesDB;

-- 2. Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    City VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 3. Insert Sample Data
INSERT INTO Customers VALUES
(1, 'John Smith', 'john@example.com', 'New York', '2023-01-10'),
(2, 'Emma Johnson', 'emma@example.com', 'Los Angeles', '2023-02-15'),
(3, 'Michael Brown', 'michael@example.com', 'Chicago', '2023-03-20'),
(4, 'Sophia Davis', 'sophia@example.com', 'Houston', '2023-04-25'),
(5, 'Liam Wilson', 'liam@example.com', 'Phoenix', '2023-05-30');

INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Smartphone', 'Electronics', 500.00),
(3, 'Headphones', 'Accessories', 50.00),
(4, 'Tablet', 'Electronics', 300.00),
(5, 'Smartwatch', 'Accessories', 150.00),
(6, 'Keyboard', 'Accessories', 30.00),
(7, 'Monitor', 'Electronics', 200.00);

INSERT INTO Orders VALUES
(101, 1, '2023-06-10', 850.00),
(102, 2, '2023-06-12', 500.00),
(103, 3, '2023-06-15', 650.00),
(104, 4, '2023-07-01', 150.00),
(105, 5, '2023-07-03', 830.00),
(106, 1, '2023-07-05', 530.00),
(107, 2, '2023-07-07', 200.00),
(108, 3, '2023-07-10', 150.00),
(109, 4, '2023-07-12', 800.00),
(110, 5, '2023-07-15', 50.00);

INSERT INTO OrderDetails VALUES
(1, 101, 1, 1, 800.00),
(2, 101, 3, 1, 50.00),
(3, 102, 2, 1, 500.00),
(4, 103, 2, 1, 500.00),
(5, 103, 5, 1, 150.00),
(6, 104, 5, 1, 150.00),
(7, 105, 1, 1, 800.00),
(8, 105, 6, 1, 30.00),
(9, 106, 4, 1, 300.00),
(10, 106, 2, 1, 200.00),
(11, 107, 7, 1, 200.00),
(12, 108, 5, 1, 150.00),
(13, 109, 1, 1, 800.00),
(14, 110, 3, 1, 50.00);

-- 4. Example Queries

-- Total Sales Revenue
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

-- Top 5 Best-Selling Products
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 5;

-- Monthly Sales Trends
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
GROUP BY Month
ORDER BY Month;

-- Top 3 Customers by Revenue
SELECT c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Name
ORDER BY TotalSpent DESC
LIMIT 3;

-- Category-Wise Sales
SELECT p.Category, SUM(od.Quantity * od.UnitPrice) AS CategorySales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category;

-- Highest Order Value
SELECT OrderID, MAX(TotalAmount) AS HighestOrderValue
FROM Orders
GROUP BY OrderID
ORDER BY HighestOrderValue DESC
LIMIT 1;

-- Average Order Value per Customer
SELECT c.Name, AVG(o.TotalAmount) AS AvgOrderValue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Name;
