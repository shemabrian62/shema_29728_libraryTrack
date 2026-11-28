-- Student Name: Shema Brian
-- Student ID: 29728
-- Group: C
-- Project Name: Smart Library Book Borrowing and Fine Tracking System

-- Verify PDB exists and is open
SELECT name, open_mode FROM v$pdbs WHERE name = 'GRPC_29728_SHEMA_LIB_DB';

-- Verify admin user's default and temporary tablespaces
SELECT username, default_tablespace, temporary_tablespace FROM user_users;

-- Verify each tablespace
SELECT tablespace_name, status, contents FROM user_tablespaces;