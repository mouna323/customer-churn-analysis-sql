
##rank highest ten churned customer
select CustomerId,
Geography,
Balance,
rank() over(order by Balance desc) as Risk_Rank
from customer_churn_analysis.`customer-churn-records` 
where Exited=1 limit 10;


#top churned customer segment
select Geography,
NumOfProducts,
IsActiveMember , 
count(*) as Customer_count, 
round(avg(Exited)*100,2) as churn_rate 
from customer_churn_analysis.`customer-churn-records` 
group by Geography,NumOfProducts,IsActiveMember
order by churn_rate desc ;


##customer churn propability
select CustomerId,Age, Geography, NumOfProducts, IsActiveMember ,
case 
when IsActiveMember= 0 and NumOfProducts = 1 then "High Risk"
when IsActiveMember= 0  then "Medium Risk"
else "Low Risk" end as customer_risk
from customer_churn_analysis.`customer-churn-records` ;


##propability customer risk  segment
select 
case 
when IsActiveMember= 0 and NumOfProducts = 1 then "High Risk"
when IsActiveMember= 0  then "Medium Risk"
else "Low Risk" end as customer_risk,
count(*) as customer_count,
round(avg(Exited)*100,2) as churn_rate 
from customer_churn_analysis.`customer-churn-records`
 group by customer_risk order by churn_rate desc
 
 ;
