#checking null values
SELECT
    SUM(case when Age is null then 1 else 0 end) AS missing_age,
    SUM(case when Balance is null then 1 else 0 end) AS missing_balance,
    SUM(case when Geography is null then 1 else 0 end) AS missing_geography,
    SUM(case when Gender is null then 1 else 0 end) AS missing_gender
FROM customer_churn_analysis.`customer-churn-records`;

#check table structure
describe customer_churn_analysis.`customer-churn-records`;

#check rows count
select count(*) from customer_churn_analysis.`customer-churn-records`;

#customers by country
select distinct Geography from customer_churn_analysis.`customer-churn-records`;

#check duplicate customers
select CustomerId ,
count(*) as duplicate_customer
from customer_churn_analysis.`customer-churn-records`
group by CustomerId
having count(*) > 1;

#detect outliers
# age
select 
min(Age) as Min_age,
max(Age) as max_age
from  customer_churn_analysis.`customer-churn-records`;

#balance 
select 
min(Balance) as Min_Balance,
max(Balance) as max_Balance
from  customer_churn_analysis.`customer-churn-records`;
