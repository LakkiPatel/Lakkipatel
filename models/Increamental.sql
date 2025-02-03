{{ config(materialized='table') }}
SELECT
    tranid,
    posttime
FROM
    {{ ref('Ccard_new') }} 
