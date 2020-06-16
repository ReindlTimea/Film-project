--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-06-16 15:13:06

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
-- TOC entry 202 (class 1259 OID 16878)
-- Name: favorite_film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_film (
    userid bigint NOT NULL,
    filmid bigint NOT NULL
);


ALTER TABLE public.favorite_film OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16883)
-- Name: favorite_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_genre (
    userid bigint NOT NULL,
    genreid bigint NOT NULL
);


ALTER TABLE public.favorite_genre OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16888)
-- Name: favorite_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_people (
    userid bigint NOT NULL,
    peopleid bigint NOT NULL
);


ALTER TABLE public.favorite_people OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16893)
-- Name: film_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_genre (
    filmid bigint NOT NULL,
    genreid bigint NOT NULL
);


ALTER TABLE public.film_genre OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16951)
-- Name: film_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16949)
-- Name: filmrate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filmrate_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filmrate_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16898)
-- Name: filmrates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmrates (
    film_rateid bigint NOT NULL,
    filmid bigint NOT NULL,
    film_rate_comment character varying(255),
    star_count integer NOT NULL,
    userid bigint NOT NULL
);


ALTER TABLE public.filmrates OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16903)
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    filmid bigint NOT NULL,
    film_description character varying(255),
    film_length_mins integer NOT NULL,
    film_original_title character varying(255) NOT NULL,
    film_release_date timestamp without time zone,
    film_sub_title character varying(255),
    film_type character varying(255) NOT NULL
);


ALTER TABLE public.films OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16953)
-- Name: genre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_seq OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16911)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genreid bigint NOT NULL,
    genre_name character varying(255) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16916)
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    peopleid bigint NOT NULL,
    biography character varying(255),
    born_country character varying(255),
    born_date timestamp without time zone,
    born_place character varying(255),
    gender integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.people OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16955)
-- Name: people_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.people_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16924)
-- Name: profession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profession (
    peopleid bigint NOT NULL,
    role_typeid bigint NOT NULL
);


ALTER TABLE public.profession OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16957)
-- Name: role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16929)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    roleid bigint NOT NULL,
    filmid bigint NOT NULL,
    peopleid bigint NOT NULL,
    role_name character varying(255),
    role_typeid bigint NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16959)
-- Name: roletype_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roletype_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roletype_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16934)
-- Name: roletypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roletypes (
    role_typeid bigint NOT NULL,
    role_type_name character varying(255) NOT NULL
);


ALTER TABLE public.roletypes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16961)
-- Name: user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16939)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid bigint NOT NULL,
    user_born_date date,
    user_email character varying(255) NOT NULL,
    user_gender integer,
    user_is_admin integer NOT NULL,
    user_last_login timestamp without time zone,
    user_name character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL,
    user_reg_date timestamp without time zone,
    user_status integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 16878)
-- Dependencies: 202
-- Data for Name: favorite_film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_film (userid, filmid) FROM stdin;
1	1
2	2
\.


--
-- TOC entry 2909 (class 0 OID 16883)
-- Dependencies: 203
-- Data for Name: favorite_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_genre (userid, genreid) FROM stdin;
1	1
2	17
\.


--
-- TOC entry 2910 (class 0 OID 16888)
-- Dependencies: 204
-- Data for Name: favorite_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_people (userid, peopleid) FROM stdin;
1	1
2	2
\.


--
-- TOC entry 2911 (class 0 OID 16893)
-- Dependencies: 205
-- Data for Name: film_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film_genre (filmid, genreid) FROM stdin;
1	1
2	17
3	22
4	17
\.


--
-- TOC entry 2912 (class 0 OID 16898)
-- Dependencies: 206
-- Data for Name: filmrates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filmrates (film_rateid, filmid, film_rate_comment, star_count, userid) FROM stdin;
1	1	Fantastic	10	1
2	4	Good	10	2
\.


--
-- TOC entry 2913 (class 0 OID 16903)
-- Dependencies: 207
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (filmid, film_description, film_length_mins, film_original_title, film_release_date, film_sub_title, film_type) FROM stdin;
1		115	Demolition Man	1993-10-07 01:00:00		movie
2		116	Back to the Future	1985-07-03 02:00:00		movie
3		84	Ace Ventura	1994-02-04 01:00:00	Pet Detective	movie
4		90	Star Trek: Voyager	1995-01-10 01:00:00	Caretaker	series
\.


