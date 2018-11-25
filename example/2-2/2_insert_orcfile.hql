use hive_edu;

FROM airport INSERT OVERWRITE TABLE orcfile_columnar select *;

FROM airport INSERT OVERWRITE TABLE orcfile_columnar1 select *;
