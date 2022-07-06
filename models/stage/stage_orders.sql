SELECT
    o.order_id 
    ,o.order_datetime
    ,DATE(o.order_datetime) AS order_date
    ,TIME(o.order_datetime) AS order_time
    ,c.customer_name
    ,c.customer_id
    ,oi.order_item_id
    ,p.product_name
    ,p.product_category
    ,o.order_total
    ,o.order_state
    ,o.order_zip
    
FROM {{ ref( 'base_orders') }} AS o 

LEFT OUTER JOIN {{ ref('base_customers') }} AS c
    ON o.customer_id = c.customer_id

LEFT OUTER JOIN {{ ref('base_order_items') }} AS oi 
    ON o.order_id = oi.order_id

LEFT OUTER JOIN {{ ref('base_products') }} AS p
    ON oi.product_id = p.product_id

