/*
1. Self join the Seat table on a condition to check if there exists a seat when one seat is swapped else null is obtained
2. Use bitwise operator to swap a value i, i+1 using the function (i+1)^1 - 1. If the join resulted in s2.id being null => no seat to swap, keep s1.id 
-- Solved on Leetcode: Yes
-- Problems faced: None
*/

--Method 1 Using XOR
select coalesce(s2.id,s1.id) 'id', s1.student
from Seat s1
    left join Seat s2
    on (s1.id +1) ^1 - 1 = s2.id
order by id

--Method 2 Using Case Statements
select (
    case 
        when mod(id,2)!=0 and id != total then id+1
        when mod(id,2)!=0 and id=total then id 
        else id-1
    end ) as id, student
from Seat, ( select count(*) as total
    from Seat) as seat_count
order by id;