--
-- TOC entry 2914 (class 0 OID 16911)
-- Dependencies: 208
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (genreid, genre_name) FROM stdin;
1	akció
2	animációs
3	bűnügyi
4	családi
5	dokumentum
6	dráma
7	életrajzi
8	erotikus
9	fantasy
10	háborús
11	horror
12	kaland
13	katasztrófa
14	koncert
15	misztikus
16	romantikus
17	sci-fi
18	természet
19	thriller
20	történelmi
21	tudományos
22	vígjáték
23	western
24	zenés
\.


--
-- TOC entry 2915 (class 0 OID 16916)
-- Dependencies: 209
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.people (peopleid, biography, born_country, born_date, born_place, gender, name) FROM stdin;
1		USA	1956-07-09 01:00:00	Concord, California	1	Tom Hanks
2		USA	1964-07-26 01:00:00	Arlington, Virginia	0	Sandra Bullock
3		USA	1937-06-01 01:00:00	Memphis, Tennessee	1	Morgan Freeman
4		Austria	1947-07-30 02:00:00	Thal, Styria	1	Arnold Schwarzenegger
5		USA	1946-07-06 02:00:00	New York City, New York	1	Sylvester Stallone
\.


--
-- TOC entry 2916 (class 0 OID 16924)
-- Dependencies: 210
-- Data for Name: profession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profession (peopleid, role_typeid) FROM stdin;
1	1
2	12
3	1
4	1
5	1
\.


--
-- TOC entry 2917 (class 0 OID 16929)
-- Dependencies: 211
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (roleid, filmid, peopleid, role_name, role_typeid) FROM stdin;
1	1	5	John Spartan	1
2	1	2	Lenina Huxley	12
\.


--
-- TOC entry 2918 (class 0 OID 16934)
-- Dependencies: 212
-- Data for Name: roletypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roletypes (role_typeid, role_type_name) FROM stdin;
1	színész
2	producer
3	rendező
4	forgatókönyvíró
5	zene
6	operatőr
7	vágó
8	jelmeztervező
9	díszlettervező
10	látványtervező
11	vezető producer
12	színésznő
\.


--
-- TOC entry 2919 (class 0 OID 16939)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, user_born_date, user_email, user_gender, user_is_admin, user_last_login, user_name, user_password, user_reg_date, user_status) FROM stdin;
1	1983-12-17	seven@email.com	0	1	2020-06-16 12:50:56.774	Seven	$2a$10$ZMUqBwy1Hg7V.5E0KWiK2.Boj8BrC2.ae5/2AHi9d78YCnnnO3MHG	2020-06-16 12:50:56.774	1
2	1980-07-22	species8472@email.com	1	0	2020-06-16 12:50:56.774	Species8472	$2a$10$wDOSzyY03wKUWTPYQq3fb.xCf9..wH3bieYu0cp7NkiqrWVHNiZaC	2020-06-16 12:50:56.774	1
\.


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 215
-- Name: film_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_seq', 51, true);


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 214
-- Name: filmrate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filmrate_seq', 51, true);


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 216
-- Name: genre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_seq', 51, true);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 217
-- Name: people_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.people_seq', 51, true);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 218
-- Name: role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_seq', 51, true);


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 219
-- Name: roletype_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roletype_seq', 51, true);


--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 220
-- Name: user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_seq', 51, true);


--
-- TOC entry 2747 (class 2606 OID 16882)
-- Name: favorite_film favorite_film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_film
    ADD CONSTRAINT favorite_film_pkey PRIMARY KEY (userid, filmid);


--
-- TOC entry 2749 (class 2606 OID 16887)
-- Name: favorite_genre favorite_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_genre
    ADD CONSTRAINT favorite_genre_pkey PRIMARY KEY (userid, genreid);


--
-- TOC entry 2751 (class 2606 OID 16892)
-- Name: favorite_people favorite_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_people
    ADD CONSTRAINT favorite_people_pkey PRIMARY KEY (userid, peopleid);


