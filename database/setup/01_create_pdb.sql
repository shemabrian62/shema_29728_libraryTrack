-- Student Name: Shema Brian
-- Student ID: 29728
-- Group: C
-- Project Name: Smart Library Book Borrowing and Fine Tracking System

CREATE PLUGGABLE DATABASE grpc_29728_shema_lib_db
  ADMIN USER shema_admin IDENTIFIED BY shema
  ROLES = (DBA)
  FILE_NAME_CONVERT = ('pdbseed', 'grpc_29728_shema_lib_db');

-- The FORCE keyword allows this to run even if the PDB is already open.
ALTER PLUGGABLE DATABASE grpc_29728_shema_lib_db OPEN FORCE;
ALTER PLUGGABLE DATABASE grpc_29728_shema_lib_db SAVE STATE;