select distinct T1.id,
case when T1.p_id is null then "Root"
     when T1.id = T2.p_id then "Inner"
else "Leaf"
end as type
from Tree T1
left join Tree T2
on T1.id = T2.p_id;
