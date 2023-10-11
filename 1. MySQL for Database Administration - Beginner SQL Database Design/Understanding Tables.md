# Understanding primary keys and foreign keys

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

