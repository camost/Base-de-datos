-- stored procedure
 DELIMITER //
 CREATE PROCEDURE GetAllProducts()
   BEGIN
   SELECT *  FROM products;
   END //
 DELIMITER ;
 
 CALL GetAllProducts();
 
 
 

CREATE PROCEDURE GetOfficeByCountry(IN countryName VARCHAR(255))
    BEGIN
        SELECT * 
        FROM offices
        WHERE country = countryName;
    END 
    
 CALL GetOfficeByCountry('Japan');
 
 SELECT * FROM offices;
 
 

CREATE PROCEDURE CountOrderByStatus(
        IN orderStatus VARCHAR(25),
        OUT total INT)
BEGIN
    SELECT count(orderNumber)
    INTO total
    FROM orders
    WHERE status = orderStatus;
END


CALL CountOrderByStatus('Shipped',@total);
SELECT @total;

CALL CountOrderByStatus('in process',@total);
SELECT @total AS  total_in_process;

 