use hive_edu;

drop table if exists airport;

CREATE EXTERNAL TABLE IF NOT EXISTS airport(
Year                 STRING,
Month                STRING,
DayofMonth           STRING,
DayOfWeek            STRING,
DepTime              STRING,
CRSDepTime           STRING,
ArrTime              STRING,
CRSArrTime           STRING,
UniqueCarrier        STRING,
FlightNum            STRING,
TailNum              STRING,
ActualElapsedTime    STRING,
CRSElapsedTime       STRING,
AirTime              STRING,
ArrDelay             STRING,
DepDelay             STRING,
Origin               STRING,
Dest                 STRING,
Distance             STRING,
TaxiIn               STRING,
TaxiOut              STRING,
Cancelled            STRING,
CancellationCode     STRING,
Diverted             STRING,
CarrierDelay         STRING,
WeatherDelay         STRING,
NASDelay             STRING,
SecurityDelay        STRING,
LateAircraftDelay    STRING
)
COMMENT 'This is airport on-time performance data'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES
TERMINATED BY '\n'
STORED AS TEXTFILE LOCATION '/hive_edu/airport';

