# Write your MySQL query statement below
with cte as (
    SELECT d.name as Department, e.name as Employee, e.salary as Salary, DENSE_RANK() OVER (PARTITION BY d.id ORDER BY e.salary DESC) as 'rnk'
FROM Department d join Employee e ON (d.id = E.departmentId)
)

SELECT Department, Employee, Salary
FROM cte
WHERE rnk <= 3;