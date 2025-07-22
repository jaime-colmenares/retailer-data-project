select
    order_id,
    sum(sales) as sum_sales, 
    sum(profit) as sum_profit
from {{ ref("base_transaction") }}
group by 1