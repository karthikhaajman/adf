
  
    

        create or replace transient table db_online_learning.intermediate.Inter_customer
         as
        (SELECT
    t.customer_id,
    customer_name,
    revenue,
    quantity,
    payment_month,
    product_id
FROM
    db_online_learning.staging.stg_Transactions t
JOIN
    db_online_learning.staging.stg_Customers c
ON
    t.customer_id=c.customer_id
        );
      
  