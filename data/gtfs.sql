CREATE TABLE stops (
	stop_id VARCHAR NOT NULL,
	stop_code INTEGER,
	stop_name VARCHAR NOT NULL,
	stop_desc VARCHAR,
	stop_lat FLOAT NOT NULL,
	stop_lon FLOAT NOT NULL,
	zone_id VARCHAR,
	stop_url VARCHAR,
	location_type INTEGER NOT NULL,
	parent_station VARCHAR,
	direction VARCHAR,
	position VARCHAR
);