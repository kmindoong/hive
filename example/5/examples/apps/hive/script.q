USE xademo;
DROP TABLE IF EXISTS new_count_tab;
CREATE TABLE new_count_tab AS SELECT unix_timestamp(), count(*) FROM call_detail_records;

