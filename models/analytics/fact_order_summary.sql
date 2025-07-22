select
    order_id,
    sum_sales,
    sum_profit,
    _int_updated_ts,
    current_timestamp as _analytics_updated_ts
from {{ ref("int_order_summary") }}
