select(
    case 
        when mod(id,2) !=0  and id != cnt then id + 1
        when mod(id,2) !=0 and id = cnt then id
        else id-1
        end
) as 'id' , student from seat, (select count(*) as cnt from seat) as seat_counts order by id;
