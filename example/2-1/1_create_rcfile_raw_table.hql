use hive_edu;

drop table if exists rcfile_raw;

CREATE EXTERNAL TABLE IF NOT EXISTS rcfile_raw(
seq STRING,
msg STRING
)
COMMENT 'This is rcfile_test table'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
STORED AS TEXTFILE LOCATION '/hive_edu/rcfile_raw';
