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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    shape integer,
    mass numeric,
    distance numeric,
    life boolean,
    type integer,
    description text DEFAULT 'Unknown'::text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60),
    planet_id integer NOT NULL,
    life boolean,
    distance_from_earth numeric,
    mass numeric,
    description text DEFAULT 'Unknown'::text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60),
    star_id integer NOT NULL,
    life boolean,
    distance_from_earth numeric,
    mass numeric,
    description text DEFAULT 'Unknown'::text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    galaxy_id integer NOT NULL,
    type integer,
    mass numeric,
    planet_counts integer,
    distance_from_earth numeric,
    description text DEFAULT 'Unknown'::text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: sub_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sub_planet (
    fake_id integer NOT NULL,
    name character varying(60),
    info text,
    sub_planet_id integer NOT NULL
);


ALTER TABLE public.sub_planet OWNER TO freecodecamp;

--
-- Name: sub_planet_p_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sub_planet_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_planet_p_id_seq OWNER TO freecodecamp;

--
-- Name: sub_planet_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sub_planet_p_id_seq OWNED BY public.sub_planet.sub_planet_id;


--
-- Name: sub_planet_sub_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sub_planet_sub_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_planet_sub_planet_id_seq OWNER TO freecodecamp;

--
-- Name: sub_planet_sub_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sub_planet_sub_planet_id_seq OWNED BY public.sub_planet.fake_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sub_planet fake_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sub_planet ALTER COLUMN fake_id SET DEFAULT nextval('public.sub_planet_sub_planet_id_seq'::regclass);


