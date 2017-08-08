SELECT *
FROM customers

CREATE INDEX postalCode ON customers(postalCode)

DROP INDEX postalCode ON customers

SELECT *
FROM products


ALTER TABLE products
ADD FULLTEXT(productline)


SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');


-- Ejercicio 1

SELECT *
FROM address 
WHERE postal_code IN (SELECT *
						FROM address 
						JOIN city)
-- qsyo, no entendo

-- Ejercicio 2

SELECT *
FROM actor

SELECT *
FROM actor
WHERE first_name IN ('ED')

SELECT *
FROM actor
WHERE last_name IN ('DAVIS')

-- i think that the last_name should go faster for the index, but it doesn't show me the time to execution

-- Ejercicio 3

SELECT *
FROM film

SELECT *
FROM film
WHERE description LIKE '%Intrepi%'

ALTER TABLE film
ADD FULLTEXT(description)

SELECT *
FROM film
WHERE MATCH(description) AGAINST('Intrepi')

-- Like operator find the letters that you set it, but the match operator find the hole word so if you
-- don't complete the word that you are searching you won't get the results you expected