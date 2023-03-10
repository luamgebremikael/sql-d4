--1. List all customers who live in Texas (use

--JOINs)

select *

from customer c3

join address a

on c3.address_id = a.address_id

where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full

--Name

SELECT DISTINCT CONCAT(first_name, last_name) AS full_name

FROM customer

WHERE customer_id IN (

SELECT customer_id

FROM payment

WHERE amount > 6.99

GROUP BY customer_id

);

--3. Show all customers names who have made payments over $175(use

--subqueries)

SELECT *

FROM customer

WHERE customer_id IN (

SELECT customer_id

FROM payment

GROUP BY customer_id

HAVING SUM(amount) > 175

);

--4. List all customers that live in Nepal (use the city

--table)

select first_name, last_name

from customer c5

join address a2

on c5.address_id = a2.address_id

join city c

on a2.city_id = c.city_id

join country c2

on c.country_id = c2.country_id

where country = 'Nepal';

--5. Which staff member had the most

--transactions?

SELECT SUM(amount), first_name

FROM payment p

JOIN staff s

ON p.staff_id = s.staff_id

GROUP BY first_name

ORDER BY sum(amount) DESC

LIMIT 1;

--6. How many movies of each rating are

--there?

SELECT rating, COUNT(rating) AS "number"

FROM film

GROUP BY rating

ORDER BY number DESC;

--7.Show all customers who have made a single payment

--above $6.99 (Use Subqueries)

SELECT DISTINCT first_name, last_name

FROM customer

WHERE customer_id IN (

SELECT customer_id

FROM payment

WHERE amount > 6.99

GROUP BY customer_id

);

--8 how many free rental did our store give away?

SELECT count(amount)

FROM payment

WHERE amount = 0;