-- Role: recipebook_user
-- DROP ROLE recipebook_user;

CREATE ROLE recipebook_user WITH
  LOGIN
  SUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:IPMP82b8s67v5c04MX6kAw==$kBy1+04Y22D1/PN1BFgFgZUJoDbuviJYhKpAQq1d1mA=:Z+idRqFCzClYSB1C6pAkINPSZWoU4RTx7bXSCOnruOw=';