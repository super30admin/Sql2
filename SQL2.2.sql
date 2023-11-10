# Write your MySQL query statement below

#APPROACH 1
SELECT 
    IF(
        IF(id % 2 = 0, id - 1, id + 1) IN (SELECT id FROM Seat),
        IF(id % 2 = 0, id - 1, id + 1),
        id
    ) AS id,
    student
FROM Seat
ORDER BY id;

#APPROACH 2
SELECT CASE
           WHEN id % 2 <> 0 AND id = (SELECT COUNT(*) FROM Seat) THEN id
           WHEN id % 2 = 0 THEN id - 1
           ELSE
               id + 1
           END AS id,
       student
FROM Seat
ORDER BY id