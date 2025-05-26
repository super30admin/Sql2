# Write your MySQL query statement below
-- SELECT s1.score, (select COUNT(DISTINCT s2.score)
-- FROM scores s2 WHERE s2.score>=s1.score )AS 'rank'
-- FROM scores s1 ORDER BY s1.score DESC;

SELECT s.score, COUNT(DISTINCT T.score) AS 'rank'
FROM scores s JOIN scores T ON s.score<=T.score
GROUP BY s.id ORDER BY S.SCORE DESC;