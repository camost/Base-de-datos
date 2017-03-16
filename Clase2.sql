CREATE TABLE film 
( film_id INT PRIMARY KEY NOT NULL  AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  release_year YEAR NOT NULL
);

CREATE TABLE actor 
( actor_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

CREATE TABLE film_actor 
( actor_id  INT NOT NULL,
  film_id INT NOT NULL
);

ALTER TABLE film_actor 
ADD	CONSTRAINT fk_filma_film
		FOREIGN KEY (film_id)
		REFERENCES film (film_id);

ALTER TABLE film_actor 
ADD	CONSTRAINT fk_filma_actor
		FOREIGN KEY (actor_id)
		REFERENCES actor (actor_id);
		
ALTER TABLE actor 
	ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;	
ALTER TABLE film 
	ADD last_update DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
	
INSERT INTO imdb.actor
(first_name, last_name)
VALUES('paco', 'perez');

INSERT INTO imdb.film
(title, description, release_year)
VALUES('wachinango', 'me gusta juagr el futbol', '2010');

SELECT first_name,last_name FROM actor;


SELECT actor_id, first_name, last_name, last_update
FROM imdb.actor;

SELECT film_id, title, description, release_year, last_update
FROM imdb.film;
