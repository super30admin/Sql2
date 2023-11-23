# Write your MySQL query statement below
#select count(*) as total from seat; 
/*select (
    CASE 
     when mod(id,2) != 0 and id != total then id+1
     when mod(id,2) !=0 and id = total then id
     else id-1 
    end) as id, student from seat, (select count(*) as total from seat) 
    as seat_count order by id;  */

select s1.id, coalesce(s2.student, s1.student) as student from seat s1 left join seat s2 on ((s1.id+1) ^ 1- 1)= s2.id;   





