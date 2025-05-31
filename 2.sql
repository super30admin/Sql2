SELECT (
    CASE 
        WHEN id%2 != 0 AND id = cnt THEN id
        WHEN id%2 != 0 AND id != cnt THEN id+1
        ELSE id-1
    END
) AS 'id', student FROM Seat , (SELECT COUNT(*) AS 'cnt' FROM Seat) AS seat_counts ORDER BY id
