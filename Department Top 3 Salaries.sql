with cte as ( select *, dense_rank() over (partition by departmentId order by salary desc ) as 'rnk' from employee) 

select c.name as employee, d.name as department, c.salary 
from cte c left join department d on c.departmentId = d.id
 where c.rnk<=3
