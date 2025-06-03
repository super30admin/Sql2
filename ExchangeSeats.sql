SELECT(
    CASE
    WHEN MOD(id,2) !=0 AND id = cnts THEN id
    WHEN MOD(id,2) !=0 AND id !=cnts THEN id+1
    ELSE id-1
    END
) as 'id', student from seat,
(SELECT COUNT(*) AS 'cnts' from seat) as seat_counts
ORDER BY id