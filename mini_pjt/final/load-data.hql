use mini00;

LOAD DATA INPATH '/tmp/upjong_code_init.csv' INTO TABLE INIT_UPJONG_CODE;
LOAD DATA INPATH '/tmp/card_hist_init.csv' INTO TABLE INIT_CARD_HIST;

-- LOAD DATA LOCAL INPATH '/home/hdfs/mini/sample/upjong_code_init.csv' INTO TABLE INIT_UPJONG_CODE;
-- LOAD DATA LOCAL INPATH '/home/hdfs/mini/sample/card_hist_init.csv' INTO TABLE INIT_CARD_HIST;

-- UPJONG_CODE
INSERT OVERWRITE TABLE UPJONG_CODE
SELECT * 
FROM INIT_UPJONG_CODE;

-- CARD_HIST (Dynamic PARTITION)
set hive.exec.dynamic.partition.mode=nonstrict;
INSERT OVERWRITE TABLE CARD_HIST
PARTITION(country, ym, ccd, tm)
SELECT M_DONG_CD
, BAS_MGT_SN
, SF_UPJONG
, SF_UPJONG_NM
, TAMT
, USECNT
, hist.COUNTRY_ENG_NM
, hist.TS_YM
, hist.DAW_CCD
, hist.TM
FROM INIT_CARD_HIST hist;

