-- database 생성
DROP DATABASE IF EXISTS mini00 CASCADE;
CREATE DATABASE IF NOT EXISTS mini00 COMMENT 'mini00 project database' LOCATION '/mini00';
DESCRIBE DATABASE mini00;

use mini00;

-- Table 생성
-- 업종코드 (초기적재)
DROP TABLE IF EXISTS INIT_UPJONG_CODE;
CREATE EXTERNAL TABLE IF NOT EXISTS INIT_UPJONG_CODE (
    UPJONG_L    STRING  COMMENT '업종대분류코드',
    UPJONG_L_NM STRING  COMMENT '업종대분류코드명',
    UPJONG_M    STRING  COMMENT '업종중분류코드',
    UPJONG_M_NM STRING  COMMENT '업종중분류코드명'
)
COMMENT '업종코드 초기적재 임시 Table'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE LOCATION '/mini00/INIT_UPJONG_CODE'
TBLPROPERTIES ("skip.header.line.count"="1");

-- 카드 사용이력
DROP TABLE IF EXISTS UPJONG_CODE;
CREATE EXTERNAL TABLE IF NOT EXISTS UPJONG_CODE (
    UPJONG_L    STRING  COMMENT '업종대분류코드',
    UPJONG_L_NM STRING  COMMENT '업종대분류코드명',
    UPJONG_M    STRING  COMMENT '업종중분류코드',
    UPJONG_M_NM STRING  COMMENT '업종중분류코드명'
)
COMMENT '업종코드 Table'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE LOCATION '/mini00/UPJONG_CODE' ;


-- 카드 사용이력 (초기적재)
DROP TABLE IF EXISTS INIT_CARD_HIST;
CREATE EXTERNAL TABLE IF NOT EXISTS INIT_CARD_HIST (
    M_DONG_CD       STRING  COMMENT '행정동 코드',
    BAS_MGT_SN      STRING  COMMENT '국가기초구역',
    SF_UPJONG       STRING  COMMENT '업종코드',
    SF_UPJONG_NM    STRING  COMMENT '업종코드명',
    TS_YM           STRING  COMMENT '이용년월',
    DAW_CCD         STRING  COMMENT '요일코드',
    TM              STRING  COMMENT '시간대',
    COUNTRY_ENG_NM  STRING  COMMENT '국가명',
    TAMT            FLOAT  COMMENT '이용금액',
    USECNT          FLOAT  COMMENT '이용건수'
)
COMMENT '카드 사용이력 초기적재 임시 Table'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE LOCATION '/mini00/INIT_CARD_HIST'
TBLPROPERTIES ("skip.header.line.count"="1");

DROP TABLE IF EXISTS CARD_HIST;
CREATE EXTERNAL TABLE IF NOT EXISTS CARD_HIST (
    M_DONG_CD       STRING  COMMENT '행정동 코드',
    BAS_MGT_SN      STRING  COMMENT '국가기초구역',
    SF_UPJONG       STRING  COMMENT '업종코드',
    SF_UPJONG_NM    STRING  COMMENT '업종코드명',
    TAMT            FLOAT  COMMENT '이용금액',
    USECNT          FLOAT  COMMENT '이용건수'
)
PARTITIONED BY (COUNTRY STRING, YM STRING, CCD STRING, TM STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE LOCATION '/mini00/CARD_HIST';
