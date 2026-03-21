CREATE DATABASE retail_sales_project;
USE retail_sales_project;

CREATE TABLE sales_data (
InvoiceNo VARCHAR(20),
StockCode VARCHAR(20),
Product VARCHAR(100),
Quantity INT,
InvoiceDate DATETIME,
UnitPrice DECIMAL(10,2),
CustomerID INT,
Country VARCHAR(50),
Discount DECIMAL(5,2),
PaymentMethod VARCHAR(50),
ShippingCost DECIMAL(10,2),
Category VARCHAR(50),
SalesChannel VARCHAR(50),
ReturnStatus VARCHAR(20),
Revenue DECIMAL(12,2)
);

-- Data was imported from Excel after cleaning


-- =====================================================
-- MULTI-CHANNEL RETAIL SALES & CUSTOMER BEHAVIOR ANALYSIS
-- =====================================================


-- =====================================================
-- 1. DATA EXPLORATION
-- =====================================================

SELECT COUNT(*) FROM sales_data;

SELECT COUNT(DISTINCT InvoiceNo) FROM sales_data;

SELECT COUNT(DISTINCT CustomerID) FROM sales_data;

SELECT * FROM sales_data LIMIT 10;



-- =====================================================
-- 2. DATA CLEANING CHECK
-- =====================================================

SELECT * FROM sales_data WHERE CustomerID IS NULL;

SELECT ReturnStatus, COUNT(*)
FROM sales_data
GROUP BY ReturnStatus;

SELECT * FROM sales_data WHERE Quantity <= 0;

SELECT * FROM sales_data WHERE UnitPrice <= 0;



-- =====================================================
-- 3. KEY BUSINESS METRICS
-- =====================================================

SELECT SUM(Revenue) AS total_revenue FROM sales_data;

SELECT COUNT(DISTINCT InvoiceNo) AS total_orders FROM sales_data;

SELECT COUNT(DISTINCT CustomerID) AS total_customers FROM sales_data;

SELECT SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM sales_data;



-- =====================================================
-- 4. SALES PERFORMANCE ANALYSIS
-- =====================================================

SELECT Category, SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY Category
ORDER BY total_revenue DESC;

SELECT Country, SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY Country
ORDER BY total_revenue DESC;

SELECT SalesChannel, SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY SalesChannel;



-- =====================================================
-- 5. PRODUCT ANALYSIS
-- =====================================================

SELECT Product, SUM(Quantity) AS total_units_sold
FROM sales_data
GROUP BY Product
ORDER BY total_units_sold DESC
LIMIT 10;

SELECT Product, SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY Product
ORDER BY total_revenue DESC
LIMIT 10;



-- =====================================================
-- 6. CUSTOMER BEHAVIOR ANALYSIS
-- =====================================================

-- Top customers overall
SELECT CustomerID, SUM(Revenue) AS total_spent
FROM sales_data
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

-- Customer purchase frequency
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS total_orders
FROM sales_data
GROUP BY CustomerID
ORDER BY total_orders DESC;

-- Top customer per country 
SELECT s.Country, s.CustomerID, s.total_spent
FROM (
    SELECT Country, CustomerID, SUM(Revenue) AS total_spent
    FROM sales_data
    GROUP BY Country, CustomerID
) s
WHERE s.total_spent = (
    SELECT MAX(sub.total_spent)
    FROM (
        SELECT Country, CustomerID, SUM(Revenue) AS total_spent
        FROM sales_data
        GROUP BY Country, CustomerID
    ) sub
    WHERE sub.Country = s.Country
);

-- Customer Segmentation 
SELECT 
CustomerID,
SUM(Revenue) AS total_spent,
CASE 
    WHEN SUM(Revenue) > 10000 THEN 'High Value'
    WHEN SUM(Revenue) BETWEEN 5000 AND 10000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS customer_segment
FROM sales_data
GROUP BY CustomerID;



-- =====================================================
-- 7. PAYMENT METHOD ANALYSIS
-- =====================================================

SELECT PaymentMethod, SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;



-- =====================================================
-- 8. RETURNS ANALYSIS
-- =====================================================

SELECT ReturnStatus, COUNT(*) AS total_orders
FROM sales_data
GROUP BY ReturnStatus;



-- =====================================================
-- 9. TIME-BASED SALES ANALYSIS
-- =====================================================

SELECT
YEAR(InvoiceDate) AS year,
MONTH(InvoiceDate) AS month,
SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY year, month
ORDER BY year, month;

SELECT
DATE(InvoiceDate) AS order_date,
COUNT(DISTINCT InvoiceNo) AS orders
FROM sales_data
GROUP BY order_date
ORDER BY order_date;



-- =====================================================
-- 10. CHANNEL & MARKET INSIGHTS
-- =====================================================

SELECT Category, SalesChannel, SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY Category, SalesChannel;

SELECT Country, COUNT(InvoiceNo) AS total_orders
FROM sales_data
GROUP BY Country
ORDER BY total_orders DESC;

SELECT ReturnStatus, COUNT(*) AS total_orders
FROM sales_data
GROUP BY ReturnStatus;