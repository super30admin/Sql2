# Write your MySQL query statement below
#-------------------Using ODD/EVEN ---------------
-- SELECT(
--     CASE 
--         WHEN mod(id, 2) != 0 AND id != cnt THEN id + 1
--         WHEN mod(id, 2) != 0 AND id = cnt THEN id
--         ELSE id - 1
--     END) AS id, student 
--     FROM 
--         Seat, (SELECT COUNT(*) AS cnt FROM Seat) as count_table
--     ORDER BY id 
#---------------- Using LEFT JOIN and XOR function------------------
SELECT 
    s1.id, COALESCE(s2.student, s1.student) AS 'student'
FROM
    Seat s1 
    LEFT JOIN
    Seat s2
    ON
    (s1.id + 1) ^ 1 - 1 = s2.id
ORDER BY
    s1.id