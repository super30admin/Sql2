# Write your MySQL query statement below
# -------------------------- Using Window Function DENSE_RANK()--------------
-- SELECT 
--     Score,
--     DENSE_RANK() OVER (ORDER BY Score DESC) AS 'rank'
-- FROM 
--     Scores;

# ------------------------- Handling Null with Null as rank 1 -----------------
SELECT 
    Score,
    DENSE_RANK() OVER (ORDER BY COALESCE(Score, 1) DESC) AS 'RANK'
FROM 
    Scores;

# ------------------------- Using subquery-------------------------------
-- SELECT 
--     Score,
--     (SELECT COUNT(DISTINCT Score)
--     FROM scores s2
--     WHERE s2.score >= s1.score
--     ) AS 'rank'
-- FROM
--     Scores s1
-- ORDER BY
--     score DESC;
