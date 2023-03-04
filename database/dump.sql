--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-04 10:09:55

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

DROP DATABASE hibernate_demo;
--
-- TOC entry 3335 (class 1262 OID 16531)
-- Name: hibernate_demo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hibernate_demo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Ukrainian_Ukraine.1251';


ALTER DATABASE hibernate_demo OWNER TO postgres;

\connect hibernate_demo

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
-- TOC entry 217 (class 1259 OID 16553)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id integer NOT NULL,
    person_id integer,
    name character varying(100) NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16552)
-- Name: item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.item ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16546)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    age integer,
    CONSTRAINT person_age_check CHECK ((age < 100))
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16545)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3329 (class 0 OID 16553)
-- Dependencies: 217
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item (id, person_id, name) VALUES (1, 1, 'Book');
INSERT INTO public.item (id, person_id, name) VALUES (2, 1, 'AirPods');
INSERT INTO public.item (id, person_id, name) VALUES (3, 2, 'Iphone');
INSERT INTO public.item (id, person_id, name) VALUES (4, 3, 'Kindle');
INSERT INTO public.item (id, person_id, name) VALUES (5, 3, 'TV');
INSERT INTO public.item (id, person_id, name) VALUES (6, 3, 'PlayStation');


--
-- TOC entry 3327 (class 0 OID 16546)
-- Dependencies: 215
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, name, age) VALUES (1, 'Tom', 35);
INSERT INTO public.person (id, name, age) VALUES (2, 'Bob', 43);
INSERT INTO public.person (id, name, age) VALUES (3, 'Jack', 19);


--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 216
-- Name: item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_id_seq', 6, true);


--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 214
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 3, true);


--
-- TOC entry 3182 (class 2606 OID 16557)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);


--
-- TOC entry 3180 (class 2606 OID 16551)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 16558)
-- Name: item item_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON DELETE SET NULL;


-- Completed on 2023-03-04 10:09:55

--
-- PostgreSQL database dump complete
--

