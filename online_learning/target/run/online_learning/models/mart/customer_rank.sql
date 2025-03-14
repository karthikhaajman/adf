
  
    

        create or replace transient table db_online_learning.mart.customer_rank
         as
        (

WITH total_revenue_cal AS
(
SELECT
    customer_id,
    customer_name,
    sum(revenue*quantity) as total_revenue
FROM  
    db_online_learning.intermediate.Inter_customer
GROUP BY
    customer_id,
    customer_name
)
SELECT *,
    rank() over(order by total_revenue desc) AS customer_rank
FROM
    total_revenue_cal
        );
      
  