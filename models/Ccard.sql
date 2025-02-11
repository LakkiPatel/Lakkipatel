{{ config(materialized='table') }}

 with cte as 
 (select 
 1 as tranid,
 'Lakki' as Customername,
 1254 as Accountnumber,
 cast('2014-11-30' as date) as Posttime,
 40 as trantype
 )

 select * from cte