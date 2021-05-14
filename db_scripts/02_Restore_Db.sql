--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-14 22:24:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3003 (class 1262 OID 16395)
-- Name: recipebook_db; Type: DATABASE; Schema: -; Owner: recipebook_user
--

CREATE DATABASE recipebook_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Polish_Poland.1250';


ALTER DATABASE recipebook_db OWNER TO recipebook_user;

\connect recipebook_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 16456)
-- Name: recipes; Type: TABLE; Schema: public; Owner: recipebook_user
--

CREATE TABLE public.recipes (
    name character varying(255),
    type character varying(100),
    difficulty "char",
    ingredients character varying(255),
    "preparationTime" character varying(5),
    description character varying(255),
    "photoUrl" character varying(255),
    "createdBy" character varying(100),
    id integer NOT NULL
);


ALTER TABLE public.recipes OWNER TO recipebook_user;

--
-- TOC entry 201 (class 1259 OID 16464)
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: recipebook_user
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO recipebook_user;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 201
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recipebook_user
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- TOC entry 203 (class 1259 OID 16489)
-- Name: users; Type: TABLE; Schema: public; Owner: recipebook_user
--

CREATE TABLE public.users (
    "userId" integer NOT NULL,
    username character varying(60) NOT NULL,
    password character varying(255) NOT NULL,
    "isModerator" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO recipebook_user;

--
-- TOC entry 202 (class 1259 OID 16487)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: recipebook_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO recipebook_user;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: recipebook_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users."userId";


--
-- TOC entry 2857 (class 2604 OID 16466)
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: recipebook_user
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 16492)
-- Name: users userId; Type: DEFAULT; Schema: public; Owner: recipebook_user
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2994 (class 0 OID 16456)
-- Dependencies: 200
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: recipebook_user
--

INSERT INTO public.recipes (name, type, difficulty, ingredients, "preparationTime", description, "photoUrl", "createdBy", id) VALUES ('Test Recipe 3', 'vege', '5', 'Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.', '30', 'Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.', '/media/1621019709213_wege_burgery_z_pieczonym_baklazanem_01_0.jpg', 'user', 47);
INSERT INTO public.recipes (name, type, difficulty, ingredients, "preparationTime", description, "photoUrl", "createdBy", id) VALUES ('Test Recipe 4', 'snack', '2', 'Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.', '15', 'Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.Sagittis orci a scelerisque purus semper eget duis.', '/media/1621019838051_tekst2ajakprzygotowacdeskeserow.jpg', 'moderator', 48);
INSERT INTO public.recipes (name, type, difficulty, ingredients, "preparationTime", description, "photoUrl", "createdBy", id) VALUES ('Test Recipe 5', 'vege', '3', 'Test Ingredients', '15', 'Test Description', '/media/1621022633897_indeks.jpg', 'user', 49);
INSERT INTO public.recipes (name, type, difficulty, ingredients, "preparationTime", description, "photoUrl", "createdBy", id) VALUES ('Test Recipe 1', 'vege', '3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', '60', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', '/media/default.jpg', 'tester', 45);
INSERT INTO public.recipes (name, type, difficulty, ingredients, "preparationTime", description, "photoUrl", "createdBy", id) VALUES ('Test Recipe 2', 'christmas', '4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', '45', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', '/media/1621019582708_indeks.jpg', 'tester', 46);


--
-- TOC entry 2997 (class 0 OID 16489)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: recipebook_user
--

INSERT INTO public.users ("userId", username, password, "isModerator") VALUES (1, 'user', 'user', false);
INSERT INTO public.users ("userId", username, password, "isModerator") VALUES (2, 'moderator', 'moderator', true);
INSERT INTO public.users ("userId", username, password, "isModerator") VALUES (3, 'tester', 'tester', true);

--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 201
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recipebook_user
--

SELECT pg_catalog.setval('public.recipes_id_seq', 49, true);


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: recipebook_user
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- TOC entry 2861 (class 2606 OID 16474)
-- Name: recipes recipes_pk; Type: CONSTRAINT; Schema: public; Owner: recipebook_user
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pk PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 16495)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: recipebook_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");


-- Completed on 2021-05-14 22:24:46

--
-- PostgreSQL database dump complete
--

