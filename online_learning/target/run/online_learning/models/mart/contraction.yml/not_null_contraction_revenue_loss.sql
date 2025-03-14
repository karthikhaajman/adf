select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select revenue loss
from db_online_learning.mart.contraction
where revenue loss is null



      
    ) dbt_internal_test