-- Minimo 
SELECT MIN(amount)
FROM customer c, payment p
WHERE c.customer_id = p.customer_id 
AND   c.first_name LIKE 'R%'

SELECT COUNT(*)
FROM inventory
WHERE store_id = 1

SELECT COUNT(DISTINCT film_id)
FROM inventory
WHERE store_id = 1

SELECT AVG(length)
FROM film, inventory
WHERE film.film_id = inventory.film_id
AND inventory.store_id = 1

-- Promedio duracion peliculas que no estan en store_id 1
SELECT AVG(length)
FROM film
WHERE film_id IN (SELECT film_id
					FROM inventory
					WHERE store_id=1)
					

SELECT str1.av
FROM (SELECT AVG(length) av
		FROM film
		WHERE film_id IN (SELECT film_id
							FROM inventory
							WHERE store_id=1)) AS str1
							
-- Promedio duracion peliculas que no estan en store_id 1							
SELECT other_store.av
FROM (SELECT AVG(length) av
		FROM film
		WHERE film_id NOT IN (SELECT film_id
							FROM inventory
							WHERE store_id=1)) AS other_store

SELECT str1.av-other_store.av
FROM (SELECT AVG(length) av
		FROM film
		WHERE film_id IN (SELECT film_id
							FROM inventory
							WHERE store_id=1)) AS str1,						
(SELECT AVG(length) av
		FROM film
		WHERE film_id NOT IN (SELECT film_id
							FROM inventory
							WHERE store_id=1)) AS other_store;
							
SELECT DISTINCT
(SELECT AVG(LENGTH) av
	FROM film
	WHERE film_id IN (SELECT film_id
						FROM inventory
						WHERE store_id=1))	
-						
(SELECT AVG(LENGTH) av
	FROM film
	WHERE film_id NOT IN (SELECT film_id
						FROM inventory
						WHERE store_id=1))
FROM film;							


SELECT rating, AVG(LENGTH)
FROM film
GROUP BY rating


SELECT rating, special_features, AVG(LENGTH)
FROM film
GROUP BY rating, special_features


SELECT rating, special_features, MIN(`length`), MAX(`length`)
FROM film
GROUP BY rating, special_features
							

