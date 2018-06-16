use hive_edu;

select t2.year, t2.month, t2.arrtime, t1.name
from airline t1 JOIN airport t2 on (t1.airlineid=t2.flightnum)
where cancelled=1
limit 10;
