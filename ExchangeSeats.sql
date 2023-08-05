--Did this code successfully run on Leetcode : Yes
--Any problem you faced while coding this : No


-- Using Case statement
#select
    (CASE
        WHEN MOD(id,2) != 0 AND id != total THEN id + 1
        WHEN MOD(id,2) != 0 AND id = total THEN id
        ELSE id - 1
    END) as id, student
from seat, (select count(*) as total from seat) as seat_total
order by id;

-- Using Left Join

select s1.id, coalesce(s2.student,s1.student) as student
from seat s1 left join seat s2
on (s1.id+1)^1 - 1 = s2.id
order by s1.id;

-- Using Right Join

select coalesce(s1.id, s2.id) as id, s2.student
from seat s1 right join seat s2
on (s1.id+1)^1 -1 = s2.id
order by id;