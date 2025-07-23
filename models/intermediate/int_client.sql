with
    max_order_calc as (
        select max(order_date) as report_date
        from {{ ref("base_transaction") }}
    ),
    first_order_ranking as (
        select
            *,
            dense_rank() over (
                partition by customer_id order by order_date, order_id, product_name
            ) as first_order_rank_num
        from {{ ref("base_transaction") }}
    ),
    first_order as (
        select
            _base_updated_ts,
            current_timestamp as _int_updated_ts,
            customer_id,
            customer_name,
            segment,
            order_date as first_order_date
        from first_order_ranking
        where first_order_rank_num = 1
    ),
    last_order_ranking as (
        select
            *,
            dense_rank() over (
                partition by customer_id
                order by order_date desc, order_id desc, product_name desc
            ) as last_order_rank_num
        from {{ ref("base_transaction") }}
    ),
    last_order as (
        select
            customer_id,
            order_date as last_order_date
        from last_order_ranking
        where last_order_rank_num = 1
    )

select
    fo._base_updated_ts,
    fo._int_updated_ts,
    fo.customer_id,
    fo.customer_name,
    fo.segment,
    fo.first_order_date,
    lo.last_order_date,
    if(
        (date_diff((select report_date from max_order_calc), lo.last_order_date, day))
        > 90,
        'TRUE',
        'FALSE'
    ) as is_churned
from first_order as fo
join last_order as lo on fo.customer_id = lo.customer_id
order by customer_id