# Creating Schemas and Tables

```sql
CREATE SCHEMA toms_marketing_stuff DEFAULT CHARSET utf8mb4

USE toms_marketing_stuff;

CREATE TABLE publishers (
    publisher_id INT NOT NULL,
    publisher_name VARCHAR(65),
    PRIMARY KEY (pk_publisher_id)
);

CREATE TABLE publisher_spend (
	publisher_spend_id INT NOT NULL,
	publisher_id INT NOT NULL,
    month DATE NOT NULL,
    spend DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (publisher_spend_id)
);
```
