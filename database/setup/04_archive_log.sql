-- Student Name: Shema Brian
-- Student ID: 29728
-- Group: C
-- Project Name: Smart Library Book Borrowing and Fine Tracking System

-- Archive logging is a container (CDB) setting, not a PDB setting.
-- Enabling it requires SYSDBA access and a restart of the whole CDB.
-- It cannot be enabled for a single PDB.
-- On a local installation, one would run: SHUTDOWN IMMEDIATE; STARTUP MOUNT; ALTER DATABASE ARCHIVELOG; ALTER DATABASE OPEN;