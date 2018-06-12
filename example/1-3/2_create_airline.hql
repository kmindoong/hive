use hive_edu;

drop table if exists airline;

CREATE EXTERNAL TABLE IF NOT EXISTS airline(
Airlineid   STRING,
Name        STRING,
Alias       STRING,
IATA        STRING,
ICAO        STRING,
Callsign    STRING,
Country     STRING,
Active      STRING
)
COMMENT 'This is airline information data'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES
TERMINATED BY '\n'
STORED AS TEXTFILE LOCATION '/hive_edu/airline';

