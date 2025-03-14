
  
    

        create or replace transient table db_online_learning.mart.contraction
         as
        (

WITH PREVIOUS_REVENUE AS
(
    SELECT
        revenue,
        payment_month,
        lag(revenue) over(order by payment_month) as previous_revenue
    FROM
        db_online_learning.intermediate.Inter_customer  
)
SELECT
    revenue,
    payment_month,
    previous_revenue,
    case 
        when previous_revenue>revenue then previous_revenue-revenue
    else 0
    end as revenue_loss
FROM
    PREVIOUS_REVENUE
        );
      
  