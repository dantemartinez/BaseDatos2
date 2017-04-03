SELECT *
	from (SELECT titel, description, rental_rate, rental_rate * 15 AS in_pesos
	FROM film) t 
WHERE in_pesos > 10.0
AND in_pesos <70.0
ORDER BY 4;

SELECT customer_id,
	firs_name,
	last_name,
	(SELECT MAX(amount) max_amount
	FROM payment
	WHERE payment.customer_id = customer.customer_id) AS amount
FROM customer
ORDER BY amount DESC,
	customer_id DESC;