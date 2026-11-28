-- Student Name: Shema Brian
-- Student ID: 29728
-- Group: C
-- Project Name: Smart Library Book Borrowing and Fine Tracking System

-- The admin user was created during the PDB creation in script 01.
-- This script ensures the user has the DBA role inside the PDB.
ALTER SESSION SET CONTAINER = grpc_29728_shema_lib_db;
GRANT DBA TO shema_admin;