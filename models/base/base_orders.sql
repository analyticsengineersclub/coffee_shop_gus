SELECT
    id              AS order_id
    ,created_at     AS order_datetime
    ,customer_id    AS customer_id
    ,total          AS order_total
    ,address        AS order_street_address
    ,state          AS order_state
    ,zip            AS order_zip
    
FROM {{ source('coffee_shop','orders') }}