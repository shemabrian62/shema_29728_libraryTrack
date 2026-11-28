-- Student Name: Shema Brian
-- Student ID: 29728
-- Group: C
-- Project Name: Smart Library Book Borrowing and Fine Tracking System

-- Run these while connected to your PDB as shema_admin

CREATE TABLESPACE library_data 
  DATAFILE 'library_data_pdb.dbf' SIZE 100M 
  AUTOEXTEND ON NEXT 10M MAXSIZE 1G;

CREATE TABLESPACE library_idx 
  DATAFILE 'library_idx_pdb.dbf' SIZE 50M 
  AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

CREATE TEMPORARY TABLESPACE library_temp 
  TEMPFILE 'library_temp_pdb.dbf' SIZE 50M 
  AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

ALTER USER shema_admin DEFAULT TABLESPACE library_data;
ALTER USER shema_admin TEMPORARY TABLESPACE library_temp;
ALTER USER shema_admin QUOTA UNLIMITED ON library_data;
ALTER USER shema_admin QUOTA UNLIMITED ON library_idx;