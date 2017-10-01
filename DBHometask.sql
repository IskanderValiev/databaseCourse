CREATE TABLE movies (
  movie_name VARCHAR(50) NOT NULL,
  movie_descriptionv TEXT NOT NULL,
  movie_year DATE NOT NULL,
  movie_genres VARCHAR(50) NOT NULL,
  movie_country VARCHAR(50) NOT NULL,
  movie_budget MONEY NOT NULL,
  CHECK (extract(YEAR FROM movie_year) > 1900
         AND cast(movie_budget AS NUMERIC) < 10000
         AND EXTRACT(YEAR FROM movie_year) < EXTRACT(YEAR FROM current_date) + 10),
  PRIMARY KEY (movie_name, movie_year)
);

CREATE TABLE actors(
  actor_surname VARCHAR(20) NOT NULL ,
  actor_name VARCHAR(20) NOT NULL ,
  actor_birthday DATE NOT NULL ,
  actor_motherland VARCHAR(20) NOT NULL ,
  actor_number_of_movies SMALLINT,
  CHECK (actor_number_of_movies > 5),
  actor_id SERIAL,
  PRIMARY KEY (actor_name, actor_surname, actor_birthday)
);

CREATE TABLE producer (
  producer_name VARCHAR(50) NOT NULL ,
  producer_surname VARCHAR(50) NOT NULL ,
  producer_bithday DATE NOT NULL ,
  producer_motherland VARCHAR(50) DEFAULT 'USA' NOT NULL,
  producer_id SERIAL,
  PRIMARY KEY (producer_name, producer_surname, producer_bithday)
);

CREATE TABLE actors_movies (
  actor_movie_surename VARCHAR(20) NOT NULL ,
  actor_movie_name VARCHAR(20) NOT NULL ,
  actor_movie_birthday DATE NOT NULL ,
  movie_actor_name VARCHAR(50) NOT NULL ,
  movie_actor_year DATE NOT NULL ,
  FOREIGN KEY (actor_movie_surename, actor_movie_name, actor_movie_birthday) REFERENCES actors(actor_surname, actor_name, actor_birthday) ,
  FOREIGN KEY (movie_actor_name, movie_actor_year) REFERENCES movies(movie_name, movie_year)
);

ALTER TABLE producer ADD COLUMN producer_best_movie_id INTEGER ;
ALTER TABLE movies DROP CONSTRAINT movies_pkey CASCADE ;
ALTER TABLE movies ADD PRIMARY KEY (movie_id);
ALTER TABLE producer ADD FOREIGN KEY (producer_best_movie_id) REFERENCES movies (movie_id);

ALTER TABLE producer ALTER COLUMN producer_motherland SET DEFAULT 'UK';

ALTER TABLE actors DROP CONSTRAINT actors_actor_number_of_movies_check;

ALTER TABLE movies DROP CONSTRAINT movies_check;
ALTER TABLE movies ADD CHECK ((extract(YEAR FROM movie_year) > 1900
                               AND cast(movie_budget AS NUMERIC) < 10000 AND cast(movie_budget AS NUMERIC) >+ 1000
                               AND EXTRACT(YEAR FROM movie_year) < EXTRACT(YEAR FROM current_date) + 10)
);

CREATE TABLE genre(
  genre_movie_id INTEGER NOT NULL ,
  FOREIGN KEY (genre_movie_id) REFERENCES movies(movie_id),
  genre_name VARCHAR(20) NOT NULL
);

ALTER TABLE movies DROP COLUMN movie_genres;

CREATE TYPE MOTHERLAND AS ENUM ('Russia', 'UK', 'USA', 'France', 'Germany');

ALTER TABLE producer ALTER producer_motherland DROP DEFAULT;

ALTER TABLE producer ALTER COLUMN producer_motherland TYPE MOTHERLAND USING producer_motherland::MOTHERLAND;


ALTER TABLE producer ADD CHECK (extract(YEAR FROM producer_bithday) <= extract(YEAR FROM current_date));

CREATE INDEX actor_index ON actors (actor_name, actor_surname);

UPDATE movies SET movie_name = concat(movie_name, ' (', extract(YEAR FROM movie_year), ')');