--
-- Name: sub_planet sub_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sub_planet ALTER COLUMN sub_planet_id SET DEFAULT nextval('public.sub_planet_p_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy_1', 2, 470084.83, 52410.57, true, 4, 'Unknown');
INSERT INTO public.galaxy VALUES (2, 'Galaxy_2', 1, 974492.09, 95038.08, false, 5, 'Unknown');
INSERT INTO public.galaxy VALUES (3, 'Galaxy_3', 3, 635823.62, 81215.58, true, 2, 'Unknown');
INSERT INTO public.galaxy VALUES (4, 'Galaxy_4', 3, 512167.02, 17883.38, false, 4, 'Unknown');
INSERT INTO public.galaxy VALUES (5, 'Galaxy_5', 2, 410364.48, 91203.21, true, 3, 'Unknown');
INSERT INTO public.galaxy VALUES (6, 'Galaxy_6', 2, 410364.48, 91203.21, true, 3, 'Unknown');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon_1', 4, true, 193.89, 80.41, 'Unknown');
INSERT INTO public.moon VALUES (2, 'Moon_2', 3, false, 259.24, 99.65, 'Unknown');
INSERT INTO public.moon VALUES (3, 'Moon_3', 10, false, 626.75, 55.86, 'Unknown');
INSERT INTO public.moon VALUES (4, 'Moon_4', 5, false, 894.97, 23.32, 'Unknown');
INSERT INTO public.moon VALUES (5, 'Moon_5', 11, true, 749.14, 80.38, 'Unknown');
INSERT INTO public.moon VALUES (6, 'Moon_6', 14, true, 476.23, 55.13, 'Unknown');
INSERT INTO public.moon VALUES (7, 'Moon_7', 2, false, 563.12, 92.78, 'Unknown');
INSERT INTO public.moon VALUES (8, 'Moon_8', 1, true, 292.45, 23.56, 'Unknown');
INSERT INTO public.moon VALUES (9, 'Moon_9', 6, false, 823.45, 89.56, 'Unknown');
INSERT INTO public.moon VALUES (10, 'Moon_10', 13, true, 124.35, 10.56, 'Unknown');
INSERT INTO public.moon VALUES (11, 'Moon_11', 12, false, 432.87, 47.56, 'Unknown');
INSERT INTO public.moon VALUES (12, 'Moon_12', 7, true, 521.23, 98.43, 'Unknown');
INSERT INTO public.moon VALUES (13, 'Moon_13', 9, true, 614.52, 54.67, 'Unknown');
INSERT INTO public.moon VALUES (14, 'Moon_14', 8, false, 312.67, 88.97, 'Unknown');
INSERT INTO public.moon VALUES (15, 'Moon_15', 15, true, 752.43, 95.64, 'Unknown');
INSERT INTO public.moon VALUES (16, 'Moon_16', 4, false, 813.45, 90.12, 'Unknown');
INSERT INTO public.moon VALUES (17, 'Moon_17', 11, true, 572.34, 65.12, 'Unknown');
INSERT INTO public.moon VALUES (18, 'Moon_18', 2, false, 243.67, 53.76, 'Unknown');
INSERT INTO public.moon VALUES (19, 'Moon_19', 8, true, 186.45, 75.23, 'Unknown');
INSERT INTO public.moon VALUES (20, 'Moon_20', 13, false, 935.12, 66.42, 'Unknown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet_1', 5, true, 486.56, 451.45, 'Unknown');
INSERT INTO public.planet VALUES (2, 'Planet_2', 7, false, 274.93, 340.52, 'Unknown');
INSERT INTO public.planet VALUES (3, 'Planet_3', 2, false, 712.53, 425.23, 'Unknown');
INSERT INTO public.planet VALUES (4, 'Planet_4', 1, true, 239.12, 149.78, 'Unknown');
INSERT INTO public.planet VALUES (5, 'Planet_5', 10, true, 332.68, 221.45, 'Unknown');
INSERT INTO public.planet VALUES (6, 'Planet_6', 6, false, 912.83, 374.56, 'Unknown');
INSERT INTO public.planet VALUES (7, 'Planet_7', 9, true, 159.46, 597.83, 'Unknown');
INSERT INTO public.planet VALUES (8, 'Planet_8', 4, true, 739.44, 189.56, 'Unknown');
INSERT INTO public.planet VALUES (9, 'Planet_9', 7, false, 423.12, 319.78, 'Unknown');
INSERT INTO public.planet VALUES (10, 'Planet_10', 8, true, 614.32, 823.45, 'Unknown');
INSERT INTO public.planet VALUES (11, 'Planet_11', 3, true, 896.73, 523.41, 'Unknown');
INSERT INTO public.planet VALUES (12, 'Planet_12', 6, false, 345.12, 347.56, 'Unknown');
INSERT INTO public.planet VALUES (13, 'Planet_13', 4, true, 623.78, 482.34, 'Unknown');
INSERT INTO public.planet VALUES (14, 'Planet_14', 9, false, 573.42, 645.23, 'Unknown');
INSERT INTO public.planet VALUES (15, 'Planet_15', 8, true, 715.34, 923.56, 'Unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star_1', 1, 5, 88372.15, 5, 1213.57, 'Unknown');
INSERT INTO public.star VALUES (2, 'Star_2', 2, 3, 9243.53, 2, 904.73, 'Unknown');
INSERT INTO public.star VALUES (3, 'Star_3', 3, 2, 51983.34, 3, 4322.68, 'Unknown');
INSERT INTO public.star VALUES (4, 'Star_4', 1, 1, 23241.71, 4, 1442.21, 'Unknown');
INSERT INTO public.star VALUES (5, 'Star_5', 5, 4, 65347.89, 1, 273.45, 'Unknown');
INSERT INTO public.star VALUES (6, 'Star_6', 4, 5, 15182.12, 3, 3821.66, 'Unknown');
INSERT INTO public.star VALUES (7, 'Star_7', 3, 3, 45089.55, 2, 1623.73, 'Unknown');
INSERT INTO public.star VALUES (8, 'Star_8', 5, 2, 23713.23, 4, 5423.29, 'Unknown');
INSERT INTO public.star VALUES (9, 'Star_9', 2, 1, 12493.33, 1, 742.35, 'Unknown');
INSERT INTO public.star VALUES (10, 'Star_10', 4, 2, 61029.97, 3, 1423.45, 'Unknown');


--
-- Data for Name: sub_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sub_planet VALUES (1, 'Sub_Planet_1', NULL, 1);
INSERT INTO public.sub_planet VALUES (2, 'Sub_Planet_2', NULL, 2);
INSERT INTO public.sub_planet VALUES (3, 'Sub_Planet_3', NULL, 3);
INSERT INTO public.sub_planet VALUES (4, NULL, 'This is the information for sub planet A', 4);
INSERT INTO public.sub_planet VALUES (5, NULL, 'This is the information for sub B', 5);
INSERT INTO public.sub_planet VALUES (6, NULL, 'This is the information for sub C', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: sub_planet_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sub_planet_p_id_seq', 6, true);


--
-- Name: sub_planet_sub_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sub_planet_sub_planet_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: sub_planet sub_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sub_planet
    ADD CONSTRAINT sub_planet_pkey PRIMARY KEY (sub_planet_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: sub_planet unique_sub_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sub_planet
    ADD CONSTRAINT unique_sub_planet_id UNIQUE (fake_id);


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

