DO $$ DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE'; 
    END LOOP;
END $$;
-- ABOVE CODE DELETES ALL TABLES FROM DB------------------



CREATE TABLE Person (
	ID integer PRIMARY KEY, 
	LoginID varchar UNIQUE ,
	Password varchar,
	ProfilePhotos varchar NULL,
	Name varchar NULL,
	PhoneNum varchar NULL,
	Email varchar NULL,
	Rating decimal NULL,
	RatingNum Integer NULL
	);

CREATE TABLE BreedID (
	ID integer PRIMARY KEY, 
	Description varchar,
	QuizAttr integer,
	Picture varchar
	);

CREATE TABLE Dog (
	ID integer PRIMARY KEY, 
	name varchar,
	Bio varchar,
	Age integer,
	SellerID integer REFERENCES Person(ID),
	Price money,
	BreedID integer REFERENCES BreedID(ID)
	);

CREATE TABLE Matches (
	PersonID integer REFERENCES Person(ID),
	DogID integer REFERENCES Dog(ID)
	);

CREATE TABLE Photos (
	DogID integer REFERENCES Dog(ID), 
	Photo varchar
	);

GRANT SELECT ON Person TO PUBLIC;
GRANT SELECT ON BreedID TO PUBLIC;
GRANT SELECT ON Matches TO PUBLIC;
GRANT SELECT ON Dog TO PUBLIC;
GRANT SELECT ON Photos TO PUBLIC;

INSERT INTO Person VALUES (1,'AndrewThomas','thisissecure','/home/justin/Pictures/dog1','Andrew Thomas','586-761-1141','Athomas@gmail.com',4.3,100);
INSERT INTO BreedID VALUES (1,'Dalminations are dogs that are black and white',200,'/home/justin/Pictures/dog1/picture1.png');
INSERT INTO Dog VALUES (1,'Dalminations','black and white',12,1,100.10,1);
INSERT INTO Matches VALUES (1,1);
INSERT INTO Photos VALUES (1,'/home/justin/Pictures/dog1/picture1.png');





