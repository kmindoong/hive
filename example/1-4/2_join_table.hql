
set hive.cli.print.header=true;
user hive_edu;

SELECT M.BUSINESS_TYPE, SUM(C.AMOUNT) AS TOTAL_AMOUNT 
FROM CARD_HISTORY C JOIN MERCHANT M ON (C.MERCHANT_ID = M.MERCHANT_ID) 
GROUP BY M.BUSINESS_TYPE;
