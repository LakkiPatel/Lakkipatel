{{ config(materialized='table') }}

 with cte as 
 (select 
 tranid,
 {{ convert_to_uppercase('Customername') }} AS Customername,
 Accountnumber,
 Posttime,
 trantype
 from 
 {{ ref('Ccard')}}
 )

 select * from cte
