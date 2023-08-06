'''The outer query SELECT s1.score, ... FROM scores s1 retrieves each unique score from the scores table as s1.
The subquery (SELECT COUNT(DISTINCT s2.score) ...) calculates the rank for each s1.score. It counts the number of distinct scores from s2 (alias for scores table) where the score is greater than or equal to the current score s1.score.
The ORDER BY s1.score DESC sorts the results in descending order based on the score, displaying the highest score first.
'''
select s1.score,(
  select count(distinct s2.score) from scores s2 where s2.score >= s1.score) as 'rank'
from scores s1 order by s1.score desc;
