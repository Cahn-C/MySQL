-- We will need a list of all staff members, including their first and last names, email addresses, and the store identification number where they work.
select first_name, last_name, email, store_id
from staff;


-- We will need seperatre counts of inventory items held at each of your two stores.
select store_id, count(*) as inventory_items
from inventory
group by store_id;

-- We will beed a count of active customers for each of your stores, Separately, please
select store_id, count(case when active = 1 then customer_id else null end) as active_customers
from customer
group by store_id;

-- Or
select store_id, count(*) as active_customers 
from customer
where active = 1
group by store_id;


-- In order to assess the liability of a data breach, we will need you to provide a count of all customer email addresses stored in the database.
select count(email) as email_addresses 
from customer;


-- We are interested in how diverse your film offering is as means of understanding how likely you are to keep customers engaged in the future. Please provide a count of unique film titles you have in inventory at 
-- each store and then provide a count of unique categories of films you provide.
select store_id, count(distinct film_id) as unique_films 
from inventory
group by store_id;

select count(distinct category_id) as unique_categories 
from category;


-- We would like to understand the replacement cost of your films. Please provide the replacement cost for the film that is least expensive, the most expensive to replace, and the average of all films you carry.
select min(replacement_cost) as least_expensive,
       max(replacement_cost) as most_expensive,
       round(avg(replacement_cost), 2) as average_cost
from film;


-- We are interested in having you put payment monitoring systems and maximum payment processing restrictions in place in order to minimize the future risk of fraud by your staff. Please provide the average 
-- payment you process, as well as the maximum payment you have processed.
select round(avg(amount), 2) as average_payment_processed, max(amount) as max_payment_processed
from payment;


-- We would like to better understand what your customer base looks like. Please provide a list of all customer identification values, with a count o rentals they have made all-time, with your highest volume customers
-- at the top of the list.
select customer_id, count(rental_id) as number_of_rentals
from rental
group by customer_id
order by 2 desc;
