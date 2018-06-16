
set hive.cli.print.header=true;
user hive_edu;

SELECT U.SEX, U.AGE, SUM(C.AMOUNT) AS TOTAL_AMOUNT 
FROM CARD_HISTORY C JOIN USERS U ON (C.CARD_OWNER = U.USER_ID) 
GROUP BY U.SEX, U.AGE;