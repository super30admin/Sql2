select 
case when mod(id,2) != 0 and id <> total then id+1
     when mod(id,2) = 0 then id-1
     else id
end as id,
student 
from seat, (select count(distinct id) as total from seat) as a
order by id;
