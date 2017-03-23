SELECT f1.title, f2.title, f1.length
FROM film f1, film f2
WHERE f1.length= f2.length
AND f1.film_id<f2.film_id
ORDER BY 1;

-- las pelis para los nenes ej:1
SELECT title, special_features, rating 
FROM film
WHERE rating LIKE 'PG-13'

-- saco la duracion de las peliculas ej 2
SELECT DISTINCT length AS Duración:
FROM film ;

-- cosas entre 20 y 24 en replacement_cost  ej:3

SELECT title,rental_rate,replacement_cost
FROM film
WHERE replacement_cost 
BETWEEN '20.00' AND '24.00';

--   ej:4

SELECT title,rating, special_features,name
FROM film,category,film_category
WHERE category.category_id=film_category.category_id
AND film.film_id=film_category.film_id
AND special_features LIKE '%Behind the Scenes%';

-- ejer:5

SELECT first_name,last_name,title
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title LIKE '%ZOOLANDER FICTION%';

-- ejer: 6
SELECT address,city,country,store_id
FROM store,address,city,country
WHERE store.store_id = 1
AND store.address_id=address.address_id
AND address.city_id=city.city_id
AND city.country_id=country.country_id;

