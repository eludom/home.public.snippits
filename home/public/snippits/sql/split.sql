-- Experiments with creating dummy records and splitting strings to create new columns
--
-- https://stackoverflow.com/questions/44056274/splitting-substrings-and-creating-new-columns-for-each-in-big-query

-- Create a dummy record
WITH dummy as (
    SELECT "foo" as foo, 1 as bar, "a;b;c" as baz

 )
-- Split out a semicolon separatated field
 ,splitup as (
SELECT
  foo,bar,split(baz,";") as baz_split
  FROM dummy
 )
-- create new columns from the split values
 SELECT foo,
   bar,
   baz_split[OFFSET(0)] AS thing1,
   baz_split[OFFSET(1)] AS thing2,
   baz_split[OFFSET(2)] AS thing3
 from splitup
