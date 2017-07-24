-- ej: 7



SELECT f1.title, f2.title, f1.rating
FROM film f1, film f2
WHERE f1.rating = f2.rating
AND f1.film_id<f2.film_id
ORDER BY 1;

-- ej: 8

SELECT DISTINCT a.title, d.first_name, d.last_name
FROM film a, inventory i, store st, staff d
WHERE i.store_id = 2 
AND a.film_id = i.film_id
AND d.store_id = 2; 



SELECT first_name,last_name
  FROM customer
 WHERE customer_id IN (SELECT customer_id
                         FROM payment
                        WHERE amount BETWEEN 3 AND 4); 



-- esto es un except y dataion si saco el not hace como un intersec

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
							FROM payment
							WHERE amount = 0.99)
AND customer_id NOT IN (SELECT customer_id
							FROM payment
							WHERE amount = 1.99)
AND first_name LIKE ('W%');



SELECT first_name,last_name, SUM(amount) as gastado
FROM customer, payment
WHERE customer.customer_id=payment.customer_id
GROUP BY first_name,last_name
ORDER BY gastado DESC

SELECT first_name, MAX(amount)
FROM payment p, customer c
WHERE c.customer_id=p.customer_id
GROUP BY first_name
ORDER BY 2 DESC


SELECT amount, COUNT(*)
FROM payment
GROUP BY amount;
-- buscar gente de mismo nombre

SELECT first_name,last_name
FROM customer c1
WHERE EXISTS (SELECT*
				FROM customer c2
				WHERE c1.first_name=c2.first_name
				AND c1.customer_id<>c2.customer_id)
ORDER BY first_name;

-- mostrame todas la peliculas la cual no tenga otra mayor
SELECT title,length 
FROM film f1
WHERE NOT EXISTS (SELECT *
					FROM film f2
					WHERE f2.length > f1.length);
					
					

					
SELECT title,length 
FROM film f1
WHERE NOT EXISTS (SELECT *
					FROM film f2
					WHERE f2.length < f1.length);
					
					
					
					
					
					

--  lo mismo que al anterior 
SELECT title,length
FROM film
WHERE length >= ALL (SELECT length
						FROM film);
					
-- cambio lo que esta guardado de una row, el maximo del maximo 
						
UPDATE film SET length = 200 WHERE film_id = 182;


SELECT title,length 
FROM film f1
WHERE length > ALL (SELECT length 
					FROM film f2
					WHERE f2.film_id<>f1.film_id);