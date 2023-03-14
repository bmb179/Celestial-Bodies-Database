--Prepared for FreeCodeCamp's Relational Database course

DROP DATABASE universe;

CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR NOT NULL UNIQUE, galaxy_type TEXT NOT NULL, 
					approx_number_of_stars NUMERIC, galaxy_group VARCHAR);

CREATE TABLE quasar(quasar_id SERIAL PRIMARY KEY, name VARCHAR NOT NULL UNIQUE, quasar_type TEXT NOT NULL,
					galaxy_id INT REFERENCES galaxy(galaxy_id));

CREATE TABLE star(star_id SERIAL PRIMARY KEY, name VARCHAR NOT NULL UNIQUE, star_type TEXT NOT NULL, planets INT,
					galaxy_id INT REFERENCES galaxy(galaxy_id));

CREATE TABLE planet(planet_id SERIAL PRIMARY KEY, name VARCHAR NOT NULL UNIQUE, moons INT, rings BOOLEAN NOT NULL,
					star_id INT REFERENCES star(star_id));

CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR NOT NULL UNIQUE, sole_moon BOOLEAN NOT NULL,
					year_discovered NUMERIC(4), planet_id INT REFERENCES planet(planet_id));
					
INSERT INTO galaxy(name, galaxy_type, approx_number_of_stars, galaxy_group)
VALUES('Milky Way', 'barred-spiral', 500000000000, 'Local Group'), 
	  ('Canis Major Dwarf', 'dwarf-irregular', NULL, 'Local Group'), 
	  ('Virgo Stellar Stream', 'dwarf-spheroid', NULL, 'Local Group' ), 
	  ('Sagittarius Dwarf Elliptical Galaxy', 'dwarf-spheroid', NULL, 'Local Group'), 
	  ('Large Magellanic Cloud', 'Magellanic-spiral', 20000000000, 'Local Group'), 
	  ('Small Magellanic Cloud', 'dwarf-irregular', 3000000000, 'Local Group');

INSERT INTO quasar(name, quasar_type, galaxy_id)
VALUES('Example 1', 'Radio-loud', 3), ('Example 2', 'Radio-quiet', 6), ('Example 3', 'Red', 5);

INSERT INTO star(name, star_type, planets, galaxy_id)
VALUES('Sol', 'Yellow Dwarf', 8, 1),('Proxima Centauri', 'Red Dwarf', 3, 1),('Barnards Star', 'Red Dwarf', 1, 1),
	  ('Luhman 16', 'Brown Dwarf', 0, 1), ('W0855', 'Brown Dwarf', NULL, 1), ('Wolf 359', 'Red Dwarf',2,1);

INSERT INTO planet(name, moons, rings, star_id)
VALUES('Mercury',0,FALSE,1),('Venus',0,FALSE,1),('Earth',1,FALSE,1),('Mars',2,FALSE,1),('Jupiter',79,TRUE,1),('Saturn',82,TRUE,1),
	  ('Uranus',27,TRUE,1),('Neptune',14,TRUE,1),('Proxima b',NULL,FALSE,2),('Proxima c',NULL,FALSE,2),('Proxima d',NULL,FALSE,2),
	  ('Barnards Star b',NULL,FALSE,3);

INSERT INTO moon(name, sole_moon, year_discovered, planet_id)
VALUES('Moon',TRUE,1610,3),('Phobos',FALSE,1877,4),('Deimos',FALSE,1877,4),('Ganymede',FALSE,1610,5),('Callisto',FALSE,1610,5),
	  ('Io',FALSE,1610,5),('Europa',FALSE,1610,5),('Amalthea',FALSE,1892,5),('Himalia',FALSE,1904,5),('Elara',FALSE,1905,5),
	  ('Pasiphae',FALSE,1908,5),('Sinope',FALSE,1914,5),('Lysithea',FALSE,1938,5),('Carme',FALSE,1938,5),('Ananke',FALSE,1951,5),
	  ('Leda',FALSE,1974,5),('Thebe',FALSE,1979,5),('Adrastea',FALSE,1979,5),('Metis',FALSE,1979,5),('Callirrhoe',FALSE,1999,5);
