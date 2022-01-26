--How many films has a rating R and a replacement cost between 5$ and 15$?
select count(*) from film
where rating = 'R' AND
replacement_cost between '5' and '15';

--How many films have the word Truman somewhere in the title ?
select count(*) from film
where title like '%Truman%';

--Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2
select customer_id,sum(amount) from payment
where staff_id = '2'
group by customer_id 
having sum(amount) > '110';

--What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT first_name,last_name From customer
where first_name like 'E%' AND 
address_id < 500
order by customer_id desc
limit '1';

select * from customer
full outer join payment
on customer.customer_id = payment.customer_id
where customer.customer_id > '341'
and payment.payment_id > '17503';

--California sales tax law has changed and we need to alert our customer through email.
--what are emails of the customer who lives in california?

select email,district from customer 
inner join address
on customer.address_id = address.address_id
where district = 'California';

--A customer walks in and is a hughe fan of actor 'Nick Wahlberg' and wants to know in which movie he is in.
--get a list of all the movies 'Nick Wahlberg' has been in .

select title,first_name,last_name from film_actor
inner join actor
on film_actor.actor_id = actor.actor_id
inner join film 