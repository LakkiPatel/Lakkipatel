{{ config(materialized='table') }}
SELECT
    tranid,
    posttime
FROM
    {{ ref('Tran2') }} 