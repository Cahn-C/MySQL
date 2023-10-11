# Deleting Data in a Table

```sql
-- Auto commit is currently off
SELECT @@autocommit;

SET autocommit = OFF;
SET autocommit = ON;

SELECT * FROM employees;
SELECT * FROM customer_reviews;

DELETE FROM employees WHERE employee_id = 4;
TRUNCATE TABLE customer_reviews;
```
