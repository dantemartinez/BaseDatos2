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

SELECT *
FROM list_of_customers
