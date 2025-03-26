Select id, 'Root' as Type from Tree where p_id is null
Union
Select id, 'Leaf' as Type from Tree where id not in (select distinct p_id from Tree where p_id is not null)and p_id is not null
Union
Select id, 'Inner' as Type from Tree where id in (select distinct p_id from Tree where p_id is not null) and p_id is not null;