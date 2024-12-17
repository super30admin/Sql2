

    SELECT score, DENSE_RANK() OVER (order by score desc) AS 'rank'
    FROM Scores ;

-- without window function 1)


-- SELECT s1.score, (select count(DISTINCT s2.score) from Scores s2

--         where s2.score >= s1.score) AS 'rank'

--  FROM Scores s1 order by s1.score desc;


--2)

-- SELECT s1.score, COUNT( DISTINCT s2.score) AS 'rank' FROM
--      Scores  s1 INNER JOIN Scores s2 ON s1.score<=s2.score
-- GROUP BY s1.id ORDER BY s1.score DESC;        
