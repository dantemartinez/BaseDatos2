#Ejercicio 1
SELECT country, (SELECT COUNT(city) 
							FROM city 
							WHERE country.country_id = city.country_id) AS total							
FROM country
ORDER BY country.country_id


#Ejercicio 2
SELECT country, COUNT(*) total
FROM country
JOIN city
USING (country_id)
GROUP BY country
HAVING total > 10
ORDER BY total


#Ejercicio 3
SELECT c.first_name, c.last_name, address, COUNT(rental.rental_id) AS peliculas, SUM(amount) AS total
FROM customer c
JOIN address
	USING (address_id)
JOIN rental
	USING (customer_id)
JOIN payment
	USING (rental_id)
GROUP BY 1, 2, 3
ORDER BY total DESC

#Ejercicio 4
SELECT DISTINCT title
FROM film
LEFT OUTER JOIN inventory
	USING (film_id)

