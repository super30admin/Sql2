--Did this code successfully run on Leetcode : Yes
--Any problem you faced while coding this : No


-- Using case statement

select id, (
     CASE
         WHEN p_id is null THEN 'Root'
         WHEN id in (select p_id from Tree) is NULL THEN 'Leaf'
         ELSE 'Inner'
      END
) as type from Tree;

-- using if condition
select id, if(p_id is Null, 'Root', if(id in (select p_id from Tree), 'Inner', 'Leaf')) as type
from Tree;


-- using union statement
select id, 'Root' as Type from Tree where p_id is Null
union all
select id, 'Inner' as Type from Tree where id in (select p_id from Tree) and p_id is not null
union all
select id, 'Leaf' as Type from Tree where id not in (select p_id from Tree where p_id is not null) and p_id is not null;