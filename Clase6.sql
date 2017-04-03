-- Ejercicio 1

SELECT last_name, first_name
FROM actor f1
WHERE last_name IN (SELECT last_name
						FROM actor f2
						WHERE f1.last_name = f2.last_name AND f1.actor_id <> f2.actor_id) 
ORDER BY last_name

-- Ejercicio 2

SELECT first_name, last_name
FROM actor f1
WHERE actor_id NOT IN (SELECT DISTINCT actor_id
						FROM film_actor)
/*						
-- Ejercicio 3

SELECT first_name
FROM customer c1
WHERE NOT EXISTS (SELECT c2.customer_id
						FROM rental r1, customer c2
						WHERE c1.customer_id = r1.customer_id
						AND c1.customer_id <> c2.customer_id)
ORDER BY first_name

-- Ejercicio 4						
SELECT first_name, last_name
FROM customer c1
WHERE EXISTS (SELECT c2.customer_id
						FROM rental r1, customer c2
						WHERE c1.customer_id = r1.customer_id
						AND c1.customer_id <> c2.customer_id)
ORDER BY first_name

*/
-- Ejercicio 5

SELECT DISTINCT actor_id
FROM actor f1
WHERE actor_id IN (SELECT f3.actor_id
					FROM film f2, film_actor f3
					WHERE f3.film_id = f2.film_id AND title LIKE '%BETRAYED REAR%' AND f1.actor_id = f3.actor_id)
    OR actor_id IN (SELECT f3.actor_id
	    				  FROM film f2, film_actor f3
		    			  WHERE f3.film_id = f2.film_id AND title LIKE '%CATCH AMISTAD%' AND f1.actor_id = f3.actor_id)

-- Ejercicio 6

SELECT DISTINCT actor_id
FROM actor f1
WHERE actor_id IN (SELECT f3.actor_id
					FROM film f2, film_actor f3
					WHERE f3.film_id = f2.film_id AND title LIKE '%BETRAYED REAR%' AND f1.actor_id = f3.actor_id)
    AND actor_id NOT IN (SELECT f3.actor_id
	    				  FROM film f2, film_actor f3
		    			  WHERE f3.film_id = f2.film_id AND title LIKE '%CATCH AMISTAD%' AND f1.actor_id = f3.actor_id)

-- Ejercicio 7

SELECT DISTINCT actor_id
FROM actor f1
WHERE actor_id IN (SELECT f3.actor_id
					FROM film f2, film_actor f3
					WHERE f3.film_id = f2.film_id AND title LIKE '%BETRAYED REAR%' AND f1.actor_id = f3.actor_id)
    AND actor_id IN (SELECT f3.actor_id
	    				  FROM film f2, film_actor f3
		    			  WHERE f3.film_id = f2.film_id AND title LIKE '%CATCH AMISTAD%' AND f1.actor_id = f3.actor_id)

-- Ejercicio 8
					
SELECT DISTINCT actor_id
FROM actor f1
WHERE actor_id NOT IN (SELECT f3.actor_id
					FROM film f2, film_actor f3
					WHERE f3.film_id = f2.film_id AND title LIKE '%BETRAYED REAR%' AND f1.actor_id = f3.actor_id)
    AND actor_id NOT IN (SELECT f3.actor_id
	    				  FROM film f2, film_actor f3
		    			  WHERE f3.film_id = f2.film_id AND title LIKE '%CATCH AMISTAD%' AND f1.actor_id = f3.actor_id)
		    			  ORDER BY 1
						