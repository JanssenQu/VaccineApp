-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.

CREATE TABLE category
    (gname VARCHAR(50) NOT NULL,
    priority INTEGER,
    PRIMARY KEY (gname));

CREATE TABLE person
    (hin BIGINT NOT NULL,
    pname VARCHAR(30),
    gender VARCHAR(15),
    birthdate DATE,
    regdate DATE,
    gname VARCHAR(50) NOT NULL,
    phone BIGINT,
    pstreet VARCHAR(30),
    ppostal VARCHAR(15),
    pcity VARCHAR(30),
    PRIMARY KEY (hin),
    FOREIGN KEY (gname) REFERENCES category(gname));

CREATE TABLE vacclocation
    (lname VARCHAR(50) NOT NULL,
     lstreet VARCHAR(30),
     lpostal VARCHAR(15),
     lcity VARCHAR(30),
     PRIMARY KEY (lname));


CREATE TABLE hospital
    (lname VARCHAR(50) NOT NULL,
     PRIMARY KEY (lname),
     FOREIGN KEY (lname) REFERENCES vacclocation);

CREATE TABLE nurse
    (cnln BIGINT NOT NULL,
     nname VARCHAR(30) NOT NULL,
     lname VARCHAR(50) NOT NULL,
     PRIMARY KEY (cnln),
     FOREIGN KEY (lname) REFERENCES hospital);

CREATE TABLE vaccine
    (manufacturer VARCHAR(30) NOT NULL,
     numofdoses INTEGER,
     waitdays INTEGER,
     PRIMARY KEY (manufacturer));

CREATE TABLE batch
    (manufacturer VARCHAR(30) NOT NULL,
     batchnum INTEGER NOT NULL,
     manufacturerdate DATE,
     expirydate DATE,
     numofvials INTEGER,
     lname VARCHAR(50) NOT NULL,
     CHECK (manufacturerdate < expirydate),
     PRIMARY KEY (manufacturer, batchnum),
     FOREIGN KEY (manufacturer) REFERENCES vaccine,
     FOREIGN KEY (lname) REFERENCES vacclocation);

CREATE TABLE vial
    (manufacturer VARCHAR(30) NOT NULL,
     batchnum INTEGER NOT NULL,
     vialnum INTEGER NOT NULL,
     PRIMARY KEY (manufacturer, batchnum, vialnum),
     FOREIGN KEY (manufacturer, batchnum) REFERENCES batch);

CREATE TABLE slot
    (slotid INTEGER NOT NULL,
    vacctime TIME,
    vaccdate DATE,
    lname VARCHAR(50) NOT NULL,
    PRIMARY KEY (slotid),
    FOREIGN KEY (lname) REFERENCES vacclocation);

CREATE TABLE assigndate
    (slotid INTEGER NOT NULL,
     cnln BIGINT NOT NULL,
     PRIMARY KEY (slotid),
     FOREIGN KEY (slotid) REFERENCES slot,
     FOREIGN KEY (cnln) REFERENCES nurse);

CREATE TABLE personalloc
    (slotid INTEGER NOT NULL,
    hin BIGINT NOT NULL,
    aloocdate DATE NOT NULL,
    PRIMARY KEY (slotid),
    FOREIGN KEY (hin) REFERENCES person(hin),
    FOREIGN KEY (slotid) REFERENCES slot(slotid));

CREATE TABLE vaccslot
    (slotid INTEGER NOT NULL,
     manufacturer VARCHAR(30),
     batchnum INTEGER,
     vialnum INTEGER,
     PRIMARY KEY (slotid),
     FOREIGN KEY (slotid) REFERENCES slot,
     FOREIGN KEY (manufacturer, batchnum, vialnum) REFERENCES vial);

