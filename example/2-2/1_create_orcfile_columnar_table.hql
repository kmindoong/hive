use hive_edu;

drop table orcfile_columnar;

CREATE EXTERNAL TABLE IF NOT EXISTS orcfile_columnar(
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
COMMENT 'This is airport data compressed by orc type'
STORED AS orc LOCATION '/hive_edu/orcfile_columnar';


