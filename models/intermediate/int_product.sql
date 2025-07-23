with
    all_transactions as (
        select
            *,
            dense_rank() over (
                partition by product_id order by order_date, order_id, product_name
            ) as rank_num
        from {{ ref("base_transaction") }}
    )

select
    _base_updated_ts,
    current_timestamp as _int_updated_ts,
    product_id,
    category,
    sub_category
from all_transactions
where rank_num = 1
