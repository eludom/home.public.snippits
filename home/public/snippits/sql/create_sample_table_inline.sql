-- https://stackoverflow.com/questions/58121195/bigquery-create-small-sample-table-all-in-one-query

with foo as (
     SELECT * FROM UNNEST([
       STRUCT(1 AS a, 'Alpha' AS b),
       (2, 'Bravo'),
       (3, 'Charlie'),
       (4, 'Delta')
       ])
       )
SELECT * FROM foo
