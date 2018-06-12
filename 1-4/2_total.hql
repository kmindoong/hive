use hive_edu;

select t.year, t.month, t.cancel_reason, t.cnt, row_number() over (partition by t.month order by t.cnt asc)
from (
select year, 
      month, 
      case cancellationcode when 'A' then 'carrier'
                            when 'B' then 'weather'
                            when 'C' then 'NAS'
                            when 'D'then 'security'
                            else 'not defined'
      end as cancel_reason
, count(1) as cnt
from airport
where  cancelled='1'
group by year, month, cancellationcode
) t
distribute by t.month
sort by cast(t.year as INT), cast(t.month as INT), t.cnt


