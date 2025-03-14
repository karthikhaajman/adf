
  
    

        create or replace transient table db_online_learning.staging.stg_Country
         as
        (SELECT
    cast(customer_id as int) AS CUSTOMER_ID,
    country,
    region
FROM
    db_online_learning.RAW.COUNTRY
        );
      
  