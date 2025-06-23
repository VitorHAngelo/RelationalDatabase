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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(30),
    discovery_year integer,
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_million_years integer,
    description text,
    galaxy_types character varying(40)
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
    name character varying(40),
    circunference_km numeric,
    has_been_visited boolean,
    planet_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    description text,
    circunference_km numeric,
    is_spherical boolean,
    has_life boolean,
    star_id integer
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
    name character varying(40),
    aproximate_circunference numeric,
    age_in_million_years integer,
    distance_from_earth integer,
    galaxy_id integer NOT NULL
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

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_id_seq'::regclass);


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

INSERT INTO public.black_hole VALUES (1, 'Cygnus X-1', 'Stellar-mass', 1964, 'One of the strongest X-ray sources seen from Earth, located in the constellation Cygnus.');
INSERT INTO public.black_hole VALUES (2, 'Sagittarius A*', 'Supermassive', 1974, 'The supermassive black hole at the center of the Milky Way galaxy.');
INSERT INTO public.black_hole VALUES (3, 'M87*', 'Supermassive', 2019, 'First black hole to have its event horizon imaged by the Event Horizon Telescope.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10000, 'A large spiral galaxy close to the Milky Way.', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13600, 'Our home galaxy, containing the Solar System.', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 12000, 'Known for its bright nucleus and large central bulge.', 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 15000, 'Famous for its well-defined spiral arms.', 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 500, 'A ring galaxy formed by a galactic collision.', 'Ring');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13000, 'A giant elliptical galaxy with a supermassive black hole.', 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Luna', 10921.0, true, 25);
INSERT INTO public.moon VALUES (3, 'Phobos', 22.2, false, 25);
INSERT INTO public.moon VALUES (4, 'Deimos', 12.4, false, 25);
INSERT INTO public.moon VALUES (5, 'Selene', 3500.5, false, 26);
INSERT INTO public.moon VALUES (6, 'Io', 3642.6, true, 27);
INSERT INTO public.moon VALUES (7, 'Europa', 3121.6, true, 27);
INSERT INTO public.moon VALUES (8, 'Ganymede', 5268.2, true, 28);
INSERT INTO public.moon VALUES (9, 'Callisto', 4820.6, false, 28);
INSERT INTO public.moon VALUES (10, 'Titan', 5150.3, true, 29);
INSERT INTO public.moon VALUES (11, 'Rhea', 1527.6, false, 29);
INSERT INTO public.moon VALUES (12, 'Tethys', 1062.2, false, 30);
INSERT INTO public.moon VALUES (13, 'Dione', 1123.8, false, 30);
INSERT INTO public.moon VALUES (14, 'Enceladus', 504.2, true, 31);
INSERT INTO public.moon VALUES (15, 'Mimas', 396.4, false, 31);
INSERT INTO public.moon VALUES (16, 'Miranda', 471.6, false, 32);
INSERT INTO public.moon VALUES (17, 'Ariel', 1158.8, false, 33);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1169.4, false, 34);
INSERT INTO public.moon VALUES (19, 'Oberon', 1523.1, false, 35);
INSERT INTO public.moon VALUES (20, 'Titania', 1577.8, false, 36);
INSERT INTO public.moon VALUES (21, 'Calypso', 30.2, false, 36);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Aurelia', 'A desert planet with strong winds and dust storms.', 40000.5, true, false, 2);
INSERT INTO public.planet VALUES (26, 'Veridion', 'A lush green planet covered in forests.', 50000.0, true, true, 2);
INSERT INTO public.planet VALUES (27, 'Terra', 'Blue planet with abundant water and life.', 40075.0, true, true, 3);
INSERT INTO public.planet VALUES (28, 'Ignis', 'Volcanically active planet with extreme temperatures.', 35000.0, true, false, 3);
INSERT INTO public.planet VALUES (29, 'Nuvoria', 'Gas giant with thick cloudy atmosphere.', 120000.0, true, false, 4);
INSERT INTO public.planet VALUES (30, 'Cryon', 'Icy planet far from its star, with frozen oceans.', 45000.0, true, false, 4);
INSERT INTO public.planet VALUES (31, 'Draconis', 'Rocky planet with jagged mountain ranges.', 37000.0, true, false, 5);
INSERT INTO public.planet VALUES (32, 'Oceana', 'Covered almost entirely by water.', 41000.0, true, true, 5);
INSERT INTO public.planet VALUES (33, 'Xerion', 'Dry and barren planet with no atmosphere.', 38000.0, true, false, 6);
INSERT INTO public.planet VALUES (34, 'Floralis', 'Planet with massive fields of alien vegetation.', 43000.0, true, true, 6);
INSERT INTO public.planet VALUES (35, 'Umbra', 'A planet locked in eternal night.', 39000.0, true, false, 7);
INSERT INTO public.planet VALUES (36, 'Luminis', 'Highly reflective planet with bright clouds.', 42000.0, true, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Zeta Prime', 3000000.50, 4500, 2500000, 1);
INSERT INTO public.star VALUES (3, 'Solaris', 4400000.00, 4600, 0, 2);
INSERT INTO public.star VALUES (4, 'Gama Lux', 5200000.75, 7000, 29000000, 3);
INSERT INTO public.star VALUES (5, 'Helios V', 3800000.20, 5500, 23000000, 4);
INSERT INTO public.star VALUES (6, 'Orion Alpha', 6000000.00, 8000, 50000000, 5);
INSERT INTO public.star VALUES (7, 'Vega Ultra', 4100000.90, 12000, 53000000, 6);


--
-- Name: black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 36, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: black_hole black_hole_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_id_key UNIQUE (black_hole_id);


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
-- Name: black_hole pk_black_hole_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT pk_black_hole_id PRIMARY KEY (black_hole_id);


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

