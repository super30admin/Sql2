


SELECT(
    CASE 
        WHEN MOD(ID,2) !=0 AND ID != COUNTER THEN ID+1
        WHEN MOD(ID,2) !=0 AND ID = COUNTER THEN ID
        ELSE ID -1
    END
) AS 'id', student FROM Seat , ( SELECT COUNT(*) as COUNTER FROM Seat) AS seat_count  ORDER BY id;