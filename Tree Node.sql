
SELECT id, (
CASE  
    WHEN p_id IS NULL THEN 'Root'
    WHEN id NOT IN ( select p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
    ELSE 'Inner'
END    
) AS type from Tree;

-- diff solution

-- SELECT id, 
-- IF (p_id IS NULL, 'Root',
--      IF(id NOT IN (select DISTINCT p_id FROM Tree where p_id IS NOT NULL), 'Leaf', 'Inner')
--  ) AS type
-- FROM Tree;