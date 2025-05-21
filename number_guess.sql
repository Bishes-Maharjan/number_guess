--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO postgres;

\connect number_guess

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
-- Name: userdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userdata (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.userdata OWNER TO postgres;

--
-- Name: userdata_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.userdata ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.userdata_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: userdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (11, 'bishes', 1, 9);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (13, 'user_1747826974177', 2, 85);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (12, 'user_1747826974178', 5, 222);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (15, 'user_1747827139674', 2, 317);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (14, 'user_1747827139675', 5, 280);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (17, 'user_1747828106402', 2, 559);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (16, 'user_1747828106403', 5, 94);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (19, 'user_1747828201847', 2, 113);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (18, 'user_1747828201848', 5, 179);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (21, 'user_1747828226668', 2, 78);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (20, 'user_1747828226669', 5, 574);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (23, 'user_1747828268713', 2, 45);
INSERT INTO public.userdata OVERRIDING SYSTEM VALUE VALUES (22, 'user_1747828268714', 5, 235);


--
-- Name: userdata_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userdata_user_id_seq', 23, true);


--
-- Name: userdata userdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userdata
    ADD CONSTRAINT userdata_pkey PRIMARY KEY (user_id);


--
-- Name: userdata username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userdata
    ADD CONSTRAINT username_unique UNIQUE (username);


--
-- PostgreSQL database dump complete
--

