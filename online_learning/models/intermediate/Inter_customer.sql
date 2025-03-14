SELECT
    t.customer_id,
    customer_name,
    revenue,
    quantity,
    payment_month,
    product_id
FROM
    {{ref('stg_Transactions')}} t
JOIN
    {{ref('stg_Customers')}} c
ON
    t.customer_id=c.customer_id