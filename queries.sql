/*========================================================
        ONLINE BOOKSTORE SQL PROJECT
                SQL Analysis Queries

Author : Poorva

Description:
This file contains SQL queries used to analyze the Online
Bookstore database. It demonstrates filtering, joins,
aggregation, subqueries, CTEs, window functions, CASE
statements, and views.
=========================================================*/

-- =========================================
-- BASIC QUERIES
-- =========================================

-- Retrieve all Fiction books
SELECT * FROM Books
WHERE Genre='Fiction';

-- Find books published after 1950
SELECT * FROM Books
WHERE Published_Year > 1950;

-- Customers from Canada
SELECT * FROM Customers
WHERE Country='Canada';

-- =========================================
-- AGGREGATE FUNCTIONS
-- =========================================

-- Total Revenue
SELECT SUM(Total_Amount)
FROM Orders;

-- =========================================
-- JOIN QUERIES
-- =========================================

-- Total Books Sold by Genre
SELECT b.Genre,
SUM(o.Quantity)
FROM Orders o
JOIN Books b
ON o.Book_ID=b.Book_ID
GROUP BY b.Genre;

-- =========================================
-- WINDOW FUNCTION
-- =========================================

SELECT
Title,
Price,
RANK() OVER(ORDER BY Price DESC) AS Price_Rank
FROM Books;

-- =========================================
-- CTE
-- =========================================

WITH CustomerSales AS
(
SELECT Customer_ID,
SUM(Total_Amount) AS TotalSpent
FROM Orders
GROUP BY Customer_ID
)

SELECT *
FROM CustomerSales
WHERE TotalSpent > 50;

-- =========================================
-- CASE STATEMENT
-- =========================================

SELECT
Title,
Price,
CASE
WHEN Price < 10 THEN 'Budget'
WHEN Price BETWEEN 10 AND 20 THEN 'Standard'
ELSE 'Premium'
END AS Price_Category
FROM Books;

-- =========================================
-- VIEWS
-- =========================================

CREATE VIEW Order_Details AS
SELECT ...
