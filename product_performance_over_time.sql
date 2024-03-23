{{ config(materialized='table') }}

select 
    sal.sale_date, 
    SUM((sal.quantity * pro.price)) as Revenue, 
    pro.product_name

from {{ ref('stg_sales') }} as sal
join {{ ref('stg_products') }} as pro
    on sal.product_id=pro.product_id
    
group by sal.sale_date, pro.product_name
order by sal.sale_date DESC
