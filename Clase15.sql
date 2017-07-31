-- Ejercicio 1
DROP VIEW IF EXISTS list_of_customers

CREATE VIEW list_of_customers AS
SELECT customer_id, CONCAT_WS(' ', first_name, last_name) AS name, address, postal_code, phone, city, country, CASE 
																										WHEN active = 1 THEN 'active'
																										ELSE 'inactive' END AS status, store_id
FROM customer
JOIN address USING (address_id)
JOIN store USING (store_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY customer_id

SELECT *
FROM list_of_customers

-- Ejercicio 2
DROP VIEW IF EXISTS film_details

CREATE VIEW film_details AS
SELECT film_id, title, description, name, amount, `length`, rating, GROUP_CONCAT( CONCAT(last_name, ' ', first_name) separator ', ') AS actor
FROM film
JOIN film_category USING (film_id)
JOIN category USING (category_id)
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY film_id

SELECT *
FROM film_details

-- Ejercicio 3
DROP VIEW IF EXISTS sales_by_film_category2

CREATE VIEW sales_by_film_category2 AS
SELECT name, SUM(amount) AS total_rental
FROM category
JOIN film_category USING (category_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY name

SELECT *
FROM sales_by_film_category2


-- Ejercicio 4 
DROP VIEW IF EXISTS actor_information

CREATE VIEW actor_information AS
SELECT actor_id, CONCAT_WS(' ', first_name, last_name) AS actor, COUNT(film.film_id) AS total_films
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
GROUP BY actor_id

SELECT *
FROM actor_information


-- Ejercicio 5
