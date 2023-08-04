/*
1. The problem requires the ranks to be same for same scores and not skip any rank between. So dense_rank solves this purpose. 
2. The other method would be to create rank by counting the number of scores less than the current score without using dense rank function
-- Solved on Leetcode: Yes
-- Problems faced: None
*/

-- Method 1
select score, dense_rank() over (order by score desc) as "rank"
from Scores s

-- Method 2
select score, (SELECT count(*)
    FROM (SELECT distinct Score s
        FROM Scores) tmp
    WHERE s >= Score) as "rank"
from Scores s
order by score desc