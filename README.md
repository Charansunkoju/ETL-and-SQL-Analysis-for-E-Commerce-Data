# ETL-and-SQL-Analysis-for-E-Commerce-Data

This project focuses on building an ETL (Extract, Transform, Load) pipeline using Python and MySQL to process and analyze e-commerce data. 
The goal is to extract data from CSV files, transform and clean it, and then load it into a structured MySQL database for efficient querying and analysis.

---
## 🎯 Objectives
 - Extract customer, product, order, and payment data from CSV files.
 - Transform the data by handling missing values, ensuring data integrity, and matching schema constraints.
 - Load the cleaned data into a MySQL database with proper relational integrity.
 - Analyze the data using SQL queries to gain business insights.

---

## 🛠 Technologies Used
- Python (pandas, MySQL Connector, SQLAlchemy, SQL Queries)
- MySQL (Workbench, Queries)
- VS Code (for execution)
- xlsx Files (data source)

---
## 📂 Project Structure
project-folder/

│-- data/                # Raw CSV files  

│-- sql_scripts/         # SQL schema  

│-- python_scripts/      # ETL scripts & queries 

│-- README.md            # Project documentation  

│-- requirements.txt     # Dependencies  

---

## 🔄 Step-by-Step Workflow
### 1️⃣ Set Up MySQL Database

1. Install MySQL Server and MySQL Workbench.
   
2. Create a new database:
   
   -- CREATE DATABASE ecommerce_db;

### 2️⃣ Install Dependencies
Run the following command to install required Python packages:
-- pip install -r requirements.txt

### 3️⃣ Extract Data from CSV Files
-- Place CSV files (customers.csv, products.csv, orders.csv, payments.csv) in the data/ folder.
-- Use pandas to read the CSV files:

### 4️⃣ Transform & Clean Data
-- Handle missing values, duplicates, and incorrect data types:

### 5️⃣ Load Data into MySQL
-- Connect Python to MySQL

### 6️⃣ Run SQL Queries for Analysis
-- Run SQL Queries in Python
-- Establish connection by creating engine
-- Read sql using pandas and run SQL Query

---
## 📈 Business Insights
-- Identify top customers by total spending.
-- Find the most popular product category.
-- Analyze successful vs. failed payments.
-- Determine peak sales months.

---

## 🚀 Final Deliverables
✔️ ETL Python Scripts to automate data extraction, transformation, and loading.

✔️ MySQL Database with cleaned & structured data.

✔️ SQL Queries to generate insights.

✔️ Business Insights Report summarizing findings.

--- 

## 🎯 Conclusion

This structured ETL + SQL workflow ensures efficient data processing, storage, and analysis for e-commerce business intelligence! 🚀
