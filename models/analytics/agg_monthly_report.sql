select
    date_trunc(fod.order_date, month) as period,
    fod.market,
    fod.region,
    dc.segment,
    dp.category,
    dp.sub_category,
    sum(fod.sales) as sales,
    sum(fod.profit) as profit
from {{ ref("fact_order_detail") }} as fod
join {{ ref("dim_client") }} as dc on fod.customer_id = dc.customer_id
join {{ ref("dim_product") }} as dp on fod.product_id = dp.product_id
group by 1, 2, 3, 4, 5, 6
order by 1
