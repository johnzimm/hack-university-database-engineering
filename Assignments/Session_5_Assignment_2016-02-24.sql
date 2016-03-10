SELECT * from crimedataraw;

-- TASKS

-- 1. select the crime types and counts into a temp table.  
--    select 1 record from this table and then delete that record.  
--    Repeat until the table is empty.
DROP TABLE crime_temp;
SELECT DISTINCT major_offense_type,COUNT(*) AS occurrences INTO temp crime_temp FROM crimedataraw GROUP BY major_offense_type;
SELECT * FROM crime_temp;

DELETE FROM crime_temp
WHERE major_offense_type IN (SELECT major_offense_type FROM crime_temp LIMIT 1);

SELECT * FROM crime_temp;
--- Above is not quite correct
------
SELECT major_offense_type, COUNT(*) AS occurences
INTO TEMP t
FROM crimedataraw
GROUP BY major_offense_type;

SELECT * FROM t ORDER BY major_offense_type LIMIT 10;

DELETE FROM t
WHERE major_offense_type = (SELECT major_offense_type FROM t ORDER BY major_offense_type LIMIT 1);

SELECT * FROM t ORDER BY major_offense_type LIMIT 10;

DROP TABLE t;


-- 2. create a CTE to join crimedataraw and the two related tables.  select * from it (10 rows).


-- 3. load world data FROM postgres example db site INto new db called world
psql -d world < world.sql

-- 4. draw ERD for world

-- 5. create a full join query using cross join and union

-- 6. create a new varchar column called test_column on crimedataraw.  
--    Run an update statement to assign the value 'value' to the test column for every row.  
--    Write down how long it took.  Run the update several times.  Write down the execution time for each run.

-- 7. create primary key constraints on all appropriate columns for 3 crime data tables

-- 8. create foreign key constraints on all appropriate columns for crime data tables

-- 9.1 join all three tables for crime data and pull back all the columns.  How long did it take?

-- 9.2 create indexes on all id fields for crime data.

-- 9.3 how long does the query from 8.1 take now?

-- 10.1 use a correlated subquery on crime data tables

-- 10.2 add an index for that subquery

-- 10.3 how long does 9.1 take now?

-- 11. create 3 new indexes on crimedataraw that include the column test_column.  How long does the update from 6 take now?

-- 12. draw an ERD for our crime data.  
--     What would you change to make it 3rd normal form?  
--     What would you change to make it more useful for our queries?