WITH first_purchase AS
(SELECT
    customer_id,
    min(payment_month) as first_purchase
FROM
    db_online_learning.intermediate.Inter_customer
GROUP BY
    customer_id
)
SELECT
    year(first_purchase) as Each_year,
    count(customer_id) as total_no_new_customer
FROM
    first_purchase
GROUP BY
    Each_year