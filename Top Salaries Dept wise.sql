-- Write your MySQL query statement below
select d.name as 'Department', x.name Employee, x.Salary Salary
from (select *, dense_rank () over (partition by DepartmentID order by salary desc) rnk_salary from Employee) x
inner join 
Department d on x.DepartmentID = d.ID
where x.rnk_salary in (1,2,3)
order by 1 asc,3 desc
