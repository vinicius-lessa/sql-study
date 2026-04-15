-- Data Query Language (DQL)
-- DQL is used to query data from a database, and is the most commonly used language in SQL.

--  The following queries uses PGlite and the entrypoint in `index.js`. Use the `query.sql` file to test queries, than run `node index.js`

---------------------------------------------------------------------------------

-- SELECT + FROM statements are used to query data
SELECT * FROM cars;

-- WHERE clause is used to filter data based on conditions
SELECT * FROM cars WHERE price < 100000;

-- AND operator is used to combine multiple conditions
SELECT * FROM cars WHERE price < 100000 AND year > 1995;

-- OR operator is used to specify multiple conditions where at least one must be true
SELECT * FROM cars WHERE price < 100000 OR year > 2000;

-- =, <>, !=, NOT, >, <, >=, <= are comparison operators used in WHERE clause
SELECT * FROM cars WHERE brand = 'Toyota';
SELECT * FROM cars WHERE brand <> 'Toyota'; -- not equal
SELECT * FROM cars WHERE brand != 'Toyota'; -- same as above
SELECT * FROM cars WHERE NOT brand = 'Toyota'; -- same as above
SELECT * FROM cars WHERE price > 50000;
SELECT * FROM cars WHERE year <= 2010;

-- IS operator is used along with NULL and BOOLEAN values
SELECT * FROM cars WHERE sold IS TRUE;
SELECT * FROM cars WHERE color IS NULL; -- if there are any cars with NULL color

-- IN operator is used to specify multiple values in a WHERE clause
SELECT * FROM cars WHERE brand IN ('Toyota', 'Nissan', 'Ford');

-- BETWEEN operator is used to filter the result set within a certain range
SELECT * FROM cars WHERE year BETWEEN 1985 AND 2005;

-- LIMIT clause is used to specify the number of records to return
SELECT * FROM cars ORDER BY price DESC LIMIT 3; -- returns the top 3 most expensive cars

-- % AND _ are wildcard characters used in LIKE operator for pattern matching
SELECT * FROM cars WHERE brand LIKE 'T%'; -- starts with T (Toyota, Tesla)
SELECT * FROM cars WHERE model LIKE '%Type'; -- ends with Type (E-Type, S-Type, X-Type)
SELECT * FROM cars WHERE color LIKE '%green%'; -- contains green (green, dark green, light green)
SELECT * FROM cars WHERE brand LIKE 'DB_'; -- starts with DB and has one more character (DB4, DB5)

---------------------------------------------------------------------------------
-- ORDERING AND AGGREGATION

-- ORDER BY clause is used to sort the result set in ascending (ASC) or descending (DESC) order
SELECT * FROM cars ORDER BY price ASC; -- price in ascending order
SELECT * FROM cars ORDER BY year DESC; -- year in descending order
SELECT * FROM cars ORDER BY brand ASC, price DESC; -- brand in ascending order + price in descending order

-- COUNT, SUM, MIN, MAX, AVG are aggregate functions used to perform calculations on a set of values
select COUNT(*) FROM cars; -- total number of cars
SELECT COUNT(DISTINCT brand) FROM cars; -- total number of unique brands
SELECT SUM(price) FROM cars; -- total price of all cars
SELECT MIN(year) FROM cars; -- oldest car
SELECT MAX(year) FROM cars; -- newest car
SELECT AVG(price) FROM cars; -- average price of cars

-- GROUP BY clause is used along aggregate functions to split the result set into groups based on one or more columns
SELECT brand, COUNT(*) as total_cars FROM cars GROUP BY brand; -- number of cars for each brand
SELECT brand, AVG(price) as avg_price FROM cars GROUP BY brand; -- average price for each brand

-- HAVING clause is used to filter groups based on a condition, often used with GROUP BY
--  Note: Having does not allow aliases
SELECT brand, COUNT(*) as total_cars, FLOOR(AVG(price)) as avg_price FROM cars GROUP BY brand HAVING total_cars > 1; -- only brands with more than 1 car


---------------------------------------------------------------------------------
-- MATHEMATICAL FUNCTIONS

-- FLOOR, CEIL, ROUND are used to round numeric values
--  Given an average of 99.546345
SELECT FLOOR(AVG(price)) FROM cars; -- average price rounded down, e.g. 99
SELECT CEIL(AVG(price)) FROM cars; -- average price rounded up, e.g. 100
SELECT ROUND(AVG(price), 2) FROM cars; -- average price rounded to 2 decimal places, e.g. 99.55