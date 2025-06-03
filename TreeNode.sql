SELECT id, 'Root' as type from tree where p_id is null
UNION
Select id, 'Leaf' as type from tree where id NOT IN (Select Distinct p_id from tree where p_id is not null) And p_id is not null
UNION
Select id, 'Inner' as type from tree where id IN (Select Distinct p_id from tree where p_id is not null) And p_id is not null
Order by id