SELECT
  customer_id
  , customer_name
  , segment
  , first_order_date
  ,  _base_updated_ts
  , _int_updated_ts
  , CURRENT_TIMESTAMP AS _analytics_updated_ts
FROM retailer-data-project.dbt_jcolmenares_intermediate.int_client