-- mariaDB
create database mini00;
GRANT ALL PRIVILEGES ON . TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

use mini00;

CREATE TABLE STS_BY_COUNTRY (
COUNTRY VARCHAR(500),
UPJONG_L VARCHAR(100),
L_TAMT FLOAT
);
