SELECT id, (
    CASE 
        WHEN p_id IS null THEN 'Root'
        WHEN id IN (SELECT p_id from Tree) then 'Inner'
        ELSE 'Leaf'
    END
) as 'type' from Tree