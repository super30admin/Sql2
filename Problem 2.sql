select (
    case
        when mod(id, 2) != 0 and id != cnt then id + 1
        when mod(id, 2) != 0 and id = cnt then id
        else id - 1
    end
) AS 'id', student from Seat, (select count(*) as cnt from Seat) AS seat_cnt
order by id;