-- 
select s.first_name as manager_first_name, s.last_name as manager_last_name, a.address, a.district, ci.city, co.country 
from staff s
join address a
on s.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country co
on ci.country_id = co.country_id;


-- 
select i.store_id, i.inventory_id, f.title, f.rating, f.rental_rate, f.replacement_cost 
from inventory i
left join film f
on i.film_id = f.film_id;


-- 
select i.store_id, f.rating, count(i.inventory_id) as inventory_items
from inventory i
join film f
on i.film_id = f.film_id
group by i.store_id, f.rating
order by store_id;


-- 
select i.store_id, c.name, count(f.film_id) as number_of_films, avg(f.replacement_cost) as average_cost, 
       sum(f.replacement_cost) as total_cost
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
join inventory i
on fc.film_id = i.film_id
group by i.store_id, c.name
order by 5 desc;


-- 
select c.first_name, c.last_name, c.store_id, c.active, a.address, ci.city, co.country
from customer c
join address a
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country co
on ci.country_id = co.country_id;


-- 
select c.first_name, c.last_name, sum(r.rental_id) as total_rentals, sum(p.amount) as total_payments
from customer c
join payment p 
on c.customer_id = p.customer_id
join rental r
on p.rental_id = r.rental_id
group by 1, 2
order by 1 desc;


-- 
select 'advisor', first_name, last_name, 'N/a' as company_names from advisor
union
select 'investor', first_name, last_name, company_name from investor;


-- 
select case when aa.awards = 'Emmy, Oscar, Tony ' then '3 awards'
			when aa.awards in ('Emmy, Oscar', 'Emmy, Tony', 'Oscar, Tony') then '2 awards'
            else '1 award'
	   end as number_of_awards,
       round(avg(case when aa.actor_id is null then 0 else 1 end), 2) as percentage_with_one_award
from actor_award aa
group by 1;