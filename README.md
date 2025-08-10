# 📊 Sales Data Analysis (SQL Project)

## 📌 Overview
This project demonstrates **SQL skills** through sales data analysis, focusing on **database design, data insertion, and analytical queries** for business insights.

The project includes:
- **Database schema** creation (Customers, Products, Orders, OrderDetails)
- **Sample sales data** insertion
- **Analytical SQL queries** to answer real-world business questions

---

## 🛠 Technologies Used
- **MySQL**
- **SQL Joins, Aggregations, Grouping**
- **ER Diagram Design**

---

## 📂 Database Schema
The database contains the following tables:
1. **Customers** – Stores customer details
2. **Products** – Stores product information
3. **Orders** – Tracks customer orders
4. **OrderDetails** – Contains order item details

**ER Diagram:**
![ER Diagram](SalesDB_ER_Diagram.png)

---

## 📈 Key Queries & Insights
### 1. **Total Sales Revenue**
```sql
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;
```

### 2. **Top 5 Best-Selling Products**
```sql
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 5;
```

### 3. **Monthly Sales Trends**
```sql
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
GROUP BY Month
ORDER BY Month;
```

### 4. **Top 3 Customers by Revenue**
```sql
SELECT c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Name
ORDER BY TotalSpent DESC
LIMIT 3;
```

---

## 📊 Example Outputs
| ProductName | TotalQuantity |
|-------------|--------------|
| Laptop      | 3            |
| Smartphone  | 2            |
| Headphones  | 1            |

| Month   | MonthlyRevenue |
|---------|---------------|
| 2023-06 | 2000.00        |
| 2023-07 | 2160.00        |

---

## 📦 Files in This Repository
- **Sales_Data_Analysis_Project.sql** → SQL file with schema, data, and queries  
- **SalesDB_ER_Diagram.png** → Database ER diagram  

---

## 🚀 How to Use
1. Download the `.sql` file  
2. Import it into your MySQL database  
3. Run the queries to view insights  

---

## 📬 Contact
Created by **Anil Kumar Budha**  
📧 [Your Email Here]  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/anilkumar-budda-5a240128b)  
