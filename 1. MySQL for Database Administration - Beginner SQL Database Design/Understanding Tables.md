# Primary Keys and Foreign Keys

```sql
SELECT * FROM course_ratings;
```
Results: <br>
<img width="419" alt="image" src="https://github.com/Cahn-C/MySQL/assets/72324462/eb6cb3c8-53a1-433a-93ce-ea8a11381b90">
<br><br><br>


```sql
SELECT * FROM course_ratings_summaries;
```
Results: <br>
<img width="248" alt="image" src="https://github.com/Cahn-C/MySQL/assets/72324462/275f1ef8-785a-4d27-aaa9-ade63181e593">
<br><br><br>


```sql
SELECT * FROM courses;
```
Results: <br>
<img width="373" alt="image" src="https://github.com/Cahn-C/MySQL/assets/72324462/0aef1d15-4a2a-4082-b333-0d86d9dab2ec">
<br><br>

1) The primary key for course_rating is rating_id and the foreign key is course_id
2) The tables are a one-to-many relationship because one table has of one primary and a foreign key while the other two tables just have a primary key

<br><br>

# Data Normalization

```sql
USE onlinelearningschool;

SELECT * FROM course_ratings_summaries;
SELECT * FROM course_ratings;
SELECT * FROM courses;


ALTER TABLE course_ratings_summaries ADD COLUMN course_ratings_summaries_id BIGINT(20) AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (course_ratings_summaries_id);

CREATE TABLE course_ratings_normalized
SELECT rating_id,
       course_id,
       star_rating
FROM course_ratings;

SELECT * FROM course_ratings_normalized;

ALTER TABLE `onlinelearningschool`.`course_ratings_normalized` 
ADD PRIMARY KEY (`rating_id`),
ADD INDEX `course_id_idx` (`course_id` ASC) VISIBLE;
;
ALTER TABLE `onlinelearningschool`.`course_ratings_normalized` 
ADD CONSTRAINT `course_id`
  FOREIGN KEY (`course_id`)
  REFERENCES `onlinelearningschool`.`courses` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SELECT * FROM course_ratings_summaries;
SELECT * FROM course_ratings_normalized;
SELECT * FROM courses;
```
<br><br>

# Data Model
<img width="611" alt="image" src="https://github.com/Cahn-C/MySQL/assets/72324462/69ebb372-68fc-4d3f-bba9-eaa998447b10">

