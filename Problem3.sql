/*
1. If parent id is null then it is Root. 
2. If the id doesnt exist in the parent ids it means it is the leaf node as there are no children. Else it is inner
-- Solved on Leetcode: Yes
-- Problems faced: None
*/


select a.id,
    case 
    when isnull(a.p_id) then 'Root'
    when a.id not in (select distinct b.p_id
    from Tree b) is null then 'Leaf'
    else
    'Inner'
end 'type'
from
    Tree a