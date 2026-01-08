
WITH orders_per_day AS(
     SELECT
date_date,
COUNT(DISTINCT orders_id) as nb_transactions,
ROUND(SUM(revenue),0) as revenue,
ROUND(sum(margin),0) AS margin,
ROUND(SUM(operational_margin),0) as operational_margin,
ROUND(SUM(log_cost),0) as log_cost,
ROUND(SUM(ship_cost),0) as ship_cost,
SUM(quantity) AS quantity
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
)
SELECT
date_date,
nb_transactions,
revenue,
margin,
operational_margin,
log_cost,
ship_cost,
quantity,
ROUND(revenue/NULLIF(nb_transactions,0),2) AS average_basket
FROM orders_per_day
ORDER BY date_date DESC