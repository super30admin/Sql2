# Write your MySQL query statement below
 /* My Approach
WITH CTE_TABLE AS (
    SELECT score, ROW_NUMBER() OVER(ORDER BY score DESC) as RNK  FROM Score
)

SELECT s1.score, c1.Rnk 
FROM Score s1
Join CTE_TABLE c1 ON s1.score = c1.score; */



SELECT score, DENSE_RANK() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores