# Write your MySQL query statement below
#Select score,DENSE_RANK() OVER (order by score DESC) as 'rank' from Scores 
#select s1.score,(select count(DISTINCT s2.score) from scores s2 where s2.score >= s1.score) AS 'rank'
#from scores s1 order by s1.score DESC
##
select s.score, count(DISTINCT T.score) AS 'rank' FROM SCORES s INNER JOIN SCORES T ON 
s.score <= T.score group by s.score,s.id order by s.score DESC