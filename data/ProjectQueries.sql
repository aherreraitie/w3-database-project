
select title, (length/60) as duration 
order by length desc
limit 5;


select c.name, count(c.name) as Total_Movies
from actors as a
left join filmactor as fa on fa.actor_id= a.actor_id
left join category as c on c.category_id= fa.category_id
group by c.name
limit 5;

select full_names, count(full_names) as Movies
from actors as a
left join filmactor as fa on fa.actor_id=a.actor_id
group by full_names
order by Movies desc
limit 5;

select title, count(actor_id)  as actors
from filmactor as fa
left join film as f on f.film_id= fa.film_id
group by title
order by actors  desc
limit 5;