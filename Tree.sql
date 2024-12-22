# Write your MySQL query statement below
SELECT id, (
    CASE
    WHEN p_id is null then  'Root'
    when id in (select p_id from tree) and id is not null then 'Inner'
    else 'Leaf'
END
) AS type from tree;