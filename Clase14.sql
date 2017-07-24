#1. Write a query that gets all the customers that live in Argentina. 
# Show the first and last name in one column,the address and the city.


#Prueba  de concat
SELECT CONCAT_WS(" ", first_name, last_name) AS "Nombre", address_id 
FROM customer;

# saco id de arg
SELECT country, country_id FROM country;

#hago la query
SELECT CONCAT_WS(" ", first_name, last_name) AS "Nombre", CONCAT_WS(", ", address, city) AS "Domicilio"
FROM customer 
INNER JOIN address USING(address_id)
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country_id="6";

#2. Write a query that shows the film title, language and rating.
# Rating shall be shown as the full text described here:

SELECT title, name AS "Idioma",
CASE rating
    WHEN "PG" THEN "PG (Parental Guidance Suggested) – Some Material May Not Be Suitable For Children."
    WHEN "G" THEN "G (General Audiences) – All Ages Are Admitted."
	WHEN "NC-17" THEN "NC-17 (Adults Only) – No One 17 and Under Admitted."
	WHEN "PG-13" THEN "PG-13 (Parents Strongly Cautioned) – Some Material May Be Inappropriate For Children Under 13."
	WHEN "R" THEN "R (Restricted) – Under 17 Requires Accompanying Parent Or Adult Guardian."
END AS "Rating"
FROM film
INNER JOIN `language` USING (language_id)
ORDER BY rating;

#3. Write a search query that shows all the films (title and release year) an actor was part of. 
# Assume the actor comes from a text box introduced by hand from a web page. 
# Make sure to "adjust" the input text to try to find the films as effectively as you think is possible.

SELECT title AS "Pelicula", `release_year` AS "Año de Esteno",CONCAT_WS(" ", first_name, last_name) AS Nombre
FROM film
INNER JOIN film_actor USING (film_id)
INNER JOIN actor USING (actor_id)
WHERE UPPER(CONCAT_WS(' ', first_name, last_name)) 
LIKE TRIM(UPPER("  %Bob Fawc%  "));




#4. Find all the rentals done in the months of May and June. 
#Show the film title, customer name and if it was returned or not. 
#There should be returned column with two possible values 'Yes' and 'No'.

SELECT title,CONCAT_WS(" ", first_name,last_name) AS Nombre,
    CASE WHEN rental.return_date IS NOT NULL THEN 'YES Baby'
    ELSE 'NO!!! (Send Hitman)' END AS Returned,
	MONTHNAME(rental.rental_date) AS month
  FROM film
  	INNER JOIN inventory USING(film_id)
  	INNER JOIN rental USING(inventory_id)
  	INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May'
   OR MONTHNAME(rental.rental_date) LIKE 'June';