--
-- TOC entry 2753 (class 2606 OID 16897)
-- Name: film_genre film_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_pkey PRIMARY KEY (filmid, genreid);


--
-- TOC entry 2755 (class 2606 OID 16902)
-- Name: filmrates filmrates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filmrates
    ADD CONSTRAINT filmrates_pkey PRIMARY KEY (film_rateid);


--
-- TOC entry 2757 (class 2606 OID 16910)
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (filmid);


--
-- TOC entry 2759 (class 2606 OID 16915)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- TOC entry 2761 (class 2606 OID 16923)
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (peopleid);


--
-- TOC entry 2763 (class 2606 OID 16928)
-- Name: profession profession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profession
    ADD CONSTRAINT profession_pkey PRIMARY KEY (peopleid, role_typeid);


--
-- TOC entry 2765 (class 2606 OID 16933)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);


--
-- TOC entry 2767 (class 2606 OID 16938)
-- Name: roletypes roletypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roletypes
    ADD CONSTRAINT roletypes_pkey PRIMARY KEY (role_typeid);


--
-- TOC entry 2769 (class 2606 OID 16948)
-- Name: users uk_33uo7vet9c79ydfuwg1w848f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_33uo7vet9c79ydfuwg1w848f UNIQUE (user_email);


--
-- TOC entry 2771 (class 2606 OID 16946)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 2774 (class 2606 OID 16973)
-- Name: favorite_genre fk20roryphk0vdxnelry5mn0k8l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_genre
    ADD CONSTRAINT fk20roryphk0vdxnelry5mn0k8l FOREIGN KEY (genreid) REFERENCES public.genres(genreid);


--
-- TOC entry 2776 (class 2606 OID 16983)
-- Name: favorite_people fk2ec9k9s0yrl2db998rd10ehq7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_people
    ADD CONSTRAINT fk2ec9k9s0yrl2db998rd10ehq7 FOREIGN KEY (peopleid) REFERENCES public.people(peopleid);


--
-- TOC entry 2773 (class 2606 OID 16968)
-- Name: favorite_film fk43cnkm1olj28c1ow0vomfyi00; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_film
    ADD CONSTRAINT fk43cnkm1olj28c1ow0vomfyi00 FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 2772 (class 2606 OID 16963)
-- Name: favorite_film fk8hylol82cg6pd8ds2nk2rd6tn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_film
    ADD CONSTRAINT fk8hylol82cg6pd8ds2nk2rd6tn FOREIGN KEY (filmid) REFERENCES public.films(filmid);


--
-- TOC entry 2780 (class 2606 OID 17003)
-- Name: profession fk9m5ncvu99tghq7nxu7006ytgp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profession
    ADD CONSTRAINT fk9m5ncvu99tghq7nxu7006ytgp FOREIGN KEY (role_typeid) REFERENCES public.roletypes(role_typeid);


--
-- TOC entry 2779 (class 2606 OID 16998)
-- Name: film_genre fkfu1qr1g64n0hpgjjovjofb6u0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT fkfu1qr1g64n0hpgjjovjofb6u0 FOREIGN KEY (filmid) REFERENCES public.films(filmid);


--
-- TOC entry 2778 (class 2606 OID 16993)
-- Name: film_genre fkjf15mjxr4lm1cd6yloy11ggj1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT fkjf15mjxr4lm1cd6yloy11ggj1 FOREIGN KEY (genreid) REFERENCES public.genres(genreid);


--
-- TOC entry 2777 (class 2606 OID 16988)
-- Name: favorite_people fkq9pgggubd63xoqmq06s0bnwod; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_people
    ADD CONSTRAINT fkq9pgggubd63xoqmq06s0bnwod FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 2775 (class 2606 OID 16978)
-- Name: favorite_genre fks7crmoqilvnaqq8st150ajvmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_genre
    ADD CONSTRAINT fks7crmoqilvnaqq8st150ajvmt FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 2781 (class 2606 OID 17008)
-- Name: profession fkta97c64b1gedywqyon64ncgaf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profession
    ADD CONSTRAINT fkta97c64b1gedywqyon64ncgaf FOREIGN KEY (peopleid) REFERENCES public.people(peopleid);


-- Completed on 2020-06-16 15:13:07

--
-- PostgreSQL database dump complete
--

