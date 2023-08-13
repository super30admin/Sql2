-- We first create a CTE where make an inner join on Employee and Department table using departmentID and use DENSE_RANK function to calculate the ranks of each employee
-- By creating a partion by department name and ordering by salary
-- Then we simply filter out the columns we want by rank <= 3


WITH CTE AS (
    SELECT e.id, e.name AS Employee, e.salary AS Salary, d.name AS Department, DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS emp_rank
    FROM Employee e INNER JOIN Department d
    ON e.departmentId = d.id
    
)


SELECT Department, Employee, Salary FROM CTE
WHERE emp_rank <= 3;