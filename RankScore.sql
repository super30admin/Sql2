# Write your MySQL query statement below
SELECT s1.score , (SELECT COUNT(DISTINCT s2.score) from scores s2 where s2.score >= s1.score) AS 'rank' 
    FROM SCORES s1 ORDER BY s1.score DESC;