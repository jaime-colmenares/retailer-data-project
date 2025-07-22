select
    product_id,
    category,
    sub_category,
    _base_updated_ts,
    _int_updated_ts,
    current_timestamp as _analytics_updated_ts
from {{ ref("int_product") }}
