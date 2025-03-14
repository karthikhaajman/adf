SELECT 
     product_id,
     cast(product_family as varchar(50)) AS PRODUCT_FAMILY,
     cast(product_sub_family as varchar(100)) AS product_sub_family 
FROM
    db_online_learning.RAW.PRODUCTS