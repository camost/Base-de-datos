CREATE TABLE contacts (	
	contact_id INT(11) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	first_name VARCHAR(25),
	birthday DATE
	-- CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);


ALTER TABLE contacts
	ADD CONSTRAINT contacts_pk
		PRIMARY KEY (last_name, first_name);
	
-- agrego
ALTER TABLE contacts 
	ADD email VARCHAR(40) NOT NULL
			AFTER last_name;	

-- modifico			
ALTER TABLE contacts 
	MODIFY last_name VARCHAR(50);

	
-- agrego y borro
ALTER TABLE contacts 
	ADD prueba_para_borrar VARCHAR(40) NOT NULL;	

ALTER TABLE contacts
	DROP COLUMN prueba_para_borrar;
		
-- agrego cositas ricas
INSERT INTO test.contacts
(last_name, first_name, birthday)
VALUES('yo', 'yo', null);

-- cambio un dato de una columna
ALTER TABLE contacts
	CHANGE COLUMN birth birthday
		DATE NOT NULL;

CREATE TABLE products
(	product_name VARCHAR(50) NOT NULL,
	location VARCHAR(50) NOT NULL,
	category VARCHAR(25),
	CONSTRAINT products_pk PRIMARY KEY (product_name, location)
);
	
CREATE TABLE inventory 
( inventory_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  quantity INT,
  min_level INT,
  max_level INT
);		

ALTER TABLE inventory ADD
	CONSTRAINT fk_inventory_products
		FOREIGN KEY (product_name, location)
		REFERENCES products (product_name, location);


INSERT INTO test.products
(product_name, location, category)
VALUES('productouno', 'unalocation', 'baño');

INSERT INTO test.inventory
(inventory_id, product_name, location, quantity, min_level, max_level)
VALUES(0, 'productouno', 'unalocation', 0, 0, 0);
		
		
		
		

		
-- veo cosas que hago :D
SELECT * FROM products;
SELECT * FROM contacts;


-- borro tabla malvada
DROP TABLE contacts CASCADE;
TRUNCATE TABLE contacts;