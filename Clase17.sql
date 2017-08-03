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
