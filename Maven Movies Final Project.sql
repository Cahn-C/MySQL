-- My partner and I want to come by each of the stores in person and meet the managers. Please send over the managers' names at each store, with the full address of each property
-- (street address, district, city, and country please.
select s.first_name as manager_first_name, s.last_name as manager_last_name, a.address, a.district, ci.city, co.country 
from staff s
join address a
on s.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country co
on ci.country_id = co.country_id;


-- I would like to get a better understanding of all of the inventory that would come along with the business. Please pull together a list of each inventory item you have stocked, including the store_id
-- number, the inventory_id, the name of the film, the film's rating, its rental rate and replacement cost.
select i.store_id, i.inventory_id, f.title, f.rating, f.rental_rate, f.replacement_cost 
from inventory i
left join film f
on i.film_id = f.film_id;


-- From the same list of films you just pulled, please roll that data up and provide a summary level overview of your inventory. We would like to know how many inventory items you have witht each rating at each store.
select i.store_id, f.rating, count(i.inventory_id) as inventory_items
from inventory i
join film f
on i.film_id = f.film_id
group by i.store_id, f.rating
order by store_id;


-- Similarly, we want to understand how diversified the inventory is in terms of replacemnet cost. We want to see how big of a hit it would be if a certain category of film became unpopular at a certain store.
-- We would like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.
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


-- We want to make sure you folks have a good handle on who your customers are spending with you, and also to know who your most valuable customers are. Please provide a list of all customer names, which store 
-- they go to, whether or not they are currently active, and their full addresses - street address, city, and country.
select c.first_name, c.last_name, c.store_id, c.active, a.address, ci.city, co.country
from customer c
join address a
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country co
on ci.country_id = co.country_id;


-- We would like to understand how much your customers are spending with you, and also to know who your most valuable customers are. Please pull together a list of customer names, their total lifetime rentals, and 
-- the sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.
select c.first_name, c.last_name, sum(r.rental_id) as total_rentals, sum(p.amount) as total_payments
from customer c
join payment p 
on c.customer_id = p.customer_id
join rental r
on p.rental_id = r.rental_id
group by 1, 2
order by 1 desc;


-- My partner and I would like to get to know your board of advisors and any current investors. Could you please provide a list of advisor and investor names in one table? Could you please not whether they are
-- an investor or an advisor, and for the investors, it would be good to include which compnay they work with.
select 'advisor', first_name, last_name, 'N/a' as company_names from advisor
union
select 'investor', first_name, last_name, company_name from investor;


-- We're interested in how well you have covered the most-awarded actors. Of all the actors with three types of awards, for what % of them do we carry a film? And how about for actors with two types of awards? 
-- Same questions. Finally, how about actors with just one award?
select case when aa.awards = 'Emmy, Oscar, Tony ' then '3 awards'
			when aa.awards in ('Emmy, Oscar', 'Emmy, Tony', 'Oscar, Tony') then '2 awards'
            else '1 award'
	   end as number_of_awards,
       round(avg(case when aa.actor_id is null then 0 else 1 end), 2) as percentage_with_one_award
from actor_award aa
group by 1;
