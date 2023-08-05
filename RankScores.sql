--Did this code successfully run on Leetcode : Yes
--Any problem you faced while coding this : No

-- Using Dense rank
select score, dense_rank () over (order by score desc) as 'rank'
from scores
order by score desc;

-- Using instance from the same table
select s1.score, (select count(distinct s2.score) from scores s2 where s2.score >= s1.score)
as 'rank'
from scores s1
order by s1.score desc;