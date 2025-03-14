SELECT
    cast(customer_id as int) AS CUSTOMER_ID,
    country,
    region
FROM
    {{source("raw_source","COUNTRY")}}