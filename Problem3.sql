# Write your MySQL query statement below

SELECT id, (
    CASE
    WHEN p_id is NULL THEN 'Root'
    When id NOT IN (SELECT DISTINCT p_id FROM tree WHERE p_id IS NOT NULL) AND p_id is NOT NULL THEN 'Leaf'
    ELSE 'Inner'
    END
) AS 'type' FROM tree;