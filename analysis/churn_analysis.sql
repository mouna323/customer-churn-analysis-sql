#count of churned customer and rate
select count(*) as total_customer,
 sum(Exited) as churned_customer,
 round(avg(Exited)*100, 2) as churn_rate
 from customer_churn_analysis.`customer-churn-records` ;


 
# churned customer by region
select Geography, count(*) as total_customer,
 sum(Exited) as churned_customer,
 round(avg(Exited)*100, 2) as churn_rate
 from customer_churn_analysis.`customer-churn-records` 
 group by Geography order by churn_rate;
 
 
 # churned customer by Gender
select Gender, count(*) as total_customer,
 sum(Exited) as churned_customer,
 round(avg(Exited)*100, 2) as churn_rate
 from customer_churn_analysis.`customer-churn-records` 
 group by Gender;
 
 # churned customer by activity status
select IsActiveMember, count(*) as total_customer,
 sum(Exited) as churned_customer,
 round(avg(Exited)*100, 2) as churn_rate
 from customer_churn_analysis.`customer-churn-records` 
 group by IsActiveMember order by churn_rate desc;
 

# churned customer by products number
select NumOfProducts, count(*) as total_customer ,
 sum(Exited) as churned_customer,
 round(avg(Exited)*100, 2) as churn_rate
 from customer_churn_analysis.`customer-churn-records` 
 group by NumOfProducts order by churn_rate desc;
 
 # churned customer by age
 
 select 
 case 
 when age <30 then "Young"
 when age between 31 and 45 then "Adult"
 when age between 46 and 60 then "Middle Age"
 else "Senior" end as Age_classification, 
 sum(Exited) as churned_customer,
 round(avg(Exited)*100, 2) as churn_rate
 from customer_churn_analysis.`customer-churn-records` 
 group by Age_classification order by churn_rate desc;
 
 
 # churned customer by balance
  select 
 case 
 when Balance=0 then "Zero Balance"
 when Balance <150000 then "Low Balance"
 when Balance between 150001 and 200000 then "Medium Balance"
 else "High Balance" end as balance_amount, 
 sum(Exited) as churned_customer,
 round(avg(Exited)*100, 2) as churn_rate
 from customer_churn_analysis.`customer-churn-records` 
 group by balance_amount order by churn_rate desc;
 