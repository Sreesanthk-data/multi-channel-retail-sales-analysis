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

-- ====================================
-- MULTI-CHANNEL RETAIL SALES ANALYSIS 
-- ====================================

-- 1. DATA VALIDATION

-- Check total number of records
SELECT COUNT(*) AS total_rows
FROM sales_data;

-- Check for missing customer IDs
SELECT COUNT(*) AS missing_customer_ids
FROM sales_data
WHERE CustomerID IS NULL;

-- Check for invalid quantity values
SELECT COUNT(*) AS invalid_quantity_rows
FROM sales_data
WHERE Quantity <= 0;

-- Check for invalid price values
SELECT COUNT(*) AS invalid_price_rows
FROM sales_data
WHERE UnitPrice <= 0;


-- 2. KEY BUSINESS METRICS

-- Calculate the main sales metrics
SELECT
    SUM(Revenue) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    COUNT(DISTINCT CustomerID) AS total_customers,
    SUM(Quantity) AS total_quantity
FROM sales_data;


-- 3. REVENUE BY CATEGORY

-- Compare revenue across categories
SELECT
    Category,
    SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY Category
ORDER BY total_revenue DESC;


-- 4. REVENUE BY SALES CHANNEL

-- Compare revenue across sales channels
SELECT
    SalesChannel,
    SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY SalesChannel
ORDER BY total_revenue DESC;


-- 5. REVENUE BY COUNTRY

-- Compare revenue across countries
SELECT
    Country,
    SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY Country
ORDER BY total_revenue DESC;


-- 6. TOP PRODUCTS BY REVENUE

-- Find the highest-revenue products
SELECT
    Product,
    SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY Product
ORDER BY total_revenue DESC
LIMIT 10;


-- 7. MONTHLY REVENUE TREND

-- Analyze revenue over time
SELECT
    YEAR(InvoiceDate) AS year,
    MONTH(InvoiceDate) AS month,
    SUM(Revenue) AS total_revenue
FROM sales_data
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY year, month;


-- 8. RETURN STATUS

-- Check the distribution of return status
SELECT
    ReturnStatus,
    COUNT(*) AS total_records
FROM sales_data
GROUP BY ReturnStatus
ORDER BY total_records DESC;
