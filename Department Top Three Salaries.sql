# Write your MySQL query statement below
WITH CTE AS (
  SELECT 
  d.name Department,
  e.name Employee,
  e.salary Salary,
  dense_rank() OVER(PARTITION BY d.id ORDER BY Salary DESC) rnk
  FROM Employee e
  INNER JOIN 
  Department d
  ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM CTE
WHERE rnk < 4;
  
