--This script uses de database from postgresqtutorial page 
-- <<https://www.postgresqltutorial.com/wp-content/uploads/2018/03/printable-postgresql-sample-database-diagram.pdf>>
--The queries made here are based on the silberschatz book 5 edition cap 3 and 4


--select * from category;
--insert into category values (17,'Travel','2006-02-15 09:46:27');
--select  category.name from category;
--select all * from category;
--select distinct category.name from category;
--select amount * 100 as amountX100, amount from payment;
--select category.last_update from category where category.last_update = '2006-02-15 09:46:27';
--select category.last_update from category where category.last_update not between '2006-02-15 09:46:27' and '2006-02-15 09:46:27';
--select category.last_update from category where category.last_update not between '2006-02-15 09:46:27' and '2006-02-15 09:46:27';
--select rental.return_date as fecha_retorno, customer.first_name as nombre_cliente from rental, customer where rental.rental_id = customer.customer_id
--and customer.activebool=true;

--select s, te from category as te, category as s;
--select T.last_name from customer as T where T.last_name like '_%_'
--select T.last_name from customer as T where T.last_name like '_%_' escape '%'
--select T.last_name from customer as T where T.last_name like '_\_' escape '\'
--select customer_id from customer
--union all 
--select customer_id from rental;

--select customer_id from customer
--intersect all
--select customer_id from rental;

--select customer_id from  customer
--except
--select customer_id from rental;	

--select customer_id, amount from payment where customer_id = 2
--select max(amount) from payment where customer_id = 2;
--select avg(amount) from payment where customer_id = (select customer_id from customer where first_name like '__')--
--select customer_id, avg(amount) from payment group by customer_id;
--select avg (amount) from payment;
--select count (*) from rental;
--select count(distinct customer_id) from rental;
--select customer_id, count(*) from rental group by (customer_id) order by customer_id;
--select customer_id, count(*) from rental group by (customer_id) having count(*)>=30 order by customer_id;
--select actor.first_name from actor where last_update is not null
--select customer.customer_id from customer where exists(select * from rental where rental.customer_id = customer.customer_id and)
--select customer.first_name, rental.rental_id from customer, rental where not unique(
--	select customer.customer_id from customer where rental.customer_id = customer.customer_id) 

-- with cliente_renta as (
-- 	select rental.customer_id as rental_customer_id, customer.customer_id as customer_customer_id, rental.inventory_id as inventory_id
-- 	from rental, customer
-- 	where customer.customer_id = rental.customer_id),
-- cliente_ciudad as (
-- 	select address.city_id, cliente_renta.customer_customer_id, cliente_renta.inventory_id
-- 	from cliente_renta, address
-- 	where cliente_renta.rental_customer_id = address.city_id
-- )
-- select city.city_id, city.city, count(cliente_ciudad.inventory_id)
-- from cliente_ciudad, city
-- where cliente_ciudad.city_id = city.city_id 
-- group by city.city_id

drop view lang_peliculas;
create view lang_peliculas as(
	with lan as(
		select film.title as titulo, l.name as nam
		from film,language as l
		where film.language_id = l.language_id)
	select lan.titulo, lan.nam, category.name
	from lan, film_category, category
	where film_category.category_id = category.category_id
	order by (lan.titulo)
)