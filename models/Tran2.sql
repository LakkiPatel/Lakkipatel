/*{{ config(materialized='table') }}
SELECT
    tranid,
    posttime
FROM
    {{ ref('Tran1') }}*/
{{ config(materialized='incremental') }}
SELECT
    tranid,
    posttime
FROM
    {{ ref('Tran1') }} 
 {% if is_incremental() %}
WHERE
    posttime > '2023-01-01'
{% endif %}

