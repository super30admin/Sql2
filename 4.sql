WITH CTE AS(
    SELECT Employee.name, Employee.departmentId, salary, DENSE_RANK() 
OVER (PARTITION BY Employee.departmentId ORDER BY Employee.salary DESC) AS rnk
FROM Employee)


SELECT Department.name AS Department, CTE.name AS Employee, CTE.salary AS Salary
FROM CTE
JOIN Department ON Department.id = CTE.departmentId
WHERE rnk <= 3

