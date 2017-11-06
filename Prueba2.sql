SELECT title,first_name ,COUNT(*) 
FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN customer USING(customer_id)
GROUP BY 1,2;


SELECT first_name,last_name,COUNT(*)
FROM customer
INNER JOIN rental USING(customer_id)
WHERE first_name LIKE '%ADRIAN%'
GROUP BY 1,2;



SELECT first_name, last_name,COUNT(*)
FROM customer
WHERE customer.customer_id = payment.customer_id
-- AND customer.customer_id=rental.customer_id
AND customer.first_name LIKE '%ADAM%';

	SELECT COUNT(*) 
	FROM customer
	INNER JOIN payment USING(customer_id)
	INNER JOIN rental USING(rental_id)
	WHERE first_name LIKE "%ADAM%";
-- Write a function that returns the amount of films rented and returned by a customer. 
-- It takes the customer first name and last name as arguments.
CREATE FUNCTION Contadorr(p_nomb VARCHAR,p_apell VARCHAR) RETURNS INT(69)
BEGIN
    DECLARE asd INT(69);
	SELECT COUNT(*) 
	FROM customer
	INNER JOIN payment USING(customer_id)
	INNER JOIN rental USING(rental_id)
	WHERE first_name=p_nomb
	AND last_name = p_apell;
    RETURN (asd);
END

SELECT Contadorr("ADRIAN","CLARY");






3

SELECT first_name,last_name
FROM 

        SELECT first_name,last_name,country
        FROM customer
        INNER JOIN address USING(address_id)
        INNER JOIN city USING(city_id)
        INNER JOIN country USING(country_id)
        WHERE country="Algeria";


CREATE PROCEDURE MyStoredProcedure(IN p_country VARCHAR(100), INOUT p_names TEXT)
BEGIN
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE v_first varchar(100) DEFAULT "";
	DECLARE v_last varchar(100) DEFAULT "";
	
	DECLARE my_cursor CURSOR FOR 
        SELECT first_name,last_name FROM customer
        INNER JOIN address USING(address_id)
        INNER JOIN city USING(city_id)
        INNER JOIN country USING(country_id)
        WHERE country = p_country ; 
 
     -- declare NOT FOUND handler
     
  DECLARE CONTINUE HANDLER 
  FOR NOT FOUND SET v_finished = 1;
	OPEN my_cursor;
	
	get_name: LOOP

        FETCH my_cursor INTO v_first,v_last;

        IF v_finished = 1 THEN 
            LEAVE get_name;
        END IF;

        SET p_names = CONCAT(v_first, " ", v_last ," ; ", p_names);

    END LOOP get_name;

    CLOSE my_cursor;

END


-- TEST CASE
SET @p_names= "";
CALL MyStoredProcedure('Algeria', @p_names);
SELECT @p_names;




