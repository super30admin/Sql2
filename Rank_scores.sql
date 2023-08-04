-- Using Window Functions
select
score, 
DENSE_RANK() OVER (order by score desc) as 'rank'
from Scores



--Using Co-related subqueries
select s1.score,(select  count(distinct s2.score) from scores s2
where s2.score>=s1.score) as 'rank' from scores s1 
order by s1.score desc
