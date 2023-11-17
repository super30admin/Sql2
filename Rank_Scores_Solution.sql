#Write your MySQL query statement below
SELECT score, dense_rank() over(order by score DESC) AS 'rank' from Scores
order by score DESC;
