-- ej: 7



SELECT f1.title, f2.title, f1.rating
FROM film f1, film f2
WHERE f1.rating = f2.rating
AND f1.film_id<f2.film_id
ORDER BY 1;

-- ej: 8

SELECT title
WHERE store.store_id = 2
AND film.film_id=inventory.film_id
AND inventory.last_update=store.last_update
AND city.country_id=country.country_id;