WITH CTE AS(

    SELECT d.name AS 'Department', e.name AS 'Employee', e.salary AS 'Salary', DENSE_RANK() OVER(PARTITION BY e.departmentID ORDER BY e.salary DESC) as 'rnk' FROM Employee e LEFT JOIN Department d ON e.departmentID = d.id
) 
SELECT Department, Employee, Salary FROM CTE WHERE rnk <= 3