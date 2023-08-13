-- We use CASE WHEN - if p_id is null then root , we use a subquery to get the distinct p_ids and if id is present in that list
-- then the node is inner else it is leaf

SELECT id, CASE
            WHEN p_id IS NULL THEN "Root"
            WHEN id IN (SELECT DISTINCT p_id FROM Tree) THEN "Inner"
            ELSE "Leaf"
            END as type
FROM Tree;