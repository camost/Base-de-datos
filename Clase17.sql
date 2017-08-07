SELECT * FROM customers;


CREATE INDEX postalCode ON customers(postalCode);

-- DROP INDEX postalCode ON customers;

SELECT * FROM products;


ALTER TABLE products 
ADD FULLTEXT(productline);

--------------------------------------
SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');

-------------------------------------  
SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic,Vintage');

-------------------------------------

SELECT productName, productline
FROM products
WHERE MATCH(productline) 
AGAINST('Classic,Vintage' IN NATURAL LANGUAGE MODE)

----------------------------------------

ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('1932,Ford');


-----------------------------------------

-- Ej 1:
-- Create two or three queries using address table in sakila db:
-- include postal_code in where (try with in/not it operator) 
-- eventually join the table with city/country tables.
-- measure execution time.
-- Then create an index for postal_code on address table.
-- measure execution time again and compare with the previous ones.
-- Explain the results

SELECT address,CONCAT_WS(" ",first_name,last_name) AS "Nombre"
FROM address
INNER JOIN customer USING(address_id);

SELECT * FROM address
WHERE postal_code IN (SELECT postal_code 
					  FROM address 
					  WHERE postal_code LIKE '%3%');
					  
CREATE INDEX codigo_direccion ON address(postal.code);

----------------------------------------------------------
-- Ej 2: Run queries using actor table, searching for first and last name columns independently.
-- Explain the differences and why is that happening?

-- es mas "rapido" igual una ves cacheado no te das cuenta
SELECT first_name FROM actor WHERE first_name LIKE "%ed%";
SELECT last_name FROM actor WHERE last_name LIKE "%gable%";

-- 3 Compare results finding text in the description 
-- on table film with LIKE and in the film_text using MATCH ... AGAINST. Explain the results.
