{{ config(materialized='table') }}

select 
    sal.sale_date, 
    SUM((sal.quantity * pro.price)) as Revenue, 
    pro.category
    
from {{ ref('stg_sales') }} as sal
join {{ ref('stg_products') }} as pro
    on sal.product_id=pro.product_id

group by sal.sale_date, pro.category
order by sal.sale_date DESC
