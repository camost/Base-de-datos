-- esto no
SELECT f1.last_name, f2.last_name
FROM actor f1, actor f2
WHERE f1.last_name = f2.last_name
AND f1.actor_id <> f2.actor_id;
-- esto no


-- ej:1
SELECT first_name, last_name
FROM actor a
WHERE last_name IN (SELECT last_name
					FROM actor b
				   WHERE b.last_name=a.last_name
				     AND b.actor_id<>a.actor_id)
ORDER BY last_name;



-- ej2:

SELECT first_name, last_name
FROM actor 
WHERE actor_id NOT IN (SELECT actor_id FROM film_actor);


-- ej:3

SELECT c1.first_name,c1.last_name
FROM rental r1, customer c1
WHERE NOT EXISTS (SELECT *
				  FROM rental r2
				  WHERE r1.customer_id= r2.customer_id
				  AND r1.rental_id <> r2.rental_id)
				  AND r1.customer_id= c1.customer_id;	
				  
SELECT first_name,last_name
FROM customer c1
WHERE c1.customer_id IN (SELECT c2.customer_id
				  FROM rental r1, customer c2
				  WHERE c2.customer_id= r1.customer_id
				  AND c1.customer_id <> c2.customer_id);
-- ej:4

SELECT DISTINCT c1.first_name,c1.last_name
FROM rental r1, customer c1
WHERE EXISTS (SELECT *
				  FROM rental r2
				  WHERE r1.customer_id= r2.customer_id
				  AND r1.rental_id <> r2.rental_id)
				  AND r1.customer_id= c1.customer_id;
	  
-- ej:5

SELECT DISTINCT first_name,last_name
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title IN ('BETRAYED REAR', 'CATCH AMISTAD');

-- ej:6 

SELECT DISTINCT first_name,last_name
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title IN ('BETRAYED REAR')
AND title NOT IN ('CATCH AMISTAD');


-- ej:7

SELECT DISTINCT first_name,last_name
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title IN ('BETRAYED REAR')
AND title IN ('CATCH AMISTAD')

SELECT title, COUNT(*)
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
GROUP BY title

SELECT title, COUNT(*) AS "Cantida de actores"
FROM actor
INNER JOIN film_actor USING(actor_id)
INNER JOIN film USING(film_id)
GROUP BY title

SELECT first_name, last_name,title
FROM film
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
WHERE title IN ('BETRAYED REAR','CATCH AMISTAD');
-- ej:8
SELECT DISTINCT first_name,last_name,title
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title NOT IN ('BETRAYED REAR', 'CATCH AMISTAD');