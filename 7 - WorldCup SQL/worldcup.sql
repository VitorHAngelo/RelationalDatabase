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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(15) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 380, 381, 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 382, 383, 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 381, 383, 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 380, 382, 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 381, 384, 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 383, 385, 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 382, 386, 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 380, 387, 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 383, 388, 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 385, 389, 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 382, 390, 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 386, 391, 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 381, 392, 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 384, 393, 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 387, 394, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 380, 395, 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final', 396, 395, 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 397, 386, 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 395, 397, 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 396, 386, 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 397, 398, 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 395, 382, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 386, 388, 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 396, 380, 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 386, 399, 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 388, 387, 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 380, 400, 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 396, 401, 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 397, 391, 2, 1);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 398, 402, 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 395, 389, 1, 0);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 382, 403, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (380, 'France');
INSERT INTO public.teams VALUES (381, 'Croatia');
INSERT INTO public.teams VALUES (382, 'Belgium');
INSERT INTO public.teams VALUES (383, 'England');
INSERT INTO public.teams VALUES (384, 'Russia');
INSERT INTO public.teams VALUES (385, 'Sweden');
INSERT INTO public.teams VALUES (386, 'Brazil');
INSERT INTO public.teams VALUES (387, 'Uruguay');
INSERT INTO public.teams VALUES (388, 'Colombia');
INSERT INTO public.teams VALUES (389, 'Switzerland');
INSERT INTO public.teams VALUES (390, 'Japan');
INSERT INTO public.teams VALUES (391, 'Mexico');
INSERT INTO public.teams VALUES (392, 'Denmark');
INSERT INTO public.teams VALUES (393, 'Spain');
INSERT INTO public.teams VALUES (394, 'Portugal');
INSERT INTO public.teams VALUES (395, 'Argentina');
INSERT INTO public.teams VALUES (396, 'Germany');
INSERT INTO public.teams VALUES (397, 'Netherlands');
INSERT INTO public.teams VALUES (398, 'Costa Rica');
INSERT INTO public.teams VALUES (399, 'Chile');
INSERT INTO public.teams VALUES (400, 'Nigeria');
INSERT INTO public.teams VALUES (401, 'Algeria');
INSERT INTO public.teams VALUES (402, 'Greece');
INSERT INTO public.teams VALUES (403, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 403, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games fk_opponent_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_winner_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

