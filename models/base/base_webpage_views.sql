SELECT
    id              AS pageview_id
    ,visitor_id     AS visitor_id
    ,device_type    AS device_type
    ,timestamp      AS pageview_timestamp
    ,page           AS webpage
    ,customer_id    AS customer_id

FROM {{ source('web_tracking','pageviews') }}