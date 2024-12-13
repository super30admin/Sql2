SELECT atree.id, IF(ISNULL (atree.p_id), 'Root' , IF(atree.id IN(SELECT p_id FROM tree WHERE
p_id IS NOT NULL), "Inner", 'Leaf')) AS 'type' from tree atree;