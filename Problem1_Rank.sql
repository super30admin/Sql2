# Approach 1:
select score, dense_rank() over (order by score Desc) as 'rank' from Scores;

# Approach 2:
select s.score, count(distinct t.score) as 'rank' from scores s inner join scores t on t.score>=s.score group by s.id,s.score order by s.score desc;