DO $$ DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE'; 
    END LOOP;
END $$;
-- ABOVE CODE DELETES ALL TABLES FROM DB------------------



CREATE TABLE Person (
	personID integer PRIMARY KEY, 
	loginID varchar UNIQUE ,
	password varchar,
	profilephoto varchar NULL,
	name varchar NOT NULL,
	phonenum varchar NULL,
	email varchar NULL,
	rating decimal NULL,
	numRatings Integer NULL
	);

CREATE TABLE Breed (
	breedID integer PRIMARY KEY, 
	description varchar,
	quizattr integer,
	picture varchar
	);

CREATE TABLE Dog (
	dogID integer PRIMARY KEY, 
	name varchar,
	bio varchar,
	age integer,
	sex varchar, -- change to char and limit?
	personID integer REFERENCES Person(personID),
	price money,
	breedID integer REFERENCES Breed(breedID)
	);

CREATE TABLE Matches (
	personID integer REFERENCES Person(personID),
	dogID integer REFERENCES Dog(dogID)
	);

CREATE TABLE Photos (
	dogID integer REFERENCES Dog(dogID), 
	photo varchar
	);

GRANT SELECT ON Person TO PUBLIC;
GRANT SELECT ON Breed TO PUBLIC;
GRANT SELECT ON Matches TO PUBLIC;
GRANT SELECT ON Dog TO PUBLIC;
GRANT SELECT ON Photos TO PUBLIC;

INSERT INTO Person VALUES (1,'AndrewThomas','thisissecure','/home/justin/Pictures/dog1','Andrew Thomas','586-761-1141','Athomas@gmail.com',4.3,100);
INSERT INTO Breed VALUES (1,'Dalminations are dogs that are black and white',200,'/home/justin/Pictures/dog1/picture1.png');
INSERT INTO Dog VALUES (1,'Dalminations','black and white',12,1,100.10,1);
INSERT INTO Matches VALUES (1,1);
INSERT INTO Photos VALUES (1,'/home/justin/Pictures/dog1/picture1.png');





