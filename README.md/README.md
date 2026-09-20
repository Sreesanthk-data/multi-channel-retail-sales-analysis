# 📊 Multi-Channel Retail Sales Analysis

## Project Overview

This project analyzes retail sales data to understand **revenue performance, category performance, sales channels, product performance, and monthly revenue trends**.

The project follows a simple end-to-end analytics workflow:

**Raw Excel Data → Excel Cleaning → SQL Analysis → Power BI Dashboard → Business Insights**

The focus is on answering practical business questions rather than performing unnecessary analysis.

---

## 🎯 Business Questions

1. What is the total revenue generated?
2. How many orders and customers are in the dataset?
3. Which product category generates the most revenue?
4. How is revenue divided between Online and In-Store channels?
5. Which countries generate the most revenue?
6. Which products generate the highest revenue?
7. How does revenue change month by month?
8. What is the distribution of returned and non-returned sales records?

---

## 📁 Project Structure

```text
retail-sales-analysis/
│
├── data/
│   ├── raw_data.xlsx
│   └── cleaned_data.xlsx
│
├── sql/
│   └── analysis.sql
│
├── powerbi/
│   └── dashboard.pbix
│
├── images/
│   └── dashboard.png
│
└── README.md
```

---

## 🛠️ Tools Used

- **Excel** – Data cleaning and preparation
- **MySQL** – SQL analysis and validation
- **Power BI** – Dashboard and data visualization

---

## 🧹 Data Preparation

The raw dataset contained **49,782 rows and 17 columns**.

After cleaning and preparing the data in Excel, the analysis dataset contained **44,804 rows and 15 columns**.

The cleaned dataset was then imported into MySQL for analysis.

Key fields used in the analysis include:

- InvoiceNo
- Product
- Quantity
- InvoiceDate
- UnitPrice
- CustomerID
- Country
- Category
- SalesChannel
- ReturnStatus
- Revenue

---

## 📊 Dashboard

![Dashboard](images/dashboard.png)

The Power BI dashboard contains:

- Total Revenue
- Total Orders
- Total Customers
- Total Quantity
- Revenue by Category
- Monthly Revenue Trend
- Sales Channel Distribution
- Revenue by Country
- Top Products by Revenue
- Return Status

The dashboard also includes **Country** and **Sales Channel** filters.

---

## 📈 Key Findings

### 1. Category Performance

**Electronics** generated approximately **20.48M** in revenue and was the highest-revenue category.

**Apparel** generated approximately **5.08M**, making it the lowest-revenue category in this dataset.

### 2. Monthly Revenue Trend

Revenue was around **4.6M–5.1M** during January–August.

Revenue then declined to approximately **4.2M per month from September–December**.

This shows a noticeable decline in the later months of the dataset. The project does **not** claim a specific cause for this decline because the available analysis does not establish one.

### 3. Sales Channel

Revenue was almost evenly split between:

- **Online:** ~28.29M
- **In-Store:** ~28.11M

This shows that both channels contributed similar amounts of revenue during the analyzed period.

### 4. Product Performance

The highest-revenue products included:

- White Mug
- Wall Clock
- USB Cable
- Backpack
- Desk Lamp

The top products each generated roughly **5M+** in revenue.

### 5. Returns

The cleaned dataset contains approximately **4.4K returned sales records**.

Because the return analysis counts dataset records, this should not be described as a precise **order-level return rate** unless the data is first aggregated to the invoice/order level.

---

## 🔎 SQL Analysis

The SQL analysis was intentionally kept focused on the questions used in the dashboard.

Main SQL topics:

- Basic data exploration
- Data quality checks
- Total revenue, orders, customers and quantity
- Average order value
- Revenue by category
- Revenue by sales channel
- Revenue by country
- Top products by revenue
- Monthly revenue trend
- Return status

The SQL uses basic and interview-relevant concepts such as:

- `SELECT`
- `COUNT`
- `COUNT(DISTINCT ...)`
- `SUM`
- `GROUP BY`
- `ORDER BY`
- `WHERE`
- `LIMIT`
- Basic date functions

---

## 💡 Business Takeaways

- Electronics is the strongest revenue-generating category in this dataset.
- Apparel has the lowest revenue among the analyzed categories.
- Online and In-Store channels contribute almost equally to total revenue.
- Revenue shows a noticeable decline in the later months.
- A small group of products appears among the highest-revenue products.

These findings describe the dataset and should not be treated as proof of the reasons behind the observed trends.

---

## 🚀 Project Workflow

### Step 1 – Raw Data
Collected the original retail sales dataset.

### Step 2 – Excel Cleaning
Removed unnecessary fields, prepared the dataset, and calculated the Revenue field used for analysis.

### Step 3 – SQL Analysis
Imported the cleaned dataset into MySQL and used SQL to validate the data and answer the main business questions.

### Step 4 – Power BI
Created an interactive dashboard to present the key metrics, trends, category performance, channels, countries, products, and return status.

### Step 5 – Business Insights
Converted the dashboard results into a small number of clear business observations.

---

## 📌 How to Use

1. Open `data/cleaned_data.xlsx`.
2. Import the cleaned data into MySQL.
3. Run `sql/analysis.sql`.
4. Open `powerbi/dashboard.pbix`.
5. Use the **Country** and **Sales Channel** filters to explore the dashboard.

---

## 📂 Data Source

Dataset sourced from Kaggle:

**Multi-Channel Retail Sales Dataset**

---

## 👤 Author

**Sreesanth K**

- Email: sreesanthk33@gmail.com
- LinkedIn: www.linkedin.com/in/sreesanth-k-5344a837
