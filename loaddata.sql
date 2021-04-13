-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.

INSERT INTO category VALUES('Health Care worker', 1);
INSERT INTO category VALUES('Elderly', 1);
INSERT INTO category VALUES('Immunologically Compromised', 1);
INSERT INTO category VALUES('Teacher', 2);
INSERT INTO category VALUES('Children below 10', 2);
INSERT INTO category VALUES('physical proximity to first priority', 2);
INSERT INTO category VALUES('Essential Service Worker', 3);
INSERT INTO category VALUES('physical proximity to second priority', 3);
INSERT INTO category VALUES('Other', 4);


INSERT INTO person VALUES(1609530315, 'John Cena', 'male', '1981-05-13', '2020-11-06', 'Other', 2668861494, '6 Merry Hill', 'H3N 0P4', 'Laval');
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
INSERT INTO slot VALUES (218923, '11:00:00', '2021-02-06', 'Chinese Community Centre');
INSERT INTO slot VALUES (915973, '9:00:00', '2021-03-20', 'Jewish General');
INSERT INTO slot VALUES (703755, '10:00:00', '2021-03-20', 'Jewish General');
INSERT INTO slot VALUES (401845, '11:00:00', '2021-03-20', 'Jewish General');
INSERT INTO slot VALUES (524954, '12:00:00', '2021-03-20', 'Jewish General');


INSERT INTO assigndate VALUES (953599, 5876614920);
INSERT INTO assigndate VALUES (832610, 5876614920);
INSERT INTO assigndate VALUES (915973, 9222845048);
INSERT INTO assigndate VALUES (703755, 9222845048);
INSERT INTO assigndate VALUES (401845, 2953530975);
INSERT INTO assigndate VALUES (524954, 2953530975);
INSERT INTO assigndate VALUES (101070, 4916061616);
INSERT INTO assigndate VALUES (183388, 4916061616);
INSERT INTO assigndate VALUES (218923, 4916061616);

INSERT INTO personalloc VALUES (953599, 1686786077, '2021-12-20');
INSERT INTO personalloc VALUES (832610, 0134125266, '2021-12-20');
INSERT INTO personalloc VALUES (101070, 4077628768, '2021-01-15');
INSERT INTO personalloc VALUES (183388, 3393921193, '2021-01-16');
INSERT INTO personalloc VALUES (218923, 3778211110, '2021-01-16');
INSERT INTO personalloc VALUES (915973, 0134125266, '2021-02-20');
INSERT INTO personalloc VALUES (703755, 1609530315, '2021-02-21');


INSERT INTO vaccslot VALUES (953599, 'Pfizer-BioNTech', 001, 096150);
INSERT INTO vaccslot VALUES (832610, 'Pfizer-BioNTech', 001, 123013);
INSERT INTO vaccslot VALUES (915973, 'Pfizer-BioNTech', 006, 838752);
INSERT INTO vaccslot VALUES (703755, 'Pfizer-BioNTech', 006, 433892);
INSERT INTO vaccslot VALUES (101070, 'Moderna', 006, 074123);
INSERT INTO vaccslot VALUES (183388, 'Johnson & Johnson', 008, 643753);
INSERT INTO vaccslot VALUES (218923, 'Johnson & Johnson', 008, 006720);
