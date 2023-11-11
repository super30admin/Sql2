#leetcode 185. Department Top Three Salaries
#Solution:

select dept as Department, emp as Employee, Salary from (
select d.name as dept ,e.name as emp ,e.salary,
dense_rank() over(partition by d.id order by e.salary desc) as rn
from employee e 
join department d
on e.departmentId = d.id) a 
where rn <=3


#Leetcode 608. Tree Node
#Solution:

select id,
case when p_id is null then 'Root'
when id not in (select distinct p_id from tree where p_id is not null) then 'Leaf'
else 'Inner' end as type
from tree