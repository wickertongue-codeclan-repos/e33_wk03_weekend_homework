DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price DECIMAL,
  year INT2,
  show_time VARCHAR(255)
);

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds DECIMAL
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE
);

CREATE TABLE screenings (
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  year INT2,
  show_time VARCHAR(255)
);
