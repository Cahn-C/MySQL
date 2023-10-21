-- 
USE midcourseproject;

SELECT * FROM mavenmoviesmini.inventory_non_normalized;

/* 
  After careful review of the inventory_non_normalized, I've noticied that there is only 1 table that consists of multiple columns that 
  need to be in its own table, the current schema needs some work;
*/


/* 
  I will need to make 2 other tables, the names for these tables will be films and stores, I will also drop current the inventory_non_normalized
  table and create a new table called inventory.
*/
CREATE TABLE inventory
SELECT inventory_id,
       film_id,
       store_id
FROM mavenmoviesmini.inventory_non_normalized;

CREATE TABLE films
SELECT DISTINCT
       film_id,
       title,
       description,
       release_year,
       rental_rate,
       rating
FROM mavenmoviesmini.inventory_non_normalized;

CREATE TABLE stores
SELECT DISTINCT 
       store_id,
       store_manager_first_name,
       store_manager_last_name,
       store_address,
       store_city,
       store_district
FROM mavenmoviesmini.inventory_non_normalized;

SELECT * FROM inventory;
SELECT * FROM films;
SELECT * FROM stores;


ALTER TABLE inventory ADD PRIMARY KEY (invertory_id);
ALTER TABLE films ADD PRIMARY KEY (film_id);
ALTER TABLE stores ADD PRIMARY KEY (store_id);
ALTER TABLE `midcourseproject`.`inventory` ADD PRIMARY KEY (`inventory_id`), ADD INDEX `film_id_idx` (`film_id` ASC) VISIBLE;
ALTER TABLE `midcourseproject`.`inventory` ADD CONSTRAINT `film_id` FOREIGN KEY (`film_id`) REFERENCES `midcourseproject`.`films` (`film_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `midcourseproject`.`inventory` ADD CONSTRAINT `store_id` FOREIGN KEY (`store_id`) REFERENCES `midcourseproject`.`stores` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


