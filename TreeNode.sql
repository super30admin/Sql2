SELECT id , IF(
    ISNULL(p_id) , 'Root' , IF(id IN (SELECT DISTINCT p_id from tree) , 'Inner' , 'Leaf')
        
) AS 'type' from tree;