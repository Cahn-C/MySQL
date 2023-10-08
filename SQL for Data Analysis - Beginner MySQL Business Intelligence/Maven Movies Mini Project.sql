-- 
select first_name, last_name, email, store_id
from staff;


-- 
select store_id, count(*) as inventory_items
from inventory
group by store_id;

-- 
select store_id, count(case when active = 1 then customer_id else null end) as active_customers
from customer
group by store_id;

-- Or
select store_id, count(*) as active_customers 
from customer
where active = 1
group by store_id;


-- 
select count(email) as email_addresses 
from customer;


-- 
select store_id, count(distinct film_id) as unique_films 
from inventory
group by store_id;

select count(distinct category_id) as unique_categories 
from category;


-- 
select min(replacement_cost) as least_expensive,
       max(replacement_cost) as most_expensive,
       round(avg(replacement_cost), 2) as average_cost
from film;


-- 
select round(avg(amount), 2) as average_payment_processed, max(amount) as max_payment_processed
from payment;


-- 
select customer_id, count(rental_id) as number_of_rentals
from rental
group by customer_id
order by 2 desc;
