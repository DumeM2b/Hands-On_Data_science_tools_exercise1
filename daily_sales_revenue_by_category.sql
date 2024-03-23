{{ config(materialized='table') }}

select 
    sal.sale_date, 
    SUM((sal.quantity * pro.price)) as Revenue

from {{ ref('stg_sales') }} as sal
join {{ ref('stg_products') }} as pro
    on sal.product_id=pro.product_id
    
group by sal.sale_date
order by sal.sale_date DESC
