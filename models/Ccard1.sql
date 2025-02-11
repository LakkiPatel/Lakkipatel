{{ config(materialized='table') }}

 with ct as 
 (select 
 tranid,
 {{ convert_to_uppercase('Customername') }} AS Customername,
 Accountnumber,
 Posttime,
 trantype
 from 
 {{ ref('Ccard')}}
 )

 select * from ct
