WITH total_revenue_cal AS(
SELECT
    customer_id,
    sum(cast(revenue as float)) as total_revenue
FROM  
    db_online_learning.staging.stg_Transactions
GROUP BY
    customer_id),
getting_overall_details AS
(
	SELECT
		t.*,
		c.customer_name 
	FROM 
		total_revenue_cal t
	join 
		db_online_learning.staging.stg_Customers c
	on 
		t.customer_id=c.customer_id
	group by 
		t.customer_id,
		customer_name,
		t.total_revenue
)
SELECT *,
	rank() over(order by total_revenue desc) AS customer_rank 
FROM
	getting_overall_details