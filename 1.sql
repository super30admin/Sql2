# Write your MySQL query statement below
WITH CTE AS (
    SELECT score,
        DENSE_RANK() OVER (ORDER BY score DESC) AS rnk
    FROM Scores
)
SELECT score, rnk AS 'rank'
FROM CTE