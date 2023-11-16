# # Write your MySQL query statement below
WITH CTE AS (SELECT *, dense_rank() OVER(PARTITION BY departmentID ORDER BY Salary DESC) AS rnk from Employee ORDER BY id)

SELECT d.name as Department, CTE.name as Employee, CTE.Salary AS Salary from department d JOIN CTE ON d.id = CTE.departmentID 
where CTE.rnk <= 3;
