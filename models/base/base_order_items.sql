SELECT
    id                  AS order_item_id
    ,order_id           AS order_id
    ,product_id         AS product_id

FROM {{ source('coffee_shop','order_items') }}