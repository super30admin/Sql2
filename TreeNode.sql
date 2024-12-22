# Write your MySQL query statement below
SELECT
    id, 'Root' as Type
FROM
    Tree 
WHERE p_id IS NULL
UNION
SELECT
    id, 'Leaf' as Type
FROM
    Tree
WHERE id NOT IN (
    SELECT 
        DISTINCT p_id
    FROM
        Tree
    WHERE p_id IS NOT NULL
) AND
p_id IS NOT NULL
UNION
SELECT
    id, 'Inner' as Type
FROM
    Tree
WHERE id IN (
    SELECT
        DISTINCT p_id
    FROM
        Tree
    WHERE p_id IS NOT NULL
) AND
p_id IS NOT NULL;