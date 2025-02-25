-- Drop existing schema for clean re-creation
DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;

\c outer_space

-- Create galaxies table
CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- Create stars table
CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INT REFERENCES galaxies(id)
);

-- Create planets table
CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES stars(id)
);

-- Create moons table
CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INT REFERENCES planets(id)
);

-- Insert data into galaxies table
INSERT INTO galaxies (name) VALUES
  ('Milky Way'),
  ('Andromeda');

-- Insert data into stars table
INSERT INTO stars (name, galaxy_id) VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

-- Insert data into planets table
INSERT INTO planets (name, orbital_period_in_years, orbits_around) VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 2),
  ('Gliese 876 b', 0.23, 3);

-- Insert data into moons table
INSERT INTO moons (name, planet_id) VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);
