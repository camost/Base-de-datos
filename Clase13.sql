-- Clase 12: Normal Forms TBD

-- 1. Add a new customer
-- To store 1
-- For address use an existing address. The one that has the biggest address_id in 'United States'


INSERT INTO customer a
(customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES(0, 1, 'jose', 'perez', 'joseperez@gmail.com', 605, 1, '', CURRENT_TIMESTAMP)
WHERE a.address_id > a2.addres_id;


INSERT INTO customer
(address_id, first_name, last_name)

SELECT store_id, first_name, last_name, email,address_id, active, create_date, last_update
FROM customer
WHERE
AND store_id=1;


SELECT MAX(a.address_id)
FROM address a
WHERE (SELECT c.country_id
		FROM country c, city c1
		WHERE country="United States"
		AND c1.city_id=a.city_id)
		AND c.country_id =c1.country_id)
ORDER BY address_id

		
		

SELECT store_id, first_name, last_name,address_id,country
FROM customer c1,country cou
WHERE EXISTS (SELECT *
	   FROM customer c2
	   WHERE c2.address_id > c1.address_id)
AND store_id =1
AND cou.country="United States"
ORDER BY address_id DESC
LIMIT 1;

SELECT MAX(adre.address_id)
FROM address adre
WHERE (SELECT cou.country_id FROM country cou, city ci
WHERE cou.country = "United States"
AND cou.country_id = ci.country_id
AND ci.city_id = adre.city_id);


INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, last_update)
VALUES(1, 'Juan', 'Savarin', 'JuanSavarin33@gmail.com', 600, 1, CURRENT_TIMESTAMP);


SELECT address_id,first_name,last_name
FROM customer 
WHERE last_name="Savarin";

-- 2. Add a rental
-- Make easy to select any film title. I.e. I sould be able to put 'film tile' in the where, and not the id.
-- Do not check if the film is already rented, just use any from the inventory, e.g. the one with higest id.
-- Select any staff_id from Store 2. 


INSERT INTO sakila.rental
(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(0, '', 0, 0, '', 0, CURRENT_TIMESTAMP);







-- 3. Update film year based on the rating
-- For example if rating is 'G' release date will be '2001'
-- You can choose the mapping between rating and year.
-- Write as many statements are needed.


UPDATE sakila.film
SET title='', description='', release_year='2001', language_id=0, original_language_id=0, rental_duration=3, rental_rate=4.99,
`length`=0, replacement_cost=19.99, rating='G', special_features='', last_update=CURRENT_TIMESTAMP
WHERE film_id=0;


SELECT COUNT(rating),rating
FROM film
GROUP BY rating;

UPDATE film
SET release_year = "2001"
WHERE rating="G";

UPDATE film
SET release_year = "2002"
WHERE rating="PG";

UPDATE film
SET release_year = "2003"
WHERE rating="PG-13";

UPDATE film
SET release_year = "2004"
WHERE rating="R";

UPDATE film
SET release_year = "2005"
WHERE rating="NC-17";



-- 4 Return a film
-- Write the necessary statements and queries for the following steps.
-- Find a film that was not yet returned. And use that rental id.
-- Use the id to return the film.
-- Use the id to add the payment. Other ids/amounts should be calculated with subqueries.

SELECT title,film_id,rental_id,rental_rate
FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
WHERE rental.return_date IS NULL
-- elegi deep crusade
AND rental_id=15813;


UPDATE sakila.rental
SET return_date=CURRENT_TIMESTAMP
WHERE rental_id=15813






-- 5. Try to delete a film
-- Check what happens, describe what to do.
-- Write all the necessary delete statements to entirely remove the film from the DB.

DELETE FROM sakila.film
WHERE film_id=0;




