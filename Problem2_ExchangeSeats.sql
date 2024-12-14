# Approach 1
Select case
when id%2=0 then id-1
when id%2=1 and id=(select max(id) from seat) then id
else id+1
end as 'id', student from Seat
order by id ;

# Approach 2
select (case
when mod(id,2)!=0 and cnt=id then id
when mod(id,2)!=0 and cnt!=id then id+1
else id-1
end)
as id,student
from seat,(select count(* )as cnt from seat) as count_order order by id;