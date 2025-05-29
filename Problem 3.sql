select id, (
    case
        when isnull(p_id) then 'Root'
        when id in (select distinct p_id from Tree) then 'Inner'
        else 'Leaf'
    end) as type from Tree