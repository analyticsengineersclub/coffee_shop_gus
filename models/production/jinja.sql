SELECT
  date_trunc(order_datetime, month) AS date_month
  ,SUM(CASE 
        WHEN product_category = 'coffee beans' THEN order_total END)
                            AS coffee_beans_amount
  ,SUM(CASE
        WHEN product_category = 'merch' THEN order_total END) 
                            AS merch_amount
  ,SUM(CASE
        WHEN product_category = 'brewing supplies' THEN order_total END)
                            AS brewing_supplies_amount
-- you may have to `ref` a different model here, depending on what you've built previously

FROM {{ ref('stage_orders') }}

GROUP BY
    date_month

ORDER BY
    date_month