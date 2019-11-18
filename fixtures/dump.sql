--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-18 23:20:47 EET

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

--
-- TOC entry 197 (class 1259 OID 16388)
-- Name: posters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posters (
    id integer NOT NULL,
    date_ranges daterange,
    name character varying(256)
);


--
-- TOC entry 196 (class 1259 OID 16386)
-- Name: posters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 196
-- Name: posters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posters_id_seq OWNED BY public.posters.id;


--
-- TOC entry 3058 (class 2604 OID 16391)
-- Name: posters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posters ALTER COLUMN id SET DEFAULT nextval('public.posters_id_seq'::regclass);


--
-- TOC entry 3060 (class 2606 OID 16396)
-- Name: posters posters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posters
    ADD CONSTRAINT posters_pkey PRIMARY KEY (id);


-- Completed on 2019-11-18 23:20:47 EET

--
-- PostgreSQL database dump complete
--

