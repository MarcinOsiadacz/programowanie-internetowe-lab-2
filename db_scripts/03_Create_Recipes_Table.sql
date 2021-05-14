-- Table: public.recipes

-- DROP TABLE public.recipes;

CREATE TABLE public.recipes
(
    name character varying(255) COLLATE pg_catalog."default",
    type character varying(100) COLLATE pg_catalog."default",
    difficulty "char",
    ingredients character varying(255) COLLATE pg_catalog."default",
    "preparationTime" character varying(5) COLLATE pg_catalog."default",
    description character varying(255) COLLATE pg_catalog."default",
    "photoUrl" character varying(255) COLLATE pg_catalog."default",
    "createdBy" character varying(100) COLLATE pg_catalog."default",
    id integer NOT NULL DEFAULT nextval('recipes_id_seq'::regclass),
    CONSTRAINT recipes_pk PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.recipes
    OWNER to recipebook_user;