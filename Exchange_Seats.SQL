SELECT (CASE 
WHEN mod(id,2) != 0 AND id != (SELECT count(id) from Seat)
THEN id+1
WHEN mod(id,2) = 0 AND id != (SELECT count(id) from Seat)
THEN id-1
WHEN mod(id,2) !=0 AND id = (SELECT count(id) from SEAT)
THEN id
WHEN mod(id,2) =0 AND id = (SELECT count(id) from SEAT)
THEN id-1
END
) as 'id', student from Seat
order by id;
