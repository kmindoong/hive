use hive_edu;

drop table if exists rcfile_columnar;

create table rcfile_columnar (seq string , msg string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.serde2.columnar.ColumnarSerDe'
STORED AS
INPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.RCFileOutputFormat'
LOCATION '/hive_edu/rcfile_columnar';
