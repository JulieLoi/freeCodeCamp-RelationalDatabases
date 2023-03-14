--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(23) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (16, 19, 636);
INSERT INTO public.games VALUES (17, 19, 760);
INSERT INTO public.games VALUES (18, 20, 877);
INSERT INTO public.games VALUES (19, 20, 243);
INSERT INTO public.games VALUES (20, 19, 434);
INSERT INTO public.games VALUES (21, 19, 168);
INSERT INTO public.games VALUES (22, 19, 677);
INSERT INTO public.games VALUES (23, 21, 898);
INSERT INTO public.games VALUES (24, 21, 813);
INSERT INTO public.games VALUES (25, 22, 8);
INSERT INTO public.games VALUES (26, 22, 7);
INSERT INTO public.games VALUES (27, 21, 173);
INSERT INTO public.games VALUES (28, 21, 834);
INSERT INTO public.games VALUES (29, 21, 102);
INSERT INTO public.games VALUES (30, 23, 9);
INSERT INTO public.games VALUES (31, 23, 13);
INSERT INTO public.games VALUES (32, 24, 75);
INSERT INTO public.games VALUES (33, 24, 443);
INSERT INTO public.games VALUES (34, 25, 263);
INSERT INTO public.games VALUES (35, 25, 471);
INSERT INTO public.games VALUES (36, 24, 484);
INSERT INTO public.games VALUES (37, 24, 619);
INSERT INTO public.games VALUES (38, 24, 117);
INSERT INTO public.games VALUES (39, 26, 171);
INSERT INTO public.games VALUES (40, 26, 564);
INSERT INTO public.games VALUES (41, 27, 507);
INSERT INTO public.games VALUES (42, 27, 883);
INSERT INTO public.games VALUES (43, 26, 689);
INSERT INTO public.games VALUES (44, 26, 524);
INSERT INTO public.games VALUES (45, 26, 93);
INSERT INTO public.games VALUES (46, 28, 102);
INSERT INTO public.games VALUES (47, 28, 760);
INSERT INTO public.games VALUES (48, 29, 460);
INSERT INTO public.games VALUES (49, 29, 777);
INSERT INTO public.games VALUES (50, 28, 496);
INSERT INTO public.games VALUES (51, 28, 615);
INSERT INTO public.games VALUES (52, 28, 837);
INSERT INTO public.games VALUES (53, 30, 581);
INSERT INTO public.games VALUES (54, 30, 673);
INSERT INTO public.games VALUES (55, 31, 717);
INSERT INTO public.games VALUES (56, 31, 45);
INSERT INTO public.games VALUES (57, 30, 735);
INSERT INTO public.games VALUES (58, 30, 744);
INSERT INTO public.games VALUES (59, 30, 584);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (19, 'user_1678825445974');
INSERT INTO public.users VALUES (20, 'user_1678825445973');
INSERT INTO public.users VALUES (21, 'user_1678825617690');
INSERT INTO public.users VALUES (22, 'user_1678825617689');
INSERT INTO public.users VALUES (23, 'user');
INSERT INTO public.users VALUES (24, 'user_1678826258288');
INSERT INTO public.users VALUES (25, 'user_1678826258287');
INSERT INTO public.users VALUES (26, 'user_1678826284482');
INSERT INTO public.users VALUES (27, 'user_1678826284481');
INSERT INTO public.users VALUES (28, 'user_1678826541714');
INSERT INTO public.users VALUES (29, 'user_1678826541713');
INSERT INTO public.users VALUES (30, 'user_1678826557401');
INSERT INTO public.users VALUES (31, 'user_1678826557400');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 59, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 31, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

