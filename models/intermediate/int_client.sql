with
    all_transactions as (
        select
            *,
            dense_rank() over (
                partition by customer_id order by _source_row_id
            ) as rank_num
        from {{ ref("base_transaction") }}
    )

select
    _base_updated_ts,
    current_timestamp as _int_updated_ts,
    customer_id,
    customer_name,
    segment,
    order_date as first_order_date
from all_transactions
where rank_num = 1
