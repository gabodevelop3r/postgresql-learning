select *
from users;

select first_name,
       last_name,
       last_connection
from users
where last_connection like '221.%';


select first_name,
       last_name,
       followers,
       following
from users
where followers > 4600;


select first_name,
       last_name,
       followers
from users
where
    -- followers > 4600 and followers < 4700
    followers between 4600 and 4700
order by followers desc;


select count(*)                  as total_users,
       min(followers)            as min_followers,
       max(followers)            as max_followers,
       round(avg(followers), 0)  as avg_followers,
       sum(followers) / count(*) as avg_manual
from users;

select first_name,
       last_name,
       followers
from users
where followers = (select min(followers)
                   from users)
group by first_name,
         last_name,
         followers;

select count(*),
       followers
from users
where followers = 4
   or followers = 4999
group by followers;

-- HAVING
select country,
       count(country) as total
from users
group by country
having count(country) between 1 and 5
order by count(country) asc
;

-- DISTINC
select distinct (trim(lower(country))) as country
from users
group by country
having count(country) > 0
order by country asc
;

select count(*)                  as total,
       split_part(email, '@', 2) as domain
from users
group by split_part(email, '@', 2)
having count(split_part(email, '@', 2)) > 1
;

-- SUBQUERYS
select sum(total)
from (select count(*)                  as total,
             split_part(email, '@', 2) as domain
      from users
      group by split_part(email, '@', 2)
      having count(split_part(email, '@', 2)) > 1) as domains;