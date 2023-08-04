-- using case statement with sub-query
select
id,
    CASE
        when p_id IS NULL THEN 'Root'
        when id not in (select p_id from Tree where p_id is NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END as type
from Tree
