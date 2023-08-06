-- Problem 2 : Exchange Seats
SELECT(
    CASE
        WHEN MOD(id,2)!=0 AND id!=totals THEN id+1
        WHEN MOD(id,2)!=0 AND id=totals THEN id
        ELSE id-1
    END
) AS id, Student from Seat, (SELECT Count(*) AS totals from Seat) AS Seat_count order by id;