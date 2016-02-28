SELECT * FROM crimedataraw LIMIT 100;

-- rename crimedataraw columns to follow postgres standards.  We should all end up with the exact same names.
-- ALTER TABLE crimedataraw RENAME "RecordID" to record_id;
-- ALTER TABLE crimedataraw RENAME "ReportDate" to report_date;
-- ALTER TABLE crimedataraw RENAME "ReportTime" to report_time;
-- ALTER TABLE crimedataraw RENAME "MajorOffenseType" to major_offense_type;
-- ALTER TABLE crimedataraw RENAME crime_type TO major_offense_type;
-- ALTER TABLE crimedataraw RENAME "Address" to address;
-- ALTER TABLE crimedataraw RENAME "Neighborhood" to neighborhood;
-- ALTER TABLE crimedataraw RENAME "PolicePrecinct" to police_precinct;
-- ALTER TABLE crimedataraw RENAME "PoliceDistrict" to police_district;


-- for each crime type, count the number of neighborhoods where it happened
SELECT major_offense_type,COUNT(DISTINCT neighborhood)
FROM crimedataraw
GROUP BY major_offense_type;


-- create sentences for the different crime types saying "<crime type> isn't ok."
SELECT DISTINCT 'Commiting a ' || LOWER(major_offense_type) || ' violation isn''t ok.' AS sentence
FROM crimedataraw;

-- extract distinct crime types from crimedataraw using select into and then add an id column
SELECT DISTINCT major_offense_type INTO crime_types FROM crimedataraw;
ALTER TABLE crime_types ADD COLUMN id SERIAL;
-- ALTER TABLE crime_types DROP COLUMN id;
-- DROP TABLE crime_types;


-- add appropriate crime type id to crimedataraw
ALTER TABLE crimedataraw ADD COLUMN major_offense_type_id INTEGER;
UPDATE crimedataraw SET crime_type_id = id

-- repeat for neighborhood names using create table and not altering the table after
create table neighborhoods
(
    id serial,
    neighborhood varchar
);

-- DROP TABLE neighborhoods;

-- Pull back the number of each crime type committed per neighborhood (0 if there were 0)

-- show 10 crimes and the type of the previous crime committed in that same neighborhood

-- modify crime type table to include cost_per_crime and populate with data similar to what's found here http://www.rand.org/jie/justice-policy/centers/quality-policing/cost-of-crime.html  Insert values into a temp table and do an join to allow an batch update to the major crime table

-- Pull back total crimes and total crime cost for each neighborhood

-- Pull back total crimes and total crime cost for the neighborhood with the highest total cost

-- Which neighborhood has the highest rate of each type of crime?