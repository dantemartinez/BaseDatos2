
-- Ejercicio 1 
SELECT fat_content 
FROM (
  SELECT DISTINCT fat_content 
  FROM product_dimension 
  WHERE department_description 
  IN ('Dairy') ) AS food 
  ORDER BY fat_content
  LIMIT 5;
  
  SELECT DISTINCT fat_content
  FROM product_dimension
  WHERE department_description
  IN ('Dairy')
  LIMIT 5;

-- Ejercicio 2

explain SELECT order_number, date_ordered
SELECT order_number, date_ordered
FROM store.store_orders_fact orders
WHERE orders.store_key IN (
  SELECT store_key
  FROM store.store_dimension
  WHERE store_state = 'MA') 
AND orders.vendor_key NOT IN (
    SELECT vendor_key
    FROM public.vendor_dimension
    WHERE vendor_state = 'MA')
AND date_ordered < '2003-03-01';

-- Ejercicio 3

SELECT customer_name, annual_income
FROM public.customer_dimension
WHERE (customer_gender, annual_income) IN
      (SELECT customer_gender, MAX(annual_income)
       FROM public.customer_dimension
       GROUP BY customer_gender);
       
       
-- Ejercicio 4 

 SELECT DISTINCT s.product_key, p.product_description
FROM store.store_sales_fact s, public.product_dimension p
WHERE s.product_key = p.product_key
    AND s.product_version = p.product_version
    AND s.store_key IN
      (SELECT store_key
       FROM store.store_dimension
       WHERE store_state = 'MA')
ORDER BY s.product_key;


-- Ejercicio 5


SELECT f.order_number, f.date_ordered, v.vendor_key
FROM public.vendor_dimension v, store.store_orders_fact f
WHERE f.date_ordered = '2003-01-02'
AND f.vendor_key = v.vendor_key
ORDER BY 1;

SELECT f.order_number, f.date_ordered
FROM store.store_orders_fact f
WHERE EXISTS(SELECT 1
			 FROM public.vendor_dimension v
			 WHERE f.vendor_key = v.vendor_key)
AND f.date_ordered = '2003-01-02'


-- Ejercicio 6

SELECT MAX(v.deal_size), f.vendor_key
FROM public.vendor_dimension v, store.store_orders_fact f
WHERE f.date_ordered = '2004-01-04';

