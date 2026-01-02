SELECT
s.product_id,
p.purchase_price,
s.date_date,
s.revenue,
s.quantity,
s.orders_id,
ROUND(s.quantity*p.purchase_price ,2) AS purchase_cost,
ROUND(s.revenue-(s.quantity*p.purchase_price),2) AS margin
FROM {{ref("stg_raw__sales")}} AS s 
LEFT JOIN {{ref("stg_raw__product")}} AS p 
USING (product_id)