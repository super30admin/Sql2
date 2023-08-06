--Problem 1 : Rank Scores
--Using Rank Function
SELECT score, Dense_rak() over(order by score DESC) AS 'rank' from Scores;

-- Using Coorelated Subquery
Select s1.score,(select count(distinct s2.score) from Scores s2 where s2.score>=s1.score) AS 'rank'
    from Scores S1 ORDER BY S1.Score DESC;