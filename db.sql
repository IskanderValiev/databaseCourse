{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fnil\fcharset0 Menlo-Bold;\f1\fnil\fcharset0 Menlo-Regular;\f2\fnil\fcharset0 Menlo-Italic;
}
{\colortbl;\red255\green255\blue255;\red191\green100\blue38;\red32\green32\blue32;\red153\green168\blue186;
\red133\green96\blue154;\red86\green132\blue173;\red254\green187\blue91;\red88\green118\blue71;}
{\*\expandedcolortbl;;\csgenericrgb\c74902\c39216\c14902;\csgenericrgb\c12549\c12549\c12549;\csgenericrgb\c60000\c65882\c72941;
\csgenericrgb\c52157\c37647\c60392;\csgenericrgb\c33725\c51765\c67843;\csgenericrgb\c99608\c73333\c35686;\csgenericrgb\c34510\c46275\c27843;}
\margl1440\margr1440\vieww15140\viewh10200\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\b\fs24 \cf2 \cb3 CREATE TABLE 
\f1\b0 \cf4 movies (\
  \cf5 movie_name 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 NOT NULL
\f1\b0 ,\
  \cf5 movie_descriptionv 
\f0\b \cf7 TEXT \cf2 NOT NULL
\f1\b0 ,\
  \cf5 movie_year \cf7 DATE 
\f0\b \cf2 NOT NULL
\f1\b0 ,\
  \cf5 movie_genres 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 NOT NULL
\f1\b0 ,\
  \cf5 movie_country 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 NOT NULL
\f1\b0 ,\
  \cf5 movie_budget \cf7 MONEY 
\f0\b \cf2 NOT NULL
\f1\b0 ,\
  
\f0\b CHECK 
\f1\b0 \cf4 (
\f2\i \cf7 extract
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f1\b0 \cf5 movie_year\cf4 ) > \cf6 1900\
         
\f0\b \cf2 AND 
\f2\i\b0 \cf7 cast
\f1\i0 \cf4 (\cf5 movie_budget 
\f0\b \cf2 AS NUMERIC
\f1\b0 \cf4 ) < \cf6 10000\
         
\f0\b \cf2 AND 
\f2\i\b0 \cf7 EXTRACT
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f1\b0 \cf5 movie_year\cf4 ) < 
\f2\i \cf7 EXTRACT
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f2\i\b0 \cf7 current_date
\f1\i0 \cf4 ) + \cf6 10\cf4 )\cf2 ,\
  
\f0\b PRIMARY KEY 
\f1\b0 \cf4 (\cf5 movie_name\cf2 , \cf5 movie_year\cf4 )\
)\cf2 ;\
\

\f0\b CREATE TABLE 
\f1\b0 \cf4 actors(\
  \cf5 actor_surname 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 20\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 actor_name 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 20\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 actor_birthday \cf7 DATE 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 actor_motherland 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 20\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 actor_number_of_movies 
\f0\b \cf2 SMALLINT
\f1\b0 ,\
  
\f0\b CHECK 
\f1\b0 \cf4 (\cf5 actor_number_of_movies \cf4 > \cf6 5\cf4 )\cf2 ,\
  \cf5 actor_id 
\f0\b \cf2 SERIAL
\f1\b0 ,\
  
\f0\b PRIMARY KEY 
\f1\b0 \cf4 (\cf5 actor_name\cf2 , \cf5 actor_surname\cf2 , \cf5 actor_birthday\cf4 )\
)\cf2 ;\
\

\f0\b CREATE TABLE 
\f1\b0 \cf4 producer (\
  \cf5 producer_name 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 producer_surname 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 producer_bithday 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 producer_motherland 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 DEFAULT 
\f1\b0 \cf8 'USA' 
\f0\b \cf2 NOT NULL
\f1\b0 ,\
  \cf5 producer_id 
\f0\b \cf2 SERIAL
\f1\b0 ,\
  
\f0\b PRIMARY KEY 
\f1\b0 \cf4 (\cf5 producer_name\cf2 , \cf5 producer_surname\cf2 , \cf5 producer_bithday\cf4 )\
)\cf2 ;\
\

\f0\b CREATE TABLE 
\f1\b0 \cf4 actors_movies (\
  \cf5 actor_movie_surename 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 20\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 actor_movie_name 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 20\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 actor_movie_birthday \cf7 DATE 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 movie_actor_name 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 50\cf4 ) 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  \cf5 movie_actor_year \cf7 DATE 
\f0\b \cf2 NOT NULL 
\f1\b0 ,\
  
\f0\b FOREIGN KEY 
\f1\b0 \cf4 (\cf5 actor_movie_surename\cf2 , \cf5 actor_movie_name\cf2 , \cf5 actor_movie_birthday\cf4 ) 
\f0\b \cf2 REFERENCES 
\f1\b0 \cf4 actors(\cf5 actor_surname\cf2 , \cf5 actor_name\cf2 , \cf5 actor_birthday\cf4 ) \cf2 ,\
  
\f0\b FOREIGN KEY 
\f1\b0 \cf4 (\cf5 movie_actor_name\cf2 , \cf5 movie_actor_year\cf4 ) 
\f0\b \cf2 REFERENCES 
\f1\b0 \cf4 movies(\cf5 movie_name\cf2 , \cf5 movie_year\cf4 )\
)\cf2 ;\
\

\f0\b ALTER TABLE 
\f1\b0 \cf4 producer 
\f0\b \cf2 ADD COLUMN 
\f1\b0 \cf5 producer_best_movie_id 
\f0\b \cf2 INTEGER 
\f1\b0 ;\

