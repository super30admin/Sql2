SELECT 
    CASE 
        WHEN MOD(id, 2) != 0 AND id != cnt THEN id + 1
        WHEN MOD(id, 2) = 0 THEN id - 1
        ELSE id
    END AS id, 
    student 
FROM seat, (SELECT COUNT(*) AS cnt FROM seat) AS seat_counts 
ORDER BY id;

-- Solution 2:
-- select s1.id, coalesce(s2.student, s1.student) as 'student' from seat s1
-- left join seat s2 on (s1.id + 1) ^ 1 -1 = s2.id order by s1.id
