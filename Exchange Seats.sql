# Write your MySQL query statement below

/*
select s.id, 
case 
when (s.id%2!=0) 
then if((select student from seat where id = s.id+1) is null, student, ( select  student from Seat where id = s.id + 1 ))
when (s.id % 2 = 0) 
then ( select student from Seat where id = s.id - 1 ) 
end as student
from Seat s
order by s.id */
################################################33

SELECT (
    case
        when mod(id,2) != 0 and id = (select max(id) from seat) then id
        when mod(id,2) != 0 and id != (select max(id) from seat) then id + 1
        else id - 1
    end
) as id, student
from seat 
order by id
