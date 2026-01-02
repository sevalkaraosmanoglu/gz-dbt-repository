SELECT
m.orders_id,
m.date_date,
m.revenue,
m.quantity,
m.purchase_cost,
m.margin,
ROUND(m.margin+s.shipping_fee-(s.ship_cost-s.log_cost),2) AS operational_margin
FROM {{ ref("int_orders_margin") }} m 
LEFT JOIN {{ ref("stg_raw__ship") }} s
USING (orders_id)
ORDER BY orders_id DESC
