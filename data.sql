DROP TABLE category;
DROP TABLE person;
DROP TABLE slot;
DROP TABLE personalloc;
DROP TABLE vacclocation;
DROP TABLE vaccine;
DROP TABLE batch;
DROP TABLE vial;
DROP TABLE hospital;
DROP TABLE nurse;
DROP TABLE assignednurse;
DROP TABLE vaccslot;

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

CREATE TABLE assignednurse
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

INSERT INTO category VALUES('Health Care worker', 1);
INSERT INTO category VALUES('Elderly', 1);
INSERT INTO category VALUES('Immunologically Compromised', 1);
INSERT INTO category VALUES('Teacher', 2);
INSERT INTO category VALUES('Children below 10', 2);
INSERT INTO category VALUES('physical proximity to first priority', 2);
INSERT INTO category VALUES('Essential Service Worker', 3);
INSERT INTO category VALUES('physical proximity to second priority', 3);
INSERT INTO category VALUES('Other', 4);


INSERT INTO person VALUES(1609530315, 'John Cena', 'Male', '1981-05-13', '2020-11-06', 'Other', 2668861494, '6 Merry Hill', 'H3N 0P4', 'Laval');
INSERT INTO person VALUES(0134125266,'Gilda Mossbee','Male','1967-12-16','2020-11-05','Health Care worker',5384302852,'44458 Scoville Drive','P3Y 2G4','Longueuil');
INSERT INTO person VALUES(8010845418,'Nikki Jacquemot','female','1972-06-07','2020-11-17','physical proximity to first priority',1219017789,'127 Shasta Place','K1M 2H5','Montreal');
INSERT INTO person VALUES(1339916835,'Carmine Sheerman','female','1963-12-20','2020-12-28','Essential Service Worker',4231524022,'77 Loomis Terrace','G0H 2X1','Saint-Jean-sur-Richelieu');
INSERT INTO person VALUES(5023282562,'Gerrard Grafton-Herbert','Male','2001-02-05','2020-12-02','Other',1028364089,'129 3rd Alley','J1A 3A3','Montreal');
INSERT INTO person VALUES(9635651589,'Chantal Lamartine','Male','1989-09-23','2020-11-26','Health Care worker',5961651822,'8137 Caliangt Circle','G5T 1E0','Montreal');
INSERT INTO person VALUES(1686786077,'Allsun Gentiry','Female','1949-11-10','2021-02-06','Elderly',9836841752,'171 Nevada Crossing','J8M 1H1','Saint-Jean-sur-Richelieu');
INSERT INTO person VALUES(3393921193,'Darcy Vasilenko','Polygender','1979-06-02','2021-02-20','Teacher',3475352954,'51 Farragut Terrace','H7Y 3G8','Montreal');
INSERT INTO person VALUES(4077628768,'Jane Doe','Female','1982-05-26','2020-12-21','Health Care worker',9625146573,'451 Artisan Pass','G5J 0H9','Laval');
INSERT INTO person VALUES(3778211110,'Krishna Essex','Polygender','1994-02-22','2021-02-10','Essential Service Worker',7295829355,'093 Kipling Pass','J8M 0E4','Montreal');


INSERT INTO vacclocation VALUES('Jewish General', '5866 Hayes Road', 'G8K 3G5', 'Montreal');
INSERT INTO vacclocation VALUES('Chinese Community Centre', '29381 Jackson Avenue', 'H4C 3P0', 'Montreal');
INSERT INTO vacclocation VALUES('Saint-Jean-sur-Richelieu College', '11 Farwell Avenue', 'J6E 2W0', 'Saint-Jean-sur-Richelieu');
INSERT INTO vacclocation VALUES('CF Carrefour Laval', '3003 Boulevard le Carrefour', 'H7T 1C7', 'Laval');
INSERT INTO vacclocation VALUES('Pierre-Boucher', '1333 Boulevard Jacques-Cartier', 'J4M 2A5', 'Longueuil');
INSERT INTO vacclocation VALUES('Centre De Sejour', '350 Boulevard Samson', 'H7X 1J4', 'Laval');
INSERT INTO vacclocation VALUES('General Hospital', '1650 Avenue Cedar', 'H3G 1A4', 'Montreal');
INSERT INTO vacclocation VALUES('Michel Hospital', '1200 Chemin du Tremblay', 'J4N 1A2', 'Longueuil');

