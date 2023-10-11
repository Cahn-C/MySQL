# Updating a Database Table Assignment

```sql
USE candystore;

ALTER TABLE employees DROP COLUMN hourly_wage;
ALTER TABLE employees ADD COLUMN avg_customer_rating DECIMAL(1, 1);
ALTER TABLE employees MODIFY COLUMN avg_customer_rating DECIMAL(5, 1);

SELECT * FROM employees;
```