\f0\b ALTER TABLE 
\f1\b0 \cf4 movies 
\f0\b \cf2 DROP CONSTRAINT 
\f1\b0 \cf4 movies_pkey 
\f0\b \cf2 CASCADE 
\f1\b0 ;\

\f0\b ALTER TABLE 
\f1\b0 \cf4 movies 
\f0\b \cf2 ADD PRIMARY KEY 
\f1\b0 \cf4 (\cf5 movie_id\cf4 )\cf2 ;\

\f0\b ALTER TABLE 
\f1\b0 \cf4 producer 
\f0\b \cf2 ADD FOREIGN KEY 
\f1\b0 \cf4 (\cf5 producer_best_movie_id\cf4 ) 
\f0\b \cf2 REFERENCES 
\f1\b0 \cf4 movies (\cf5 movie_id\cf4 )\cf2 ;\
\

\f0\b ALTER TABLE 
\f1\b0 \cf4 producer 
\f0\b \cf2 ALTER COLUMN 
\f1\b0 \cf5 producer_motherland 
\f0\b \cf2 SET DEFAULT 
\f1\b0 \cf8 'UK'\cf2 ;\
\

\f0\b ALTER TABLE 
\f1\b0 \cf4 actors 
\f0\b \cf2 DROP CONSTRAINT 
\f1\b0 \cf4 actors_actor_number_of_movies_check\cf2 ;\
\

\f0\b ALTER TABLE 
\f1\b0 \cf4 movies 
\f0\b \cf2 DROP CONSTRAINT 
\f1\b0 \cf4 movies_check\cf2 ;\

\f0\b ALTER TABLE 
\f1\b0 \cf4 movies 
\f0\b \cf2 ADD CHECK 
\f1\b0 \cf4 ((
\f2\i \cf7 extract
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f1\b0 \cf5 movie_year\cf4 ) > \cf6 1900\
                               
\f0\b \cf2 AND 
\f2\i\b0 \cf7 cast
\f1\i0 \cf4 (\cf5 movie_budget 
\f0\b \cf2 AS NUMERIC
\f1\b0 \cf4 ) < \cf6 10000 
\f0\b \cf2 AND 
\f2\i\b0 \cf7 cast
\f1\i0 \cf4 (\cf5 movie_budget 
\f0\b \cf2 AS NUMERIC
\f1\b0 \cf4 ) >+ \cf6 1000\
                               
\f0\b \cf2 AND 
\f2\i\b0 \cf7 EXTRACT
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f1\b0 \cf5 movie_year\cf4 ) < 
\f2\i \cf7 EXTRACT
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f2\i\b0 \cf7 current_date
\f1\i0 \cf4 ) + \cf6 10\cf4 )\
)\
\

\f0\b \cf2 CREATE TABLE 
\f1\b0 \cf4 genre(\
  \cf5 genre_movie_id 
\f0\b \cf2 INTEGER NOT NULL 
\f1\b0 ,\
  
\f0\b FOREIGN KEY 
\f1\b0 \cf4 (\cf5 genre_movie_id\cf4 ) 
\f0\b \cf2 REFERENCES 
\f1\b0 \cf4 movies(\cf5 movie_id\cf4 )\cf2 ,\
  \cf5 genre_name 
\f0\b \cf2 VARCHAR
\f1\b0 \cf4 (\cf6 20\cf4 ) 
\f0\b \cf2 NOT NULL\

\f1\b0 \cf4 )\cf2 ;\
\

\f0\b ALTER TABLE 
\f1\b0 \cf4 movies 
\f0\b \cf2 DROP COLUMN 
\f1\b0 \cf5 movie_genres\cf2 ;\
\

\f0\b CREATE TYPE 
\f1\b0 \cf4 MOTHERLAND 
\f0\b \cf2 AS ENUM 
\f1\b0 \cf4 (\cf8 'Russia'\cf2 , \cf8 'UK'\cf2 , \cf8 'USA'\cf2 , \cf8 'France'\cf2 , \cf8 'Germany'\cf4 )\cf2 ;\

\f0\b ALTER TABLE 
\f1\b0 \cf4 producer 
\f0\b \cf2 ALTER COLUMN 
\f1\b0 \cf5 producer_motherland 
\f0\b \cf2 TYPE 
\f1\b0 \cf4 MOTHERLAND 
\f0\b \cf2 USING 
\f1\b0 \cf5 producer_motherland\cf4 ::MOTHERLAND\cf2 ;\
\

\f0\b ALTER TABLE 
\f1\b0 \cf4 producer 
\f0\b \cf2 ADD CHECK 
\f1\b0 \cf4 (
\f2\i \cf7 EXTRACT
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f1\b0 \cf5 producer_bithday\cf4 ) < 
\f2\i \cf7 EXTRACT
\f1\i0 \cf4 (
\f0\b \cf2 YEAR FROM 
\f2\i\b0 \cf7 current_date
\f1\i0 \cf4 )) \cf2 ;\
\

\f0\b CREATE INDEX 
\f1\b0 \cf4 actor_index 
\f0\b \cf2 ON 
\f1\b0 \cf4 actors (\cf5 actor_name\cf2 , \cf5 actor_surname\cf4 )\cf2 ;\
\

\f0\b ALTER TABLE 
\f1\b0 \cf4 "public ".movies 
\f0\b \cf2 RENAME COLUMN 
\f1\b0 \cf5 movie_name 
\f0\b \cf2 TO 
\f1\b0 \cf5 "movie_name(movie_contry)"\cf2 ;\
}