INSERT INTO hospital VALUES('Jewish General');
INSERT INTO hospital VALUES('Pierre-Boucher');
INSERT INTO hospital VALUES('Centre De Sejour');
INSERT INTO hospital VALUES('General Hospital');
INSERT INTO hospital VALUES('Michel Hospital');

INSERT INTO nurse VALUES (5928602693,'Chelsie Chaffyn','Centre De Sejour');
INSERT INTO nurse VALUES (4916061616,'Lily Bolesma','General Hospital');
INSERT INTO nurse VALUES (6041352608,'Karlen Blackaby','Michel Hospital');
INSERT INTO nurse VALUES (9035929438,'Gustie Hollyar','Michel Hospital');
INSERT INTO nurse VALUES (7650867382,'Balduin Dassindale','Pierre-Boucher');
INSERT INTO nurse VALUES (9222845048,'Salmon Bussen','Jewish General');
INSERT INTO nurse VALUES (4813384129,'Karel Rude','Pierre-Boucher');
INSERT INTO nurse VALUES (9982875302,'Ramona Pioch','Michel Hospital');
INSERT INTO nurse VALUES (2953530975,'Corrinne Weich','Jewish General');
INSERT INTO nurse VALUES (8784768045,'Salomone MacKnight','Pierre-Boucher');
INSERT INTO nurse VALUES (7038771981,'Iain Merwede','Centre De Sejour');
INSERT INTO nurse VALUES (3803395682,'Robinett Wieprecht','Michel Hospital');
INSERT INTO nurse VALUES (5876614920,'Aaren Clempton','Jewish General');

INSERT INTO vaccine VALUES ('Moderna', 2, 25);
INSERT INTO vaccine VALUES ('Pfizer-BioNTech', 2, 20);
INSERT INTO vaccine VALUES ('Johnson & Johnson', 3, 30);
INSERT INTO vaccine VALUES ('Novavax', 3, 14);
INSERT INTO vaccine VALUES ('AstraZeneca', 2, 18);

INSERT INTO batch VALUES ('Moderna', 008, '2020-12-18', '2021-01-18', 400, 'Michel Hospital');
INSERT INTO batch VALUES ('Johnson & Johnson', 008, '2020-1-07', '2021-02-07', 100, 'Chinese Community Centre');
INSERT INTO batch VALUES ('Pfizer-BioNTech', 001, '2021-01-20', '2021-02-20', 150, 'Jewish General');
INSERT INTO batch VALUES ('Moderna', 006, '2021-01-25', '2021-02-25', 360, 'Chinese Community Centre');
INSERT INTO batch VALUES ('Pfizer-BioNTech', 006, '2021-03-01', '2021-04-01', 200, 'Jewish General');


INSERT INTO vial VALUES ('Moderna', 006, 074123);
INSERT INTO vial VALUES ('Moderna', 006, 438761);
INSERT INTO vial VALUES ('Moderna', 006, 906730);
INSERT INTO vial VALUES ('Pfizer-BioNTech', 006, 838752);
INSERT INTO vial VALUES ('Pfizer-BioNTech', 006, 433892);
INSERT INTO vial VALUES ('Pfizer-BioNTech', 006, 672201);
INSERT INTO vial VALUES ('Pfizer-BioNTech', 001, 123013);
INSERT INTO vial VALUES ('Pfizer-BioNTech', 001, 096150);
INSERT INTO vial VALUES ('Pfizer-BioNTech', 001, 020887);
INSERT INTO vial VALUES ('Moderna', 008, 113092);
INSERT INTO vial VALUES ('Moderna', 008, 842675);
INSERT INTO vial VALUES ('Moderna', 008, 236912);
INSERT INTO vial VALUES ('Johnson & Johnson', 008, 643753);
INSERT INTO vial VALUES ('Johnson & Johnson', 008, 006720);

