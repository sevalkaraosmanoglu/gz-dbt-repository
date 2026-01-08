SELECT
orders_id,
MAX(date_date) as date_date,
ROUND(sum(revenue),2) as revenue,
ROUND(sum(quantity),2) as quantity,
ROUND(sum(purchase_cost),2) as purchase_cost,
ROUND(sum(margin),2) as margin
from {{ ref("int_sales_margin") }}
GROUP BY orders_id
ORDER BY orders_id DESC