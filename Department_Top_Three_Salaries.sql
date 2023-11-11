select D.name as Department, Employee, E.salary
From (
select name as Employee, salary,departmentId, dense_rank() over(PARTITION BY departmentId order by salary desc) as rk 
from Employee) E
join Department D
on E.departmentId = D.id
where rk <= 3
order by D.name, salary desc
