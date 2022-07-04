SELECT
    id              AS product_id
    ,name           AS product_name
    ,category       AS product_category
    ,created_at     AS product_create_date

FROM {{ source('coffee_shop','products')}}