create table users ( name varchar (10) unique );

insert into users (name) values ('allan'),('brito'), ('allan2'), ('brito2');

update users
set name = 'juan'
where name = 'brito';

select * from users;
select * from users limit 1 offset 2;

select * from users where name like '%_llan%';

delete from users where name like '%_llan%';
delete from users;

drop table users;

truncate table users;

select id,
       UPPER(name) as upper_name,
       LOWER(name) as lower_name,
       LENGTH(name),
       (length(name) * 2) as constante,
      '* '|| id || ' - ' || name as barcode,
       CONCAT('* ',id ,' - ', name) as id_name,
       name
from users;


select
    name,
    substring(name , 0,position(' ' in name)) as sub_name,
    trim(substring(name,position(' ' in name)))as sub_last_name,
    split_part(name, ' ', 1) as first_name,
    split_part(name, ' ', 2) as last_name
from users;


update users
set
    first_name = ( split_part(name, ' ', 1)),
last_name = ( split_part(name, ' ', 2)) where id  > 0;

select * from users;











