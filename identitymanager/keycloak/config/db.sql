oc port-forward postgres-cluster-0 5432:5432 -n postgres
psql -h 127.0.0.1 -U postgres
psql -h 127.0.0.1 -U amdocs -d keycloakdb
-- List users
SELECT usename AS role_name,
 CASE
  WHEN usesuper AND usecreatedb THEN
    CAST('superuser, create database' AS pg_catalog.text)
  WHEN usesuper THEN
    CAST('superuser' AS pg_catalog.text)
  WHEN usecreatedb THEN
    CAST('create database' AS pg_catalog.text)
  ELSE
    CAST('' AS pg_catalog.text)
 END role_attributes
FROM pg_catalog.pg_user
ORDER BY role_name desc;

CREATE USER bm2cadmin WITH ENCRYPTED PASSWORD 'admin';
CREATE DATABASE keycloakdb WITH OWNER "bm2cadmin" ENCODING "UTF8";
CREATE SCHEMA keycloak;
