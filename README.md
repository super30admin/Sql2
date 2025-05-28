# Sql2

Problem 1 : Rank Scores		(https://leetcode.com/problems/rank-scores/ )
Solution:

Select score, DENSE_RANK()
OVER (ORDER BY score DESC) AS 'rank'
from Scores

Problem 2 : Exchange Seats	(https://leetcode.com/problems/exchange-seats/ )
Solution:

SELECT (
    CASE 
       WHEN MOD(id,2) != 0 AND id = cnts THEN id
       WHEN MOD(id,2) != 0 AND id != cnts THEN id+1
       ELSE id-1
    END
)AS 'id', student FROM seat, (SELECT COUNT(*) AS 'cnts' FROM Seat) AS seat_counts
ORDER BY id

Problem 3 : Tree Node		(https://leetcode.com/problems/tree-node/ )
Solution:

Select id, (
    CASE
        when p_id IS Null 
        then "Root"
        when id In (Select Distinct p_id from tree ) then "Inner"
        else "Leaf"
    end) AS type
from Tree
order by id ASC

Problem 4 : Deparment Top 3 Salaries		(https://leetcode.com/problems/department-top-three-salaries/ )
Solution:

SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
WHERE 3 > (
    SELECT COUNT(DISTINCT e2.salary)
    FROM Employee e2
    WHERE e2.departmentId = e.departmentId
      AND e2.salary > e.salary
)
ORDER BY d.name, e.salary DESC;