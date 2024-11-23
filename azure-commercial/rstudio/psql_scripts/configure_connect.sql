-- Role: grp_rstudioconnect_admin

DROP ROLE IF EXISTS grp_rstudioconnect_admin ;

CREATE ROLE grp_rstudioconnect_admin WITH
  NOLOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT "kpmgrStudiodaadmin" TO grp_rstudioconnect_admin WITH ADMIN OPTION;

--Creating USER and adding to the group:
-- User: usr_rsconndbadmin
DROP USER IF EXISTS usr_rsconndbadmin;

CREATE USER usr_rsconndbadmin WITH
  PASSWORD '__rstudio-postgresql-adminpassword__'
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT "grp_rstudioconnect_admin" TO "usr_rsconndbadmin";

-- Create schema on the database.
-- SCHEMA: rsconnect_schema


DROP SCHEMA IF EXISTS rsconnect_schema ;

CREATE SCHEMA rsconnect_schema
    AUTHORIZATION "kpmgrStudiodaadmin";

GRANT ALL ON SCHEMA "rsconnect_schema" TO "kpmgrStudiodaadmin";

GRANT ALL ON SCHEMA "rsconnect_schema" TO "grp_rstudioconnect_admin" ;
