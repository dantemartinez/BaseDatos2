-- Ejemplo
SELECT f1.title, f2.title, f1.`length`, f1.film_id, f2.film_id
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id <> f2.film_id
ORDER BY 1

-- Ejercicio 1
SELECT title, special_features
FROM film
WHERE rating = 'PG-13'

-- Ejercicio 2
SELECT DISTINCT `length`
FROM film 
ORDER BY 1

-- Ejercicio 3
SELECT title, rental_rate, replacement_cost
FROM film
WHERE replacement_cost BETWEEN 20.00 AND 24.00

-- Ejercicio 4
SELECT DISTINCT a.title, a.rating, name, special_features
FROM film a, category c, film_category b
WHERE a.film_id = b.film_id
AND c.category_id = b.category_id
AND special_features LIKE '%Behind The Scenes%'

-- Ejercicio 5
SELECT DISTINCT a.first_name, a.last_name, title
FROM actor a, film c, film_actor b
WHERE a.actor_id = b.actor_id
AND c.film_id = b.film_id
AND title LIKE '%ZOOLANDER FICTION%'

-- Ejercicio 6 
SELECT DISTINCT address, country, city, store_id
FROM address a, store s, city c1, country c2
WHERE store_id LIKE 1 
AND s.address_id = a.address_id 
AND c1.country_id = c2.country_id
AND c1.city_id = a.city_id

-- Ejercicio 7 
SELECT DISTINCT f1.title, f1.rating, f2.title, f2.rating
FROM film f1, film f2
WHERE f1.rating = f2.rating AND f1.film_id < f2.film_id;

-- Ejercicio 8 
SELECT title, first_name, last_name
FROM store
JOIN film
JOIN staff
ON store.store_id = '2' AND staff.store_id = store.store_id



