-- Role: grp_rstudiopkgmgr_admin

DROP ROLE IF EXISTS grp_rstudiopkgmgr_admin;

CREATE ROLE grp_rstudiopkgmgr_admin WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT "kpmgrStudiodaadmin" TO "grp_rstudiopkgmgr_admin" WITH ADMIN OPTION;

--Creating USER and adding to the group:
-- User: usr_rspkgmgrdbadmin
DROP USER IF EXISTS usr_rspkgmgrdbadmin;

CREATE USER usr_rspkgmgrdbadmin WITH
  PASSWORD '__rstudio-postgresql-adminpassword__'
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT "grp_rstudiopkgmgr_admin" TO "usr_rspkgmgrdbadmin";

-- Create schema on the database. 
-- SCHEMA: rspkgmgr_schema


DROP SCHEMA IF EXISTS rspkgmgr_schema;

CREATE SCHEMA rspkgmgr_schema
    AUTHORIZATION "kpmgrStudiodaadmin";

GRANT ALL ON SCHEMA "rspkgmgr_schema" TO "kpmgrStudiodaadmin";

GRANT ALL ON SCHEMA rspkgmgr_schema TO grp_rstudiopkgmgr_admin;