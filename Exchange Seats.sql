SELECT (
    CASE
        WHEN MOD(id, 2) != 0 AND id = cnts THEN id
        WHEN MOD(id, 2) != 0 THEN id + 1
        ELSE id - 1
    END
) AS 'id', student FROM Seat, (SELECT COUNT(id) as 'cnts' FROM Seat) AS Seat_Counts ORDER BY id;