-- Inner query runs once.
SELECT "Neighborhood"
FROM crimedataraw o
WHERE EXISTS (
	SELECT 1 FROM crimedataraw i 
		WHERE i."Neighborhood" = o."Neighborhood" 
			AND i."MajorOffenseType" = 'Runaway')
GROUP BY "Neighborhood";