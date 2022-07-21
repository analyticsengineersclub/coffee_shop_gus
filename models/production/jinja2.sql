{% set products = ["coffee_beans","merch","brewing_supplies"] | replace("_"," ") %}

SELECT
  date_trunc(order_datetime, month) AS date_month
{% for product in products %}
  ,SUM(CASE
        WHEN product_category = '{{product}}' THEN order_total END)
                            AS {{product}}_amount 
{% endfor %}
--   ,SUM(CASE 
--         WHEN product_category = 'coffee beans' THEN order_total END)
--                             AS coffee_beans_amount
--   ,SUM(CASE
--         WHEN product_category = 'merch' THEN order_total END) 
--                             AS merch_amount
--   ,SUM(CASE
--         WHEN product_category = 'brewing supplies' THEN order_total END)
--                             AS brewing_supplies_amount

FROM {{ ref('stage_orders') }}

GROUP BY
    date_month

ORDER BY
    date_month