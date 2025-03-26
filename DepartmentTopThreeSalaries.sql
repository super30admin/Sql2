SELECT Department.Name AS Department, Employee.Name AS Employee, Employee.Salary AS Salary FROM
(SELECT DepartmentId, Name, Salary, DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS SalaryRank FROM Employee) AS Employee
JOIN Department ON Employee.DepartmentId = Department.Id
WHERE Employee.SalaryRank <= 3;                       
