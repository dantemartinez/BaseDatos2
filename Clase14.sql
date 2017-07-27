-- Ejercicio 1
SELECT CONCAT_WS(' ', first_name, last_name) AS name, address, city
FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
WHERE country.country = 'Argentina'

-- Ejercicio 2
SELECT title, name, rating, CASE
								WHEN rating = 'G' THEN 'All Ages Are Admitted.'
								WHEN rating = 'PG' THEN 'Some Material May Not Be Suitable For Children.'
								WHEN rating = 'PG-13' THEN 'Some Material May Be Inappropriate For Children Under 13.'
								WHEN rating = 'R' THEN 'Under 17 Requires Accompanying Parent Or Adult Guardian.'
								WHEN rating = 'NC-17' THEN 'No One 17 and Under Admitted.' END AS rating_description
FROM film
JOIN `language` USING (language_id)

-- Ejercicio 3
SELECT title, release_year
FROM film 
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
WHERE first_name = LTRIM('')
AND last_name = LTRIM('')

-- Ejercicio 4
SELECT title, first_name, last_name, CASE
										WHEN return_date IS NULL THEN 'NO'
										WHEN return_date IS NOT NULL THEN 'YES' END AS returned
FROM film
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN customer USING (customer_id)
WHERE MONTHNAME (rental_date) = 'May'
OR MONTHNAME (rental_date) = 'June'

-- Ejercicio 5

-- Cast and Convert are used to convert one data type to another.  
-- Cast and Convert are pretty similar between them, with some differences in the syntax. 

 SELECT CAST(last_update AS DATE)
 FROM film
 
 SELECT CONVERT(last_update, DATE)
 FROM staff

 -- Ejercicio 6	
 
SELECT rental_id, return_date
FROM rental
WHERE return_date IS NULL
 
 -- IFNULL and NVL are the same
 -- NVL is used in oracle
 -- IFNULL function takes two arguments and returns the first one if it's not NULL or the second if the first one is NULL
 
SELECT rental_id, IFNULL(return_date, 'movie is not returned') AS era
FROM rental
WHERE rental_id = 209
OR rental_id = 11496

-- ISNULL function take one argument and return 1 if it is NULL, or 0 if it isn't. 

SELECT ISNULL(return_date) 
FROM rental
WHERE rental_id = 209
OR rental_id = 11496

-- COALESCE function can take two or more parameters and returns the first non-NULL parameter.

SELECT COALESCE(NULL, (SELECT return_date
						FROM rental
						WHERE rental_id = 11496), -- rental_id = 11496 is null
					  (SELECT return_date
						FROM rental
						WHERE rental_id = 200), -- returns this value, is not null
					  (SELECT return_date
						FROM rental
						WHERE rental_id = 201)) AS date -- this value is not null, but is not the first

 