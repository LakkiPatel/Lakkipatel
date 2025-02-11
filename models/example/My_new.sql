CREATE OR REPLACE TABLE {{ ref('my_new_table') }} AS
SELECT
  column1,
  column2,
  column3
FROM
  source_table
WHERE
  some_condition;