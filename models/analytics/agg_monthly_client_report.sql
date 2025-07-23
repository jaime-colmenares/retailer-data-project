with
    all_clients as (
        select
            date_trunc(order_date, month) as period,
            count(distinct customer_id) as num_customers
        from {{ ref("fact_order_detail") }}
        group by 1
        order by 1
    ),
    new_clients as (
        select
            date_trunc(first_order_date, month) as period,
            count(distinct customer_id) as num_new_customers
        from {{ ref("dim_client") }}
        group by 1
        order by 1
    )

select
    ac.period,
    ac.num_customers,
    nc.num_new_customers,
    ac.num_customers - nc.num_new_customers as num_existing_customers
from all_clients as ac
join new_clients as nc on ac.period = nc.period
order by 1
