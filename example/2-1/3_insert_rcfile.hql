use hive_edu;

FROM rcfile_raw INSERT OVERWRITE TABLE rcfile_columnar select  seq, msg;
