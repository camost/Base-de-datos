SELECT rating,title
FROM film
ORDER BY rating;
				              
SELECT rating, COUNT(*)
FROM film
GROUP BY rating;
				             
SELECT rating, AVG(length)
FROM film
GROUP BY rating;

-- devuelve todos los clientes que alquilaron 1 pelicula
SELECT c.customer_id, first_name,last_name,COUNT(*)
FROM rental r1, customer c
WHERE c.customer_id = r1.customer_id
GROUP BY c.customer_id,first_name,last_name
HAVING COUNT(*) = 1;

-- peliculas cuyo larg minimo sea de 46
SELECT rating,MIN(length)
FROM film
GROUP BY rating
HAVING MIN(length) > 46;

-- cantidad de peliculas total por categoria, menores a 195 count cuenta rows
SELECT rating, COUNT(*)
FROM film
GROUP BY rating
HAVING COUNT(*)<195;

-- sing group by ni hav
SELECT DISTINCT rating
FROM film f1
WHERE (SELECT COUNT(*) 
FROM film f2 WHERE f1.rating = f2.rating) <195;

-- mismo que arriba pero bien
SELECT DISTINCT rating,
(SELECT COUNT(*)
FROM film f3 WHERE f3.rating=f1.rating) AS total
FROM film f1
WHERE (SELECT COUNT(*) 
FROM film f2 WHERE f2.rating=f1.rating) <195

-- comparo el promedio de duracion por rating con el de 
SELECT rating,AVG(length)
FROM film
GROUP BY rating
HAVING AVG(length) > (SELECT AVG(length)FROM film );




