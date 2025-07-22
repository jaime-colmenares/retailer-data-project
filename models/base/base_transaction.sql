SELECT
  _file
  , _line
  , _modified AS modified_ts
  , _fivetran_synced AS _fivetran_synced_ts
  , CURRENT_TIMESTAMP AS _base_updated_ts
  , row_id AS _source_row_id
  , customer_id
  , customer_name
  , segment
  , city
  , state
  , postal_code
  , country
  , market
  , region
  , product_id
  , product_name
  , category
  , sub_category
  , order_id
  , order_date
  , order_priority
  , ship_date
  , ship_mode
  , quantity
  , sales
  , discount
  , profit
FROM {{ source('google_drive', 'transactions') }}