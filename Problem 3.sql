-- Tree Node	
SELECT id,(
    CASE
        WHEN p_id is Null THEN 'Root'
        WHEN id not in (SELECT p_id from Tree where p_id is not null) THEN 'Leaf'
        ELSE 'Inner'
    END
) AS Type from Tree

-- or Another method to slove using IF function
SELECT id, IF(p_id is null,"Root", IF(id in (Select p_id from Tree),"Inner","Leaf")) AS type from Tree