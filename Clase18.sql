CALL GetAllProducts();

CALL GetOfficeByCountry('USA');

CALL CountOrderByStatus('Shipped',@total);
SELECT @total;

CALL CountOrderByStatus('in process',@total);
SELECT @total AS  total_in_process;


CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);
SELECT @shipped,@canceled,@resolved,@disputed;


SET @customerNo = 112;

SELECT country into @country
FROM customers
WHERE customernumber = @customerNo;

CALL GetCustomerShipping(@customerNo,@shipping);

SELECT @customerNo AS Customer,
       @country    AS Country,
       @shipping   AS Shipping;

CALL test_mysql_loop();

SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;

#################################################

-- Ejercicio 1


CREATE DEFINER=`root`@`localhost` FUNCTION `sakila`.`TotalFilms`(id INT , store INT) RETURNS int(11)
    DETERMINISTIC
BEGIN
	
	DECLARE total INT;
	
	SELECT COUNT(id) INTO total 
	FROM film
	JOIN inventory USING (film_id)
	JOIN store USING (store_id)
	WHERE store_id = store
	AND id = film_id
	GROUP BY film_id;	
	
	RETURN (total);
	
END

##################

SELECT TotalFilms(4, 1)


-- Ejercicio 2





