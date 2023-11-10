# Write your MySQL query statement below

#APPROACH 1
SELECT id,
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS 'type'
FROM Tree;

#APPROACH 2
SELECT id, IF(p_id IS NULL, 'Root', IF(id IN (SELECT p_id FROM Tree),'Inner','Leaf')) AS 'type'
FROM Tree;

#APPROACH 3
SELECT id, IF(p_id IS NULL, 'Root', IF(id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL),'Leaf','Inner')) AS 'type'
FROM Tree;