-- Database: recipebook_db

-- DROP DATABASE recipebook_db;

CREATE DATABASE recipebook_db
    WITH 
    OWNER = recipebook_user
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;