SELECT (
    CASE
        WHEN MOD(ID,2)!=0 AND ID!= CT  THEN ID+1
        WHEN MOD(ID,2)!=0 AND ID=CT THEN ID
        ELSE ID-1
    END 
    ) as 'id', student from seat ,(select count(*) as ct from seat ) as seat_counts order by id
