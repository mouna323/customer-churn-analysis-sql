#distributions
#customers by country
select  Geography ,
count(*) as customers_count
from customer_churn_analysis.`customer-churn-records` 
group by Geography order by customers_count;

#customers by age
select Age, count(*) as customers_count 
from customer_churn_analysis.`customer-churn-records` 
group by Age order by Age;


#customer by gender
select Gender, count(*) as customers_count 
from customer_churn_analysis.`customer-churn-records` 
group by Gender order by Gender;


#top customers by balance in each country

select CustomerId,Geography, Balance,
rank() over(partition by Geography order by Balance desc) as rank_by_country
from  customer_churn_analysis.`customer-churn-records` ;

##customers by credit score
select CreditScore, count(*) as customers_count 
from customer_churn_analysis.`customer-churn-records` 
group by CreditScore order by CreditScore;

 #  customer by balance
  select 
 case 
 when Balance=0 then "Zero Balance"
 when Balance <150000 then "Low Balance"
 when Balance between 150001 and 200000 then "Medium Balance"
 else "High Balance" end as balance_group,
 count(*) as customers_count
 from customer_churn_analysis.`customer-churn-records` 
 group by balance_group order by customers_count desc;
 
 select IsActiveMember, 
 count()
