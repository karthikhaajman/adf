SELECT
    company,
    cast(customer_id as int) AS CUSTOMER_ID,
    customer_name as customer_name
FROM
    db_online_learning.RAW.CUSTOMERS
where customer_name is not null
and company is not null
and customer_id is not null