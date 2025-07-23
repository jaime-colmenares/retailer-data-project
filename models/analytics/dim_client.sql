select
    customer_id,
    customer_name,
    segment,
    first_order_date,
    last_order_date,
    is_churned,
    _base_updated_ts,
    _int_updated_ts,
    current_timestamp as _analytics_updated_ts
from {{ ref("int_client") }}
