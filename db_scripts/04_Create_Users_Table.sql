-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    "userId" integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    username character varying(60) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "isModerator" boolean NOT NULL DEFAULT false,
    CONSTRAINT users_pkey PRIMARY KEY ("userId")
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to recipebook_user;