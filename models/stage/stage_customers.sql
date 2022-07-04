SELECT    
    c.customer_id
    ,c.customer_name
    ,c.customer_email
    ,SUM(o.order_total)             AS lifetime_spend
    ,DATE(MIN(o.order_datetime))    AS date_of_first_order

FROM {{ ref('base_customers') }} AS c 

LEFT OUTER JOIN {{ ref('base_orders') }} AS o 
    ON c.customer_id = o.customer_id

GROUP BY 
    c.customer_id
    ,c.customer_name
    ,c.customer_email

ORDER BY
    c.customer_name
    