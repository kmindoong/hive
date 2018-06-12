use hive_edu;

FROM airport
INSERT OVERWRITE TABLE airport_partition PARTITION (year, month)
SELECT
    DayofMonth          ,
    DayOfWeek           ,
    DepTime             ,
    CRSDepTime          ,
    ArrTime             ,
    CRSArrTime          ,
    UniqueCarrier       ,
    FlightNum           ,
    TailNum             ,
    ActualElapsedTime   ,
    CRSElapsedTime      ,
    AirTime             ,
    ArrDelay            ,
    DepDelay            ,
    Origin              ,
    Dest                ,
    Distance            ,
    TaxiIn              ,
    TaxiOut             ,
    Cancelled           ,
    CancellationCode    ,
    Diverted            ,
    CarrierDelay        ,
    WeatherDelay        ,
    NASDelay            ,
    SecurityDelay       ,
    LateAircraftDelay   ,
    Year                ,
    Month
WHERE Cancelled='1';
