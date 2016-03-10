SELECT * FROM public.portland_oregon_osm_roads LIMIT 100;

SELECT 
  gid, id, osm_id, type, name, tunnel, bridge, oneway, ref, z_order, access, service, class, ST_ASTEXT(geom) 
FROM public.portland_oregon_osm_roads LIMIT 100;


--Find streets that intersect with NW Glisan
SELECT g1.name, g2.name, ST_ASText(ST_Intersection(g1.geom, g2.geom))
FROM public.portland_oregon_osm_roads g1 INNER JOIN public.portland_oregon_osm_roads g2
    ON ST_CROSSES(g1.geom, g2.geom)
WHERE g1.name LIKE 'Northwest Glisan Street'
ORDER BY ST_X(ST_Intersection(g1.geom, g2.geom))


CREATE TABLE routes (
	route_id INTEGER NOT NULL,
	agency_id VARCHAR NOT NULL,
	route_short_name INTEGER,
	route_long_name VARCHAR NOT NULL,
	route_type INTEGER NOT NULL,
	route_url VARCHAR NOT NULL,
	route_sort_order INTEGER NOT NULL
);

CREATE TABLE shapes (
	shape_id INTEGER NOT NULL,
	shape_pt_lat FLOAT NOT NULL,
	shape_pt_lon FLOAT NOT NULL,
	shape_pt_sequence INTEGER NOT NULL,
	shape_dist_traveled FLOAT NOT NULL
);

COPY routes FROM '/vagrant/data/trimet/gtfs/routes.txt' WITH (FORMAT CSV, HEADER)

COPY shapes FROM '/vagrant/data/trimet/gtfs/shapes.txt' WITH (FORMAT CSV, HEADER)


SELECT shape_id, 
    ST_MakeLine(ST_SetSRID(
        ST_MakePoint(shape_pt_lat, shape_pt_lon), 4326) ORDER BY shape_pt_sequence) 
    as shape
INTO shapes_combined
FROM shapes
GROUP BY shape_id;

SELECT *, ST_ASTEXT(shape)
FROM shapes_combined
LIMIT 10;