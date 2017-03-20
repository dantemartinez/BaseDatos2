 
 CREATE TABLE test2.film
 (film_id INT PRIMARY KEY,
  title VARCHAR(32) NOT NULL,
  description TEXT,
  release_year YEAR
  );
 
 CREATE TABLE test2.actor
 (actor_id INT PRIMARY KEY,
  first_name VARCHAR(16) NOT NULL,
  last_name VARCHAR(16) NOT NULL
  );
  
  ALTER TABLE test2.film
	MODIFY COLUMN film_id INT AUTO_INCREMENT;
	
  ALTER TABLE test2.actor
	MODIFY COLUMN actor_id INT AUTO_INCREMENT;
  
   CREATE TABLE test2.film_actor
 (actor_id INT NOT NULL,
  film_id INT NOT NULL
  );
  

  
  ALTER TABLE test2.film_actor ADD
   CONSTRAINT fk_actor_id
   FOREIGN KEY (actor_id)
   REFERENCES actor (actor_id);
   
  ALTER TABLE test2.film_actor ADD
   CONSTRAINT fk_film_id
   FOREIGN KEY (film_id)
   REFERENCES film (film_id);
  
  
  ALTER TABLE test2.film 
    MODIFY COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
    
  ALTER TABLE test2.film 
    MODIFY COLUMN release_year YEAR;
   
  ALTER TABLE test2.film_actor ADD
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

  ALTER TABLE test2.film 
    MODIFY COLUMN description TEXT;
  
  
    
    
  INSERT INTO test2.film
  (film_id, title, description, release_year)
  VALUES(film_id,'primera pelicula', 'esta re duro', 2015);
  

   
 