--Did this code successfully run on Leetcode : Yes
--Any problem you faced while coding this : No

WITH CTE AS
(select d.name as Department, e.name as Employee, e.salary as Salary, dense_rank() over (partition by d.name order by e.salary desc) as rnk
from employee e
INNER JOIN department d
on e.departmentId = d.id)

select Department, Employee, Salary
from CTE
where rnk <= 3;


