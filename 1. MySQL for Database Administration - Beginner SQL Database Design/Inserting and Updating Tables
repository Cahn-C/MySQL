# Updating and Inserting into the Candy Store Schema

```sql
USE candystore;

INSERT INTO employees (employee_id, first_name, last_name, hire_date, position)
VALUES (7, 'Chalres', 'Munger', '2020-03-15', 'Clerk');
INSERT INTO employees (employee_id, first_name, last_name, hire_date, position)
VALUES (8, 'William', 'Gates', '2020-03-15', 'Clerk');

UPDATE employees SET avg_customer_rating = 4.8 WHERE employee_id = 1;
UPDATE employees SET avg_customer_rating = 4.6 WHERE employee_id = 2;
UPDATE employees SET avg_customer_rating = 4.75 WHERE employee_id in (3, 5);
UPDATE employees SET avg_customer_rating = 4.9 WHERE employee_id = 4;
UPDATE employees SET avg_customer_rating = 4.2 WHERE employee_id = 6;
UPDATE employees SET avg_customer_rating = 5.0 WHERE employee_id = 7;
UPDATE employees SET avg_customer_rating = 5.0 WHERE employee_id = 8;


SELECT * FROM employees;
```
