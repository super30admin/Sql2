
-- Using Lead and lag with Cte
 with cte as (
 select id,student,lag(id) over (order by id) as prev_value,lead(id) over (order by id) as next_value from seat
 )
 select case when ((id%2=1) and next_value is NOT NULL) THEN next_value
 when (id%2=0) then prev_value 
 else id end as id,student
 from cte 
 order by id

-- Using case statement with sub-queries
 select (
    case 
        when mod(id,2)!=0 and id != total then id+1
        when mod(id,2)!=0 and id=total then id 
        else id-1
    end ) as id,student from Seat,( select count(*) as total from seat) as seat_count order by id; 

-- Using Bitwise operator with left join
select s1.id ,coalesce(s2.student,s1.student) as  student  from seat s1 
left join seat s2
on
(s1.id+1)^1-1=s2.id 
order by s1.id