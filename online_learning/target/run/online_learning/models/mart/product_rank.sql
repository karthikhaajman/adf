
  
    

        create or replace transient table db_online_learning.mart.product_rank
         as
        (

SELECT
    product_id,
    sum(revenue*quantity) as total_product_revenue,
    rank() over(order by total_product_revenue desc) as product_rank
FROM
    db_online_learning.intermediate.Inter_customer
GROUP BY
    product_id
        );
      
  