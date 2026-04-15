-- Data Manipulation Language (DML)
-- DML is used to insert, update, delete data in a database.

--  The following queries uses PGlite and the entrypoint in `index.js`. Use the `query.sql` file to test queries, than run `node index.js`

---------------------------------------------------------------------------------

-- INSERT INTO statement is used to insert new records into a table
INSERT INTO cars (brand, model, year, price, color, condition, sold) 
VALUES ('Toyota', 'Corolla', 2005, 5000, 'blue', 3, false);

-- Multiples rows can be inserted at once
INSERT INTO cars (brand, model, year, price, color, condition, sold) 
VALUES 
('Honda', 'Civic', 2010, 7000, 'red', 4, false),
('Ford', 'Focus', 2012, 6000, 'white', 2, true);

-- UPDATE statement is used to modify existing records in a table
UPDATE cars 
SET price = 5500, condition = 4 
WHERE id = 1;

-- DELETE statement is used to delete records from a table
DELETE FROM cars 
WHERE id = 2;