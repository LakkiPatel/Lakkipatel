
{ config(
    materialized='incremental'
) }}

with source_data as (
    select
    tranid,
    Customername,
    Accountnumber,
    Posttime,
    trantype,
    from 
    {{ ref('Ccard1') }}
)

select
    * from  source_data
{% if is_incremental() %}
    WHERE Posttime > (select max(Posttime) from {{ this }})
{% endif %}