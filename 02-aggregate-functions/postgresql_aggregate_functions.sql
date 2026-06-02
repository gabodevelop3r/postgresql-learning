select * from users;

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


select count(*) as total_users,
        min(followers) as min_followers,
        max(followers) as max_followers,
        round(avg(followers),0) as avg_followers,
        sum(followers) / count(*) as avg_manual
from users;

select first_name,
       last_name,
       followers
    from users
    where followers = (
        select min(followers)
            from users
        )
group by first_name,
         last_name,
         followers;

select count(*),
       followers
    from users
    where followers = 4 or followers = 4999
group by followers ;


