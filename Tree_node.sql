/*select id, 'Root' as type from tree where p_id is null
union
select id, 'Leaf' as type from tree 
where id not in (select distinct p_id from tree where p_id is not null) and p_id is not null
union
select id, 'Inner' as type from tree where id in
(select distinct p_id from tree where p_id is not null) and p_id is not null;*/

/*select id, ( 
  case 
    when t.p_id is null then 'Root' 
    when t.id in (select distinct p_id from tree where p_id is not null) then 'Inner'
    else 'Leaf'
End) as type from tree as t; */    

select t.id, IF(t.p_id is null, 'Root', if( t.id in (select distinct p_id from tree where p_id is not null), 'Inner', 'Leaf')) as type from tree t;