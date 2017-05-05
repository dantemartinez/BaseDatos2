#Ejercicio 1
SELECT country, (SELECT COUNT(city) 
							FROM city 
							WHERE country.country_id = city.country_id) AS total							
FROM country
ORDER BY country.country_id

# Or

SELECT country, COUNT(*) total
FROM country
JOIN city
USING (country_id)
GROUP BY country


#Ejercicio 2
SELECT country, COUNT(*) total
FROM country
JOIN city
USING (country_id)
GROUP BY country
HAVING total > 10
ORDER BY total


#Ejercicio 3
SELECT first_name, last_name, address, COUNT(rental.rental_id) AS peliculas, SUM(amount) AS total
FROM customer 
JOIN address
	USING (address_id)
JOIN rental
	USING (customer_id)
JOIN payment
	USING (rental_id)   
GROUP BY 1, 2, 3
ORDER BY total DESC

#Ejercicio 4

SELECT DISTINCT film_id, title
FROM film 
WHERE film_id NOT IN (SELECT film_id
                   FROM inventory
                   WHERE film.film_id = inventory.film_id);
	