INSERT INTO slot VALUES (953599, '9:00:00', '2021-01-07', 'Jewish General');
INSERT INTO slot VALUES (832610, '10:00:00', '2021-01-07', 'Jewish General');
INSERT INTO slot VALUES (101070, '9:00:00', '2021-02-06', 'Chinese Community Centre');
INSERT INTO slot VALUES (183388, '10:00:00', '2021-02-06', 'Chinese Community Centre');
INSERT INTO slot VALUES (915973, '9:00:00', '2021-03-20', 'Jewish General');
INSERT INTO slot VALUES (703755, '10:00:00', '2021-03-20', 'Jewish General');
INSERT INTO slot VALUES (401845, '11:00:00', '2021-03-20', 'Jewish General');
INSERT INTO slot VALUES (524954, '12:00:00', '2021-03-20', 'Jewish General');
INSERT INTO slot VALUES (123456, '13:00:00', '2021-03-20', 'Jewish General');


INSERT INTO assignednurse VALUES (953599, 5876614920);
INSERT INTO assignednurse VALUES (832610, 5876614920);
INSERT INTO assignednurse VALUES (915973, 9222845048);
INSERT INTO assignednurse VALUES (703755, 9222845048);
INSERT INTO assignednurse VALUES (101070, 4916061616);
INSERT INTO assignednurse VALUES (183388, 4916061616);

INSERT INTO personalloc VALUES (953599, 1686786077, '2021-12-20');
INSERT INTO personalloc VALUES (832610, 0134125266, '2021-12-20');
INSERT INTO personalloc VALUES (101070, 4077628768, '2021-01-15');
INSERT INTO personalloc VALUES (183388, 3393921193, '2021-01-16');
INSERT INTO personalloc VALUES (915973, 0134125266, '2021-02-20');
INSERT INTO personalloc VALUES (703755, 1609530315, '2021-02-21');


INSERT INTO vaccslot VALUES (953599, 'Pfizer-BioNTech', 001, 096150);
INSERT INTO vaccslot VALUES (832610, 'Pfizer-BioNTech', 001, 123013);
INSERT INTO vaccslot VALUES (915973, 'Pfizer-BioNTech', 006, 838752);
INSERT INTO vaccslot VALUES (703755, 'Pfizer-BioNTech', 006, 433892);
INSERT INTO vaccslot VALUES (101070, 'Moderna', 006, 074123);
INSERT INTO vaccslot VALUES (183388, 'Johnson & Johnson', 008, 643753);


SELECT slot.slotid FROM slot EXCEPT SELECT slot.slotid FROM slot JOIN personalloc ON slot.slotid = personalloc.slotid;

SELECT batch.expirydate
FROM vaccslot JOIN batch
ON vaccslot.manufacturer = batch.manufacturer AND vaccslot.batchnum = batch.batchnum
WHERE slotid = (SELECT personalloc.slotid
    FROM person JOIN personalloc
    ON person.hin = personalloc.hin
    JOIN slot
    ON personalloc.slotid = slot.slotid
    WHERE person.pname = 'Jane Doe' AND vaccdate = '2021-02-06');

SELECT COUNT(vacclocation.lcity) as vaccinmtl
FROM vaccslot JOIN slot
ON vaccslot.slotid = slot.slotid
JOIN vacclocation
ON slot.lname = vacclocation.lname
WHERE vacclocation.lcity = 'Montreal' AND slot.vaccdate = '2021-02-06';

SELECT person.pname, person.phone, person.hin
FROM person JOIN personalloc
ON person.hin = personalloc.hin
JOIN slot
ON personalloc.slotid = slot.slotid
JOIN vaccslot
ON slot.slotid = vaccslot.slotid
WHERE vaccslot.manufacturer = 'Pfizer-BioNTech' AND slot.vaccdate < '2021-02-01' AND person.hin NOT IN
(SELECT personalloc.hin
FROM personalloc JOIN slot
ON slot.slotid = personalloc.slotid
WHERE slot.vaccdate >= '2021-02-01')
ORDER BY person.pname;

SELECT person.gname, COUNT( DISTINCT person.hin) as numpergroup
FROM person JOIN category
ON person.gname = category.gname
JOIN personalloc
ON person.hin = personalloc.hin
JOIN vaccslot
ON personalloc.slotid = vaccslot.slotid
GROUP BY person.gname;


DROP VIEW mtlnurses;


