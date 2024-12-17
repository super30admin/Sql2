WITH CTE AS(
    SELECT e.id, e.name, e.salary, e.departmentid, DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS 'rnk' FROM Employee e
 )

Select d.name AS 'Department', c.name AS 'Employee', c.salary AS 'Salary' FROM 
CTE c LEFT JOIN Department d ON c.departmentId = d.id 
WHERE c.rnk <= 3;