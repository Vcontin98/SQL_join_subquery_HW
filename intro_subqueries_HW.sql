SELECT *
FROM customer

SELECT *
FROM address

--1. List all customers who live in Texas (use JOINs)


SELECT customer_id, first_name, last_name, address.address_id, address, district
FROM address
INNER JOIN customer
ON customer.address_id = address.address_id
WHERE district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name.
SELECT *
FROM payment

SELECT customer.customer_id, first_name, last_name, amount
FROM payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

--4. List all customers that live in Nepal (use the city table)
SELECT *
FROM address

SELECT *
FROM city

SELECT *
FROM customer


SELECT country.country_id,country
FROM country
INNER JOIN city
ON city.country_id = country.country_id
WHERE country.country_id = 66

--5. Which staff member had the most transactions?
SELECT staff_id, COUNT(payment)
FROM payment
GROUP BY staff_id;

SELECT * 
FROM payment

--6. How many movies of each rating are there?
SELECT rating, COUNT(film)
FROM film 
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
);


--8.How many free rentals did our stores give away?

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount
LIMIT 1

















