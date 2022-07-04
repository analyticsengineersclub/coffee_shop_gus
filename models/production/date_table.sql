SELECT
  FORMAT_DATE('%F', d)      AS id
  ,d                        AS date
  ,EXTRACT(YEAR FROM d)     AS year
  ,EXTRACT(WEEK FROM d)     AS week_in_year
  ,EXTRACT(DAY FROM d)      AS year_day
  ,EXTRACT(YEAR FROM d)     AS fiscal_year
  ,FORMAT_DATE('%Q', d)     AS fiscal_qtr
  ,EXTRACT(MONTH FROM d)    AS month_number
  ,FORMAT_DATE('%B', d)     AS month_name
  ,FORMAT_DATE('%w', d)     AS weekday_number
  ,FORMAT_DATE('%A', d)     AS weekday_name
  ,(CASE 
    WHEN FORMAT_DATE('%A', d) IN ('Saturday','Sunday') 
    THEN 'Weekend' ELSE 'Weekday' END) 
                          AS weekday_weekend
FROM (
  SELECT *
  FROM
    UNNEST(GENERATE_DATE_ARRAY('2021-01-01','2021-12-31',INTERVAL 1 DAY)) AS d )