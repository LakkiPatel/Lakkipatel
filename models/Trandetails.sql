{{ config(
    materialized='incremental',
    incremental_strategy = 'merge',
    unique_key = 'Tranid',
    merge_exclude_columns = ['Customerid'],
    enabled = true
)}}

with Tran as (
    select
    tranid,
    Customername,
    Accountnumber,
    Posttime,
    trantype,
    from 
    {{ ref('Ccard2') }}
),
Customer as (
    select
        Skey,
        Customerid,
        Name,
        date,
        mobilenumber
        From {{ref('Customer_view') }}
),
final as (
    select * from Tran t join Customer c on (t.Customername=c.name)  
{% if is_incremental() %}
{% do log("lakki", info=True) %}
    WHERE 
    t.Posttime > (select max(Posttime) from {{ this }}) 
    or  c.date > (select max(date) from {{ this }} )
{% endif %}
)
Select * from final 
