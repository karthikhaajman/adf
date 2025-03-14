{{
    config(
        tags=['rank']
    )
}}

SELECT
    product_id,
    sum(revenue*quantity) as total_product_revenue,
    rank() over(order by total_product_revenue desc) as product_rank
FROM
    {{ref('Inter_customer')}}
GROUP BY
    product_id
