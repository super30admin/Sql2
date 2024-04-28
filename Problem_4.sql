-- Write your MySQL query statement below
SELECT Department, Employee, Salary
FROM (
    SELECT 
        D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY d.name ORDER BY Salary DESC) AS rnk
    FROM Employee E
    LEFT JOIN Department D
    ON E.departmentId = D.id
) AS random
WHERE rnk <= 3;