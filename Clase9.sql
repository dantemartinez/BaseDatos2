SELECT rating, title
  FROM film
ORDER BY rating

SELECT rating, COUNT(*)
  FROM film
 GROUP BY rating
 
 SELECT rating, special_features, `length`
  FROM film
 ORDER BY rating, special_features
 
 SELECT rating, special_features, MIN(`length`), MAX(`length`)
  FROM film
 GROUP BY rating, special_features
 
 SELECT mx - mn AS diff
FROM (SELECT rating, special_features, MIN(`length`) AS mn, MAX(`length`) AS mx
        FROM film
        GROUP BY rating, special_features) t1
        
        
-- HAVING hace magia // es un where del group
        
SELECT c.customer_id, first_name, last_name, COUNT(*)
FROM rental r1, customer c
WHERE c.customer_id = r1.customer_id
GROUP BY c.customer_id, first_name, last_name
HAVING COUNT(*) = 1
 
SELECT rating, MIN(`length`)
FROM film
GROUP BY rating
HAVING MIN(`length`) > 46
 
SELECT rating, COUNT(*)
FROM film
GROUP BY rating
HAVING COUNT(*) < 195

SELECT DISTINCT rating
FROM film f1
WHERE (SELECT COUNT(*)
FROM film f2 WHERE f1.rating = f2.rating) < 195

SELECT rating, AVG(`length`)
FROM film
GROUP BY rating
HAVING AVG(`length`) > (SELECT AVG(`length`) FROM film)

SELECT DISTINCT f1.rating, (SELECT COUNT(*) 
							FROM film f3
							WHERE f3.rating = f1.rating) AS total
FROM film f1
WHERE (SELECT COUNT(*)
		FROM film f2
		WHERE f2.rating = f1.rating) < 195


