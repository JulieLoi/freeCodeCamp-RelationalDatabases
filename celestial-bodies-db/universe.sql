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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    type character varying(20),
    constellation character varying(30),
    name character varying(50) NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(30),
    diameter_in_light_years integer,
    constellation character varying(30),
    group_membership character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    escape_velocity_in_km_per_second numeric(5,2),
    gravity_in_meters_per_seconds_squared numeric(5,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    planet_description text,
    gravity_in_meters_per_seconds_squared numeric(5,2),
    escape_velocity_in_km_per_second numeric(5,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    color character varying(20),
    mass_in_solar_mass numeric(5,2),
    temperature_in_kelvin character varying(20),
    is_spherical boolean NOT NULL,
    distance_from_earth_in_light_years numeric(5,2),
    diameter_in_light_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, '', 'Aquila', 'Manatee Nebula');
INSERT INTO public.black_hole VALUES (2, 'stellar', 'Aquila', 'SS 433');
INSERT INTO public.black_hole VALUES (3, 'stellar', 'Ara', 'V821 Ara');
INSERT INTO public.black_hole VALUES (4, 'stellar', 'Cygnus', 'Cygnus X-1');
INSERT INTO public.black_hole VALUES (5, 'Intermediate', 'Ophiuchus', 'Great Annihilator');
INSERT INTO public.black_hole VALUES (6, 'Intermediate', 'Pegusus', 'Messier 15');
INSERT INTO public.black_hole VALUES (7, 'supermassive', 'Sagittarius', 'Sagittarius A*');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 87400, 'Sagittarius', 'Local Group');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Irr', NULL, 'Canis Major', 'Local Group');
INSERT INTO public.galaxy VALUES (3, 'Ursa Major II Dwarf', 'dSph', 200, 'Ursa Major', 'Local Group');
INSERT INTO public.galaxy VALUES (4, 'Reticulum II', NULL, 378, 'Reticulum', 'Local Group');
INSERT INTO public.galaxy VALUES (5, 'Leo IV Dwarf', 'dSph', NULL, 'Leo', 'Local Group');
INSERT INTO public.galaxy VALUES (8, 'KKH 22', 'dSph', NULL, 'Camelopardalis', 'Maffei Group');
INSERT INTO public.galaxy VALUES (9, 'NGC 2976', 'SAc pec HII', NULL, 'Ursa Major', 'M81 Group');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 8, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 8, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Metis', 9, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Adrastea', 9, NULL, NULL);
INSERT INTO public.moon VALUES (6, '', 9, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Thebe', 9, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Io', 9, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Europa', 9, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Casllisto', 9, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Dia', 9, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Eupheme', 9, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Eurydome', 9, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Arche', 9, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Eukelade', 9, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Taygete', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Carme', 9, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Herse', 9, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Kalyke', 9, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Sponde', 9, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Megaclite', 9, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Cyliene', 9, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Mercury', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Venus', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Earth', 11, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Mars', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Jupiter', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Saturn', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Neptune', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Uranus', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Ceres', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Pluto', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'Haumea', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'Makemake', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, 'Eris', 11, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (23, 'fake1', 10, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (24, 'asdf', 2, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (25, 'a12a3s', 5, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (26, 'uwenh485', 1, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (27, '543asdf', 1, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (28, 'aasdf', 6, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (29, 'asdfwe', 7, false, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (30, 'nhgnghn', 10, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (31, 'ghnghdnf', 2, true, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (32, 'a12zxcv3s', 5, false, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'α Centauri C', 1, NULL, NULL, NULL, true, 4.24, NULL);
INSERT INTO public.star VALUES (2, 'Barnards Star', 1, NULL, NULL, NULL, true, 6.00, NULL);
INSERT INTO public.star VALUES (3, 'Wolf 359', 1, NULL, NULL, NULL, true, 7.90, NULL);
INSERT INTO public.star VALUES (4, 'Altair', 1, NULL, NULL, NULL, true, 16.73, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 1, NULL, NULL, NULL, true, 860.00, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 1, NULL, NULL, NULL, true, 25.00, NULL);
INSERT INTO public.star VALUES (7, 'Canopus', 1, NULL, NULL, NULL, true, 310.00, NULL);
INSERT INTO public.star VALUES (8, 'VV Cephei A', 1, NULL, NULL, NULL, true, NULL, 1475);
INSERT INTO public.star VALUES (9, 'VX Sagittarii', 1, NULL, NULL, NULL, true, NULL, 1355);
INSERT INTO public.star VALUES (10, 'AH Scorpii', 1, NULL, NULL, NULL, true, NULL, 1410);
INSERT INTO public.star VALUES (11, 'Sun', 1, NULL, NULL, NULL, true, NULL, NULL);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 7, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 9, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 32, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 11, true);


--
-- Name: black_hole black_hole__name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole__name_unique UNIQUE (name);


--
-- Name: black_hole black_hole_name_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_unique_constraint UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_unique_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique_constraint UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: star name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
