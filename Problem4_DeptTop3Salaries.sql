# Write your MySQL query statement below
select A.department,A.employee,A.salary
from
(select d.name as department,
e.name as employee,
e.salary,
dense_rank() over(partition by e.departmentId order by e.salary desc) as salaryrank
from department d
inner join employee e on d.id=e.departmentId) A
where salaryrank <=3
