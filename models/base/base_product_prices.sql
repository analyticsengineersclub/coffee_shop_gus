SELECT 
    id              AS product_price_id
    ,product_id     AS product_id
    ,price          AS price 
    ,created_at     AS price_valid_start
    ,ended_at       AS price_valid_end

FROM {{ source('coffee_shop','product_prices') }}