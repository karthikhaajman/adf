
  
    

        create or replace transient table db_online_learning.staging.stg_Transactions
         as
        (SELECT
    cast(customer_id as int) AS CUSTOMER_ID,
    product_id,
    cast(CONCAT(SUBSTRING(payment_month, 1, 4), '-', SUBSTRING(payment_month, 9, 2), '-', SUBSTRING(payment_month, 6, 2)) as date) AS payment_month,
    revenue_type AS revenue_type,
    cast(revenue as float) AS REVENUE,
    cast(quantity as int) AS QUANTITY,
    companies
FROM
    db_online_learning.RAW.TRANSACTIONS
        );
      
  