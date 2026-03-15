# Bank Customer Churn Analysis (SQL Project)

## Project Overview

This project analyzes customer churn behavior in a retail banking dataset using SQL.
The goal is to identify patterns that influence customer churn and uncover high-risk customer segments that banks should target for retention strategies.

The analysis explores customer demographics, account characteristics, and behavioral indicators to understand which factors contribute most to customer attrition.

# Dataset

The dataset contains **10,000 bank customers** and includes information about:

* Customer demographics
* Credit score
* Account balance
* Product usage
* Customer activity
* Churn status

Key columns include:

* CustomerId
* Geography
* Gender
* Age
* Balance
* NumOfProducts
* IsActiveMember
* CreditScore
* Exited (Churn Indicator)

Where:
 Exited = 1 → Customer churned**
 Exited = 0 → Customer retained**

## Business Questions

This project aims to answer several key business questions related to customer churn:

1. What is the overall customer churn rate?
2. Which countries have the highest churn rates?
3. Does customer activity influence churn probability?
4. How does the number of banking products affect customer retention?
5. Do certain age groups churn more frequently than others?
6. Are high-balance customers more likely to churn?
7. Which customer segments represent the highest churn risk?


# Project Structure

bank-customer-churn-sql-analysis

data_exploration.sql
customer_exploration.sql
churn_analysis.sql
Advanced_Analysis.sql

# SQL Analysis Workflow

## 1. Data Exploration

Initial data validation and quality checks were performed including:

* Checking table structure
* Counting total records
* Identifying missing values
* Checking duplicate customers
* Detecting outliers in Age and Balance

Example checks:

SELECT COUNT(*) 
FROM customer_churn_analysis.`customer-churn-records`;

SELECT
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age
FROM customer_churn_analysis.`customer-churn-records`;


# 2. Customer Distribution Analysis

Customer demographics and distribution were analyzed across key variables:
* Geography
* Age
* Gender
* Credit Score
* Balance groups

Example:
SELECT Geography, COUNT(*) AS customers_count
FROM customer_churn_analysis.`customer-churn-records`
GROUP BY Geography;

This helps understand the **structure of the customer base**.

# 3. Churn Analysis

Core churn metrics were calculated including:
* Overall churn rate
* Churn by country
* Churn by gender
* Churn by activity status
* Churn by number of products
* Churn by age segment
* Churn by balance segment

Example KPI query:
SELECT
COUNT(*) AS total_customer,
SUM(Exited) AS churned_customer,
ROUND(AVG(Exited)*100,2) AS churn_rate
FROM customer_churn_analysis.`customer-churn-records`;

# 4. Advanced Analysis

Advanced SQL techniques were used to identify high-risk customers.

### Window Functions

Ranking highest-value churned customers:

RANK() OVER (ORDER BY Balance DESC)

### Customer Risk Segmentation

Customers were categorized into risk segments using business rules:

* High Risk
* Medium Risk
* Low Risk

Example logic:
CASE
WHEN IsActiveMember = 0 AND NumOfProducts = 1 THEN 'High Risk'
WHEN IsActiveMember = 0 THEN 'Medium Risk'
ELSE 'Low Risk'
END

# Key Insights

Several important patterns were discovered:

• Inactive customers churn significantly more than active customers.
• Customers with **only one product show the highest churn rate**.
• Certain countries show higher churn rates than others.
• Older customers tend to churn more frequently.
• High-balance churned customers represent potential revenue loss.

# Business Recommendations

Based on the analysis:

1. Increase engagement with inactive customers through targeted campaigns.
2. Encourage customers to adopt multiple banking products.
3. Monitor high-balance customers to prevent valuable churn.
4. Develop retention strategies for high-risk segments.

# SQL Skills Demonstrated

This project demonstrates key SQL skills used in data analytics:

* Data exploration and cleaning
* Aggregation functions
* CASE WHEN segmentation
* GROUP BY analysis
* Window functions (RANK)
* Customer risk modeling
* Business KPI calculation

# Tools Used

* MySQL
* SQL (Data Analysis)
* MySQL Workbench

---

# Author

Mouna Al-Nasser
Business Analyst transitioning into Data Analytics
