# Write your MySQL query statement below
SELECT (
    CASE
        WHEN mod(id ,2) = 0 THEN id - 1
        WHEN id = cnts then id
        ELSE id + 1
    END
) AS id, student FROM Seat, (SELECT count(*) as 'cnts' FROM Seat) AS random ORDER BY id ASC;