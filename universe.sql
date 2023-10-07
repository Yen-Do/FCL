--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    galaxy_type character varying(255),
    distance_from_earth numeric(10,2)
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(255) NOT NULL,
    gal integer
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_id integer,
    moon_type character varying(255)
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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    star_id integer,
    planet_type character varying(255)
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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', false, 'Spiral', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', false, 'Spiral', 2.54);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', false, 'Spiral', 2.72);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unusual spiral galaxy', false, 'Spiral', 28.70);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Massive elliptical galaxy', false, 'Elliptical', 53.50);
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 'Barred spiral galaxy', false, 'Spiral', 61.90);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (105, 'Moon 63', 'Another moon', false, true, 7, 63, 'Natural Satellite');
INSERT INTO public.moon VALUES (106, 'Moon 64', 'Another moon', false, true, 7, 64, 'Natural Satellite');
INSERT INTO public.moon VALUES (107, 'Moon 65', 'Another moon', false, true, 7, 65, 'Natural Satellite');
INSERT INTO public.moon VALUES (108, 'Moon 106', 'Another moon', false, true, 7, 106, 'Natural Satellite');
INSERT INTO public.moon VALUES (109, 'Moon 107', 'Another moon', false, true, 7, 107, 'Natural Satellite');
INSERT INTO public.moon VALUES (110, 'Moon 108', 'Another moon', false, true, 7, 108, 'Natural Satellite');
INSERT INTO public.moon VALUES (111, 'Moon 109', 'Another moon', false, true, 7, 109, 'Natural Satellite');
INSERT INTO public.moon VALUES (129, 'Moon 110', 'Another moon', false, true, 9, 110, 'Natural Satellite');
INSERT INTO public.moon VALUES (130, 'Moon 111', 'Another moon', false, true, 9, 111, 'Natural Satellite');
INSERT INTO public.moon VALUES (131, 'Moon 112', 'Another moon', false, true, 9, 112, 'Natural Satellite');
INSERT INTO public.moon VALUES (132, 'Moon 113', 'Another moon', false, true, 9, 113, 'Natural Satellite');
INSERT INTO public.moon VALUES (133, 'Moon 114', 'Another moon', false, true, 9, 114, 'Natural Satellite');
INSERT INTO public.moon VALUES (134, 'Moon 115', 'Another moon', false, true, 9, 115, 'Natural Satellite');
INSERT INTO public.moon VALUES (135, 'Moon 116', 'Another moon', false, true, 9, 116, 'Natural Satellite');
INSERT INTO public.moon VALUES (136, 'Moon 117', 'Another moon', false, true, 9, 117, 'Natural Satellite');
INSERT INTO public.moon VALUES (137, 'Moon 118', 'Another moon', false, true, 9, 118, 'Natural Satellite');
INSERT INTO public.moon VALUES (138, 'Moon 119', 'Another moon', false, true, 9, 119, 'Natural Satellite');
INSERT INTO public.moon VALUES (139, 'Moon 120', 'Another moon', false, true, 10, 120, 'Natural Satellite');
INSERT INTO public.moon VALUES (140, 'Moon 121', 'Another moon', false, true, 10, 121, 'Natural Satellite');
INSERT INTO public.moon VALUES (141, 'Moon 122', 'Another moon', false, true, 10, 122, 'Natural Satellite');
INSERT INTO public.moon VALUES (142, 'Moon 123', 'Another moon', false, true, 10, 123, 'Natural Satellite');
INSERT INTO public.moon VALUES (143, 'Moon 124', 'Another moon', false, true, 10, 124, 'Natural Satellite');
INSERT INTO public.moon VALUES (144, 'Moon 125', 'Another moon', false, true, 10, 125, 'Natural Satellite');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (63, 'Mars 3', 'Another planet in our solar system', false, true, 5, 2, 'Terrestrial');
INSERT INTO public.planet VALUES (64, 'Jupiter 3', 'Another planet in our solar system', false, true, 5, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (65, 'Saturn 3', 'Another planet in our solar system', false, true, 5, 4, 'Gas Giant');
INSERT INTO public.planet VALUES (66, 'Uranus 2', 'Another planet in our solar system', false, true, 5, 5, 'Ice Giant');
INSERT INTO public.planet VALUES (67, 'Neptune 2', 'Another planet in our solar system', false, true, 5, 6, 'Ice Giant');
INSERT INTO public.planet VALUES (68, 'Mars 4', 'Another planet in our solar system', false, true, 5, 2, 'Terrestrial');
INSERT INTO public.planet VALUES (69, 'Jupiter 4', 'Another planet in our solar system', false, true, 5, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (70, 'Saturn 4', 'Another planet in our solar system', false, true, 5, 4, 'Gas Giant');
INSERT INTO public.planet VALUES (71, 'Uranus 3', 'Another planet in our solar system', false, true, 5, 5, 'Ice Giant');
INSERT INTO public.planet VALUES (72, 'Neptune 3', 'Another planet in our solar system', false, true, 5, 6, 'Ice Giant');
INSERT INTO public.planet VALUES (37, 'Pluto 2', 'Updated description', true, true, 5, 1, 'Dwarf Planet');
INSERT INTO public.planet VALUES (101, 'Venus 12', 'Another planet in our solar system', false, true, 5, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (102, 'Jupiter 12', 'Another planet in our solar system', false, true, 5, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (103, 'Saturn 13', 'Another planet in our solar system', false, true, 5, 4, 'Gas Giant');
INSERT INTO public.planet VALUES (104, 'Uranus 12', 'Another planet in our solar system', false, true, 5, 5, 'Ice Giant');
INSERT INTO public.planet VALUES (105, 'Neptune 12', 'Another planet in our solar system', false, true, 5, 6, 'Ice Giant');
INSERT INTO public.planet VALUES (106, 'Venus 13', 'Another planet in our solar system', false, true, 5, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (107, 'Mars 14', 'Another planet in our solar system', false, true, 5, 2, 'Terrestrial');
INSERT INTO public.planet VALUES (108, 'Jupiter 14', 'Another planet in our solar system', false, true, 5, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (109, 'Saturn 14', 'Another planet in our solar system', false, true, 5, 4, 'Gas Giant');
INSERT INTO public.planet VALUES (110, 'Planet 110', 'Another planet', false, true, 9, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (111, 'Planet 111', 'Another planet', false, true, 9, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (125, 'Planet 125', 'Another planet', false, true, 10, 4, 'Ice Giant');
INSERT INTO public.planet VALUES (112, 'Planet 112', 'Another planet', false, true, 9, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (113, 'Planet 113', 'Another planet', false, true, 9, 4, 'Ice Giant');
INSERT INTO public.planet VALUES (114, 'Planet 114', 'Another planet', false, true, 9, 5, 'Ice Giant');
INSERT INTO public.planet VALUES (115, 'Planet 115', 'Another planet', false, true, 9, 6, 'Terrestrial');
INSERT INTO public.planet VALUES (116, 'Planet 116', 'Another planet', false, true, 9, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (117, 'Planet 117', 'Another planet', false, true, 9, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (118, 'Planet 118', 'Another planet', false, true, 9, 3, 'Gas Giant');
INSERT INTO public.planet VALUES (119, 'Planet 119', 'Another planet', false, true, 9, 4, 'Ice Giant');
INSERT INTO public.planet VALUES (120, 'Planet 120', 'Another planet', false, true, 10, 5, 'Ice Giant');
INSERT INTO public.planet VALUES (121, 'Planet 121', 'Another planet', false, true, 10, 6, 'Terrestrial');
INSERT INTO public.planet VALUES (122, 'Planet 122', 'Another planet', false, true, 10, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (123, 'Planet 123', 'Another planet', false, true, 10, 2, 'Gas Giant');
INSERT INTO public.planet VALUES (124, 'Planet 124', 'Another planet', false, true, 10, 3, 'Gas Giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', false, true, 5, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', false, true, 200, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Closest star system', false, true, 7, 2);
INSERT INTO public.star VALUES (4, 'Vega', 'Famous northern star', false, true, 455, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red supergiant star', false, true, 8, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 'North Star', false, true, 46, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 144, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 109, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

