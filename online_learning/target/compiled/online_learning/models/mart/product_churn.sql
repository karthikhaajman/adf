


with last_purchased as

(select
    product_id,
    max(payment_month) as lastly_purchased,
   -- lag(payment_month) over(order by payment_month) as previous_date
from
    db_online_learning.staging.stg_Transactions
group by
    product_id)
select 
    product_id,
    case 
        when year(lastly_purchased)-year(cast('2020-06-01' as date))>=1 then 'yes'
        else 'no'
    end as ltm_product_churn
from last_purchased