-- Data Definition Language (DDL)
-- DDL is used to define and manage database structures, such as tables, indexes, and views.

--  The following queries uses PGlite and the entrypoint in `index.js`. Use the `query.sql` file to test queries, than run `node index.js`

-------------------------------------------------------------------------
-- CREATE TABLE statement
--  Used to create a new table in the database

CREATE TABLE IF NOT EXISTS cars (
    -- Basic column types
    id              SERIAL,         -- SERIAL is an auto-incrementing integer
    aisle           CHAR(2),        -- CHAR is a fixed-length string, e.g. 'A1', 'B2'
    model           VARCHAR(50),    -- VARCHAR is a variable-length string, e.g. 'Corolla', 'Civic'
    history         TEXT,           -- TEXT is a variable-length string for longer text, e.g. 'This car has been in an accident', 'This car has a clean history'
    year            INTEGER,        -- INTEGER is a whole number, e.g. 2005, 2010
    price           DECIMAL(10, 2), -- DECIMAL is a fixed-point number, e.g. 99999999.99    
    sold            BOOLEAN,        -- DEFAULT sets the default value for sold to false
    date_added      DATE,           -- DATE is a date value, e.g. '2024-06-01'
    last_inspection TIMESTAMP,      -- TIMESTAMP is a date and time value, e.g. '2024-06-01 12:00:00'
    
    -- Constraints
    id         SERIAL      PRIMARY KEY, -- PRIMARY KEY constraint ensures that the id is unique and not null
    model      VARCHAR(50) NOT NULL,     -- NOT NULL constraint ensures that the model cannot be null
    year       INTEGER     NULL,                 -- NULL allows the year to be optional    
    condition  INTEGER     CHECK (condition >= 1 AND condition <= 5), -- CHECK constraint ensures the condition is between 1 and 5
    sold       BOOLEAN     DEFAULT false, -- DEFAULT sets the default value for sold to false
    date_added TIMESTAMP   DEFAULT CURRENT_TIMESTAMP -- e.g. '2024-06-01 12:00:00'

    -- Foreign key example
    dealership_id INTEGER REFERENCES dealerships(id) -- REFERENCES creates a foreign key relationship with the dealerships table
);

-------------------------------------------------------------------------
-- ALTER TABLE statement
--  Used to modify an existing table, such as adding a column or changing a column's data type

-- Add a new text column
ALTER TABLE cars
ADD COLUMN date_added TEXT;

-- Alter column to not be nullable
ALTER TABLE cars
ALTER COLUMN dealership_id SET NOT NULL;

-- Add a foreign key constraint to the dealership_id column
ALTER TABLE cars
ADD CONSTRAINT dealership_fk FOREIGN KEY (dealership_id)
REFERENCES dealerships(id);

-------------------------------------------------------------------------
-- DROP statement
--  Used to delete database objects, such as tables, indexes, or views

-- Drop the cars table
DROP TABLE IF EXISTS cars;