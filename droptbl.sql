-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.

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
DROP TABLE assigndate;
DROP TABLE vaccslot;
