use hive_edu;

select * from airport_bucket tablesample(bucket 1 out of 10 on FlightNum) s ;
