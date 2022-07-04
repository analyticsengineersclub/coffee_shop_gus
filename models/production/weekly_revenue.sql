{{ config(
    materialized='view'
) }}

SELECT 
    o.product_category
    ,d.week_in_year
    ,MIN(o.order_date)  AS week_start
    ,MAX(o.order_date)  AS week_end 
    ,SUM(o.order_total) AS total_revenue

FROM {{ ref('stage_orders') }} AS o

LEFT OUTER JOIN {{ ref('date_table') }} AS d 
    ON o.order_date = d.date 

GROUP BY
    o.product_category
    ,d.week_in_year

ORDER BY
    product_category
    ,week_end DESC