EXPLAIN SELECT *
FROM film
JOIN `language`
ON film.language_id = `language`.language_id

EXPLAIN SELECT *
FROM `language`, film
WHERE film.language_id = `language`.language_id


SELECT *
FROM film
JOIN `language`
USING (language_id)

SELECT *
FROM film
JOIN film_category
	ON film.film_id = film_category.film_id 
JOIN category
	ON film_category.category_id = category.category_id 
WHERE film.title LIKE 'A%'	
	
SELECT *
FROM film a, film_category b, category c
WHERE a.film_id = b.film_id
AND b.category_id = c.category_id

SELECT *
FROM film
JOIN film_category
	USING (film_id)
JOIN category
	USING (category_id)
	
#No funca porque hay dos que coinciden	
SELECT *
FROM film
NATURAL JOIN `language` 
	
SELECT *
FROM film
JOIN `language`
USING (language_id)


#Natural los comunes de tablas
SELECT *
FROM actor a1
NATURAL JOIN actor a2


INSERT INTO inventory
(film_id, store_id)
VALUES (1, 1)

SELECT title, rental.*
FROM film
JOIN inventory USING (film_id)
LEFT JOIN rental USING (inventory_id)
WHERE store_id = 1
AND film_id = 1;
