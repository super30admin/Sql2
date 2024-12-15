-- Write your MySQL query statement below
-- select id,'Root' AS type from tree where p_id is null
-- UNION
-- select id,'Leaf' AS type from tree where id NOT IN(select DISTINCT p_id from tree where p_id IS NOT NULL) AND p_id is NOT NULL
-- UNION
-- select id, 'Inner' AS type from tree where id IN(select DISTINCT p_id from tree where p_id IS NOT NULL) AND p_id is NOT NULL

select atree.id , IF(ISNULL(atree.p_id), 'Root' , IF(atree.id IN(SELECT DISTINCT p_id FROM tree Where p_id IS NOT NULL), 'Inner','Leaf')) AS 'type' from tree atree