CREATE VIEW mtlnurses (cnln, name, hospital, postal, street)
as SELECT cnln, nname, vacclocation.lname, vacclocation.lpostal, vacclocation.lstreet
FROM nurse JOIN vacclocation
ON nurse.lname = vacclocation.lname
WHERE vacclocation.lcity = 'Montreal';

SELECT *
FROM mtlnurses;

SELECT *
FROM mtlnurses
WHERE hospital = 'Jewish General';

INSERT INTO mtlnurses VALUES (3828023649,'Candide Lillie','General Hospital', 'H3G 1A4', '1650 Avenue Cedar');

INSERT INTO batch VALUES ('Moderna', 001, '2021-01-30', '2021-01-25', 200, 'Chinese Community Centre');

SELECT *
FROM person
WHERE EXISTS (SELECT * FROM person WHERE hin = 1234);

SELECT * FROM person;

SELECT numofdoses
FROM personalloc JOIN slot
ON personalloc.slotid = slot.slotid
JOIN vaccslot
ON slot.slotid = vaccslot.slotid
JOIN vaccine
ON vaccslot.manufacturer = vaccine.manufacturer
WHERE hin = 134125266;

SELECT *
FROM personalloc;


SELECT DISTINCT (manufacturer)
FROM personalloc JOIN vaccslot
ON personalloc.slotid = vaccslot.slotid
WHERE hin = (SELECT hin
             FROM personalloc
             WHERE slotid = 832610);

SELECT * FROM vaccslot;

SELECT * FROM assignednurse;

SELECT *
FROM person
WHERE hin = 123456789;

SELECT person.hin, personalloc.slotid FROM person LEFT OUTER JOIN personalloc ON person.hin = personalloc.hin WHERE pname = 'Gerrard Grafton-Herbert';

SELECT * FROM person JOIN personalloc ON person.hin = personalloc.hin WHERE slotid =401845

SELECT person.hin, person.pname, slotid FROM person LEFT OUTER JOIN personalloc ON person.hin = personalloc.hin WHERE pname = 'Gerrard Grafton-Herbert' OR pname = 'Krishna Essex'

SELECT person.hin, person.pname, vaccslot.manufacturer, vaccslot.batchnum, vaccslot.vialnum FROM person JOIN personalloc ON person.hin = personalloc.hin JOIN vaccslot ON personalloc.slotid = vaccslot.slotid WHERE person.hin = 0134125266;

SELECT personalloc.hin, personalloc.slotid, assignednurse.cnln, vaccslot.manufacturer, vaccslot.batchnum, vaccslot.vialnum FROM personalloc JOIN vaccslot ON personalloc.slotid = vaccslot.slotid JOIN assignednurse ON  vaccslot.slotid = assignednurse.slotid WHERE vaccslot.slotid = 524954

SELECT person.hin, person.pname, vaccslot.manufacturer FROM person JOIN personalloc ON person.hin = personalloc.hin JOIN vaccslot on personalloc.slotid = vaccslot.slotid WHERE person.hin = 1686786077

SELECT hin, vaccdate
FROM slot JOIN personalloc ON slot.slotid = personalloc.slotid
WHERE hin IN (SELECT hin FROM vaccslot JOIN personalloc ON vaccslot.slotid = personalloc.slotid)
GROUP BY hin
GROUP BY vaccdate;

SELECT hin, vaccdate
FROM slot JOIN personalloc ON slot.slotid = personalloc.slotid JOIN vaccslot ON slot.slotid = vaccslot.slotid
GROUP BY hin, vaccdate

SELECT DISTINCT hin FROM vaccslot JOIN personalloc ON vaccslot.slotid = personalloc.slotid

SELECT vaccdate, COUNT(hin) as vaccinations
FROM slot JOIN personalloc
ON slot.slotid = personalloc.slotid
WHERE (vaccdate, hin) IN (SELECT min(vaccdate), hin
    FROM slot JOIN personalloc
    ON slot.slotid = personalloc.slotid
    WHERE hin IN (SELECT hin FROM vaccslot JOIN personalloc ON vaccslot.slotid = personalloc.slotid)
    GROUP BY hin)
GROUP BY vaccdate;

