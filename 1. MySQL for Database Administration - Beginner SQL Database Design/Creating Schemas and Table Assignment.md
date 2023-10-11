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

SELECT * FROM publishers;
SELECT * FROM publisher_spend;
```

Even though Tom specified that he only needed three of the columns in the email, I added the publisher_spend_id to the publisher_spend table because the publishers table already has a primary key of publisher_id, which means that the primary key should never repeat on multiple records in the publisher_spend table.
