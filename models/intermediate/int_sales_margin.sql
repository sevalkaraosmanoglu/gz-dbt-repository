SELECT
s.products_id,
p.purchase_price,
s.date_date,
s.revenue,
s.quantity,
ROUND(s.quantity*p.purchase_price ,2) as purchase_cost,
ROUND(s.revenue-(s.quantity*p.purchase_price),2) as margin
FROM {{ref("stg_raw__sales")}} s 
LEFT JOIN {{ref("stg_raw__product")}} p 
USING s.products_id=p.products_id