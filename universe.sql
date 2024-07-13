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
    name character varying(30) NOT NULL,
    type text NOT NULL,
    number_of_stars integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_black_hole boolean NOT NULL,
    age integer NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric(10,2) NOT NULL,
    has_atmosphere boolean NOT NULL,
    mass integer NOT NULL,
    distance_from_planet integer NOT NULL
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    type text NOT NULL,
    radius numeric(10,2) NOT NULL,
    has_life boolean NOT NULL,
    mass integer NOT NULL,
    orbital_period integer NOT NULL
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    typical_composition text NOT NULL,
    average_distance_from_sun numeric(10,2) NOT NULL,
    typical_mass integer NOT NULL,
    typical_radius integer NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    type text NOT NULL,
    mass numeric(10,2) NOT NULL,
    is_main_sequence boolean NOT NULL,
    temperature integer NOT NULL,
    luminosity integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 10000, 25000.00, true, 1360);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Spiral', 100000, 2537000.00, true, 1000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 40000, 3000000.00, false, 1220);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Cloud', 'Irregular', 30000, 163000.00, false, 1360);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 16000, 23000000.00, true, 1400);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 'Elliptical', 8000, 32000000.00, true, 1300);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 15, 3474.00, false, 7349, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 16, 22.00, false, 1065, 9378);
INSERT INTO public.moon VALUES (3, 'Deimos', 16, 12.00, false, 205, 23460);
INSERT INTO public.moon VALUES (4, 'Ganymede', 17, 5262.00, false, 14819000, 1070410);
INSERT INTO public.moon VALUES (5, 'Europa', 17, 3121.00, false, 4810000, 671034);
INSERT INTO public.moon VALUES (6, 'Callisto', 17, 4800.00, false, 10759000, 1882700);
INSERT INTO public.moon VALUES (7, 'Titan', 18, 5150.00, true, 13452000, 1221870);
INSERT INTO public.moon VALUES (8, 'Rhea', 18, 1527.00, false, 2300000, 527040);
INSERT INTO public.moon VALUES (9, 'Iapetus', 18, 1469.00, false, 1800000, 356080);
INSERT INTO public.moon VALUES (10, 'Miranda', 19, 235.00, false, 6590, 129390);
INSERT INTO public.moon VALUES (11, 'Triton', 20, 2706.00, true, 2140000, 354759);
INSERT INTO public.moon VALUES (12, 'Nereid', 20, 340.00, false, 27000000, 5513800);
INSERT INTO public.moon VALUES (13, 'Charon', 21, 1208.00, false, 1590000, 19571);
INSERT INTO public.moon VALUES (14, 'Proteus', 22, 436.00, false, 5020000, 117647);
INSERT INTO public.moon VALUES (15, 'Pandora', 23, 110.00, false, 136000, 141720);
INSERT INTO public.moon VALUES (16, 'Mimas', 23, 396.00, false, 379000, 185520);
INSERT INTO public.moon VALUES (17, 'Dione', 23, 1120.00, false, 1090000, 377400);
INSERT INTO public.moon VALUES (18, 'Ariel', 24, 1158.00, false, 1300000, 191020);
INSERT INTO public.moon VALUES (19, 'Umbriel', 24, 1169.00, false, 1160000, 266300);
INSERT INTO public.moon VALUES (20, 'Titania', 24, 1578.00, false, 3520000, 436300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 7, 'Terrestrial', 4879.00, false, 330, 88);
INSERT INTO public.planet VALUES (14, 'Venus', 7, 'Terrestrial', 12104.00, false, 4868, 225);
INSERT INTO public.planet VALUES (15, 'Earth', 7, 'Terrestrial', 12756.00, true, 5972, 365);
INSERT INTO public.planet VALUES (16, 'Mars', 7, 'Terrestrial', 6792.00, false, 641, 687);
INSERT INTO public.planet VALUES (17, 'Jupiter', 7, 'Gas Giant', 139820.00, false, 1898000, 4333);
INSERT INTO public.planet VALUES (18, 'Saturn', 7, 'Gas Giant', 116460.00, false, 568400, 10759);
INSERT INTO public.planet VALUES (19, 'Uranus', 7, 'Ice Giant', 50724.00, false, 86832, 30687);
INSERT INTO public.planet VALUES (20, 'Neptune', 7, 'Ice Giant', 49244.00, false, 102430, 60190);
INSERT INTO public.planet VALUES (21, 'Proxima b', 8, 'Terrestrial', 6000.00, false, 11000, 11);
INSERT INTO public.planet VALUES (22, 'Sirius b', 9, 'Gas Giant', 19920.00, false, 20000, 50);
INSERT INTO public.planet VALUES (23, 'Betelgeuse b', 10, 'Gas Giant', 37760.00, false, 1200000, 15);
INSERT INTO public.planet VALUES (24, 'Rigel b', 11, 'Gas Giant', 47960.00, false, 1300000, 30);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Rocky planets similar to Earth, Mercury, Venus, and Mars', 'Silicate rocks and metals', 1.00, 5972, 12756);
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'Large planets composed mostly of hydrogen and helium', 'Hydrogen, helium, and traces of other gases', 5.20, 1898000, 139820);
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Large planets composed mostly of water, ammonia, and methane', 'Water, ammonia, methane, and rocky core', 19.20, 102430, 49244);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 2, 'G-type', 1989000.00, true, 5778, 1);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 2, 'M-type', 12900.00, true, 3042, 0);
INSERT INTO public.star VALUES (9, 'Sirius', 3, 'A-type', 1989000.00, true, 9940, 25);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 3, 'M-type', 1989000.00, true, 3500, 126000);
INSERT INTO public.star VALUES (11, 'Rigel', 4, 'B-type', 1989000.00, true, 12130, 120000);
INSERT INTO public.star VALUES (12, 'Vega', 5, 'A-type', 1989000.00, true, 9602, 40);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

