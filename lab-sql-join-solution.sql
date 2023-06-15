use sakila;

-- List the number of films per category.

select c.name as category_name, c.category_id, count(distinct(f.film_id))
from sakila.category c
join sakila.film_category fc
on c.category_id = fc.category_id
join sakila.film f
on f.film_id = fc.film_id
group by c.category_id;

-- Display the first and the last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from staff s
join address a
on s.address_id = a.address_id;

-- Display the total amount rung up by each staff member in August 2005.

select s.first_name, s.last_name, sum(p.amount) as total_amount
from sakila.payment p
right join sakila.staff s
on s.staff_id = p.staff_id
where month(p.payment_date) = 8 and year(p.payment_date) = 2005
group by s.staff_id;

-- List all films and the number of actors who are listed for each film.

select f.title, count(distinct(fa.actor_id))
from sakila.film f
left join sakila.film_actor fa 
using (film_id)
group by f.title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

select c.last_name, c.first_name, sum(p.amount) as total_paid
from sakila.customer c
left join sakila.payment p
using (customer_id)
group by c.customer_id
order by c.last_name asc;
