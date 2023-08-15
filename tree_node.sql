# Write your MySQL query statement below
#For a node to be categorized as "Root," its p_id should be NULL.
# For a node to be categorized as "Leaf," it should have an id that does not appear as a p_id in any other node.
# If the above conditions are not met, the node is categorized as "Inner."



SELECT
    id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM
    Tree;
