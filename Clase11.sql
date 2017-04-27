-- 1 ej 1 con group by

SELECT country,COUNT(*)
FROM city b,country a
WHERE b.country_id=a.country_id
GROUP BY country;

-- 2 todas las ciudades por country con mas de 10 cityes
SELECT country,COUNT(*)
FROM city b,country a
WHERE b.country_id=a.country_id
GROUP BY country
HAVING COUNT(*) >10 
ORDER BY 2 DESC;

-- 3 todos los clientes, su direcion, cuantas pelis alquilaron y cuanto gastaron 
SELECT first_name,last_name,address,COUNT(*),sum(amount) AS gastado
FROM rental r, customer c, address a, payment p
WHERE c.customer_id = r.customer_id
AND a.address_id=c.address_id
AND p.rental_id=r.rental_id 
GROUP BY first_name,last_name,address
ORDER BY gastado DESC;


SELECT c.first_name,c.last_name,a.address, COUNT(*), SUM(p.amount) AS total
FROM customer c
INNER JOIN address a USING(address_id)
INNER JOIN rental USING (customer_id)
INNER JOIN payment p USING(rental_id)
GROUP BY 1,2,3
ORDER BY 5 DESC;

-- 4 todas las pelis que no estan en el inventory
SELECT title
FROM film f
WHERE f.film_id NOT IN (SELECT film_id
						FROM inventory);
						
-- 5 todas las pelis que esten en el inventario pero no fueron rent
SELECT title
FROM film f
WHERE f.film_id IN (SELECT film_id
						FROM inventory)
AND rental_rate IS NULL;

