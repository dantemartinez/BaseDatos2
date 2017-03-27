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
SELECT DISTINCT title, rating, name, special_features
FROM film, category
WHERE film.special_features LIKE '%Behind The Scenes%'

-- Ejercicio 5
SELECT DISTINCT first_name, last_name, title
FROM actor, film
WHERE film.title LIKE '%ZOOLANDER FICTION%'

-- Ejercicio 6
SELECT DISTINCT address, country, city, store_id
FROM address, store, city, country
WHERE store_id LIKE 1 

-- Ejercicio 7 
SELECT DISTINCT f1.title, f1.rating, f2.title, f2.rating
FROM film f1, film f2
WHERE f1.rating = f2.rating AND f1.film_id < f2.film_id

-- Ejercicio 8 no tengo la consigna...


