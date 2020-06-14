CREATE DATABASE cars;
use cars;

CREATE TABLE favorite_colors (
  name VARCHAR(20),
  color VARCHAR(10)
);

INSERT INTO favorite_colors
  (name, color)
VALUES
  ('BMW', 'blue'),
  ('Mercedes', 'yellow');
