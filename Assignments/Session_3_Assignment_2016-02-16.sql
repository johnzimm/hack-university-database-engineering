-- select 5 rows from table
SELECT * FROM crimedataraw LIMIT 5;

-- select date and neighborhood for 10 rows
SELECT "ReportDate","Neighborhood" FROM crimedataraw LIMIT 10;

-- select the hour of the day for 10 rows
SELECT "ReportTime" FROM crimedataraw LIMIT 10;
SELECT EXTRACT(HOUR FROM "ReportTime") FROM crimedataraw LIMIT 10;

-- select the second word of the neighborhood name
SELECT SPLIT_PART("Neighborhood", ' ', 2) as secondword FROM crimedataraw LIMIT 100;

-- Create a sentence describing what happened on each row for 100 rows (using a query)
-- MajorOffenseType Occurred at Address in Neighborhood at ReportTime ReportDate
SELECT "MajorOffenseType" || ' Occurred at ' || "Address" || ' in ' || "Neighborhood" || ' at ' || "ReportTime" || ' ' || "ReportDate"
FROM crimedataraw LIMIT 10;

-- first row inserted
SELECT * FROM crimedataraw ORDER BY "ID" ASC LIMIT 1;

-- last row inserted
SELECT * FROM crimedataraw ORDER BY "ID" DESC LIMIT 1;

-- total crimes by neighborhood
SELECT "Neighborhood", COUNT("MajorOffenseType") FROM crimedataraw GROUP BY "Neighborhood"; 

-- min and max coordinates by neighborhood
SELECT "Neighborhood",MIN("xcoordinate") AS MIN_X,MIN("ycoordinate") as MIN_Y, MAX("xcoordinate") as MAX_X, MAX("ycoordinate") as MAX_Y
FROM crimedataraw GROUP BY "Neighborhood";

-- which hour has the most crimes?
SELECT EXTRACT(HOUR FROM "ReportTime") AS hour, COUNT("MajorOffenseType") AS num_offences_in_hour 
FROM crimedataraw 
GROUP BY hour 
ORDER BY num_offences_in_hour DESC
LIMIT 1;


-- which day of week?
SELECT EXTRACT(DOW FROM "ReportDate") AS dow, COUNT("MajorOffenseType") AS num_offences_on_dow 
FROM crimedataraw 
GROUP BY dow 
ORDER BY num_offences_on_dow DESC
LIMIT 10;

--Assuming that each neighborhood is square and lines up with the coordinate system, which neighborhood has the highest crime rate per square foot?  Do it with one query?
SELECT  "Neighborhood", 
	COUNT("Neighborhood") / 
		(MAX("xcoordinate") - MIN("xcoordinate")) *  (MAX("ycoordinate") - MIN("ycoordinate")) 
			AS crimes_per_sqft
FROM crimedataraw
GROUP BY "Neighborhood"
HAVING  (MAX("xcoordinate") - MIN("xcoordinate")) *  (MAX("ycoordinate") - MIN("ycoordinate")) > 0
ORDER BY 2 DESC;

-- Which neighborhood has the highest rate of each type of crime?
SELECT "Neighborhood", "MajorOffenseType"
FROM crimedataraw
ORDER BY "Neighborhood", "MajorOffenseType"
LIMIT 200;

-- Which season has the highest rate of crime?