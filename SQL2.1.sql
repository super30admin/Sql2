# Write your MySQL query statement below

#APPROACH 1
SELECT score, dense_rank() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores;

#APPROACH 2
SELECT s.score, (
  SELECT COUNT(DISTINCT t.score) FROM Scores t
  WHERE t.score >= s.score
) AS 'rank'
FROM Scores s
ORDER BY s.score DESC;

#APPROACH 3
SELECT s.score, COUNT(DISTINCT t.score) AS 'rank'
FROM Scores s INNER JOIN Scores t ON t.score >= s.score
GROUP BY s.id, s.score
ORDER BY s.score DESC;