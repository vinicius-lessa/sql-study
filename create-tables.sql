--
-- DEALERSHIPS table
--

CREATE TABLE IF NOT EXISTS dealerships (
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  state CHAR(2) NOT NULL,
  established DATE NOT NULL
);

--
-- CARS table
--

CREATE TABLE IF NOT EXISTS cars (
  id SERIAL PRIMARY KEY,
  brand TEXT NOT NULL,
  model TEXT NOT NULL,
  year INTEGER NOT NULL,
  price INTEGER NOT NULL,
  color TEXT NOT NULL,
  condition INTEGER NOT NULL CHECK (condition >= 0 AND condition <= 5),
  sold BOOLEAN NOT NULL DEFAULT false,
  dealership_id INTEGER NOT NULL REFERENCES dealerships(id)
);

--
-- STAFF table
--

CREATE TABLE IF NOT EXISTS staff (
  id SERIAL PRIMARY KEY,
  dealership_id INTEGER NOT NULL REFERENCES dealerships(id),
  name TEXT NOT NULL,
  role TEXT NOT NULL
);

--
-- SOLD_CARS table
--

CREATE TABLE IF NOT EXISTS sold_cars (
  id SERIAL PRIMARY KEY, 
  cars_id INTEGER NOT NULL REFERENCES cars(id),
  seller INTEGER NOT NULL REFERENCES staff(id),
  sold_date TIMESTAMP NOT NULL,
  sold_price INTEGER NOT NULL
);