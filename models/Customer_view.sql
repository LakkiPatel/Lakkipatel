{{ config(
    materialized='view',
    enabled=true
) }}

with Customer as (
    select
        Skey,
        Customerid,
        Name,
        date,
        mobilenumber
    
    from
        {{ ref('seed_customer') }}
)

select
    *
from
    Customer