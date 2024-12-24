# Write your MySQL query statement below
/*
SELECT d.name AS 'Department',e1.name as 'Employee', e1.salary 
FROM Employee e1
LEFT JOIN Department d 
ON e1.departmentId = d.id
WHERE 3 > (SELECT COUNT(DISTINCT e2.salary) FROM Employee e2 WHERE e2.salary > e1.salary AND e1.departmentId = e2.departmentId ) 
*/



WITH CTE AS 
(SELECT e1.name , e1.departmentId,e1.salary, DENSE_RANK() OVER(PARTITION BY e1.departmentId ORDER BY e1.salary DESC) as 'rank' FROM Employee e1 )
SELECT  d.name AS Department , C.name as 'Employee', C.salary AS 'salary' FROM CTE C
JOIN Department d ON C.departmentID = d.id
WHERE C.rank < 4;
