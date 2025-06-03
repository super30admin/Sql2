WITH CTE as(
    SELECT d.name as 'department',d.id as'did', e.name as 'employee', e.salary as 'salary' from employee e left join department d ON e.departmentId = d.id
)
SELECT department, employee, salary from CTE c
where 3> (Select count(DISTINCT e2.salary)from employee e2 where c.did = e2.departmentId and e2.salary>c.salary)