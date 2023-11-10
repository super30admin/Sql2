# Write your MySQL query statement below

select score, dense_rank() over (order by Score desc) as 'rank' from Scores