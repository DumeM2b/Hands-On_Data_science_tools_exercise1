{{ config(materialized='table') }}

select 
    pro.category, 
    SUM((sal.quantity * pro.price)) as Revenue

from {{ ref('stg_sales') }} as sal
join {{ ref('stg_products') }} as pro
    on sal.product_id=pro.product_id
    
group by pro.category
  
