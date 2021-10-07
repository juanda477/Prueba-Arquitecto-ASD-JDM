--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg110+1)
-- Dumped by pg_dump version 13.3

-- Started on 2021-10-07 00:02:53

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO admin;

--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 24865)
-- Name: allocation; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.allocation (
    asset_id integer NOT NULL,
    allocated_type character(1) NOT NULL,
    area_by_city_id integer,
    person_id integer
);


ALTER TABLE public.allocation OWNER TO admin;

--
-- TOC entry 202 (class 1259 OID 24872)
-- Name: area; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.area (
    area_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.area OWNER TO admin;

--
-- TOC entry 201 (class 1259 OID 24870)
-- Name: area_area_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.area_area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_area_id_seq OWNER TO admin;

--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 201
-- Name: area_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.area_area_id_seq OWNED BY public.area.area_id;


--
-- TOC entry 204 (class 1259 OID 24880)
-- Name: area_by_city; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.area_by_city (
    area_by_city_id integer NOT NULL,
    active boolean NOT NULL,
    area_id integer NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.area_by_city OWNER TO admin;

--
-- TOC entry 203 (class 1259 OID 24878)
-- Name: area_by_city_area_by_city_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.area_by_city_area_by_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_by_city_area_by_city_id_seq OWNER TO admin;

--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 203
-- Name: area_by_city_area_by_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.area_by_city_area_by_city_id_seq OWNED BY public.area_by_city.area_by_city_id;


--
-- TOC entry 206 (class 1259 OID 24888)
-- Name: asset; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.asset (
    asset_id integer NOT NULL,
    color character varying(255),
    description character varying(255),
    height integer,
    inventory_internal_number bigint NOT NULL,
    leaving_date date,
    length integer,
    name character varying(255) NOT NULL,
    purchase_date date,
    purchase_value numeric(18,2),
    serial_number character varying(255) NOT NULL,
    weight numeric(19,2),
    width integer,
    status_id integer NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.asset OWNER TO admin;

--
-- TOC entry 205 (class 1259 OID 24886)
-- Name: asset_asset_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.asset_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_asset_id_seq OWNER TO admin;

--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 205
-- Name: asset_asset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.asset_asset_id_seq OWNED BY public.asset.asset_id;


--
-- TOC entry 208 (class 1259 OID 24899)
-- Name: asset_status; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.asset_status (
    status_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.asset_status OWNER TO admin;

--
-- TOC entry 207 (class 1259 OID 24897)
-- Name: asset_status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.asset_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_status_status_id_seq OWNER TO admin;

--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 207
-- Name: asset_status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.asset_status_status_id_seq OWNED BY public.asset_status.status_id;


--
-- TOC entry 210 (class 1259 OID 24907)
-- Name: asset_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.asset_type (
    type_id integer NOT NULL,
    active boolean,
    name character varying(255)
);


ALTER TABLE public.asset_type OWNER TO admin;

--
-- TOC entry 209 (class 1259 OID 24905)
-- Name: asset_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.asset_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asset_type_type_id_seq OWNER TO admin;

--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 209
-- Name: asset_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.asset_type_type_id_seq OWNED BY public.asset_type.type_id;


--
-- TOC entry 212 (class 1259 OID 24915)
-- Name: city; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.city (
    city_id integer NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.city OWNER TO admin;

--
-- TOC entry 211 (class 1259 OID 24913)
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO admin;

--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 211
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;


--
-- TOC entry 214 (class 1259 OID 24926)
-- Name: person; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    full_name character varying(255) NOT NULL
);


ALTER TABLE public.person OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 24924)
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_person_id_seq OWNER TO admin;

--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 213
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;


--
-- TOC entry 2895 (class 2604 OID 24875)
-- Name: area area_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.area ALTER COLUMN area_id SET DEFAULT nextval('public.area_area_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 24883)
-- Name: area_by_city area_by_city_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.area_by_city ALTER COLUMN area_by_city_id SET DEFAULT nextval('public.area_by_city_area_by_city_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 24891)
-- Name: asset asset_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset ALTER COLUMN asset_id SET DEFAULT nextval('public.asset_asset_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 24902)
-- Name: asset_status status_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset_status ALTER COLUMN status_id SET DEFAULT nextval('public.asset_status_status_id_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 24910)
-- Name: asset_type type_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset_type ALTER COLUMN type_id SET DEFAULT nextval('public.asset_type_type_id_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 24918)
-- Name: city city_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 24929)
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- TOC entry 3273 (class 0 OID 24865)
-- Dependencies: 200
-- Data for Name: allocation; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.allocation VALUES (2, 'P', NULL, 1);
INSERT INTO public.allocation VALUES (3, 'A', 4, NULL);


--
-- TOC entry 3275 (class 0 OID 24872)
-- Dependencies: 202
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.area VALUES (1, 'Contabilidad');
INSERT INTO public.area VALUES (2, 'Ventas');


--
-- TOC entry 3277 (class 0 OID 24880)
-- Dependencies: 204
-- Data for Name: area_by_city; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.area_by_city VALUES (1, true, 1, 1);
INSERT INTO public.area_by_city VALUES (2, true, 1, 2);
INSERT INTO public.area_by_city VALUES (3, true, 2, 1);
INSERT INTO public.area_by_city VALUES (4, true, 2, 2);


--
-- TOC entry 3279 (class 0 OID 24888)
-- Dependencies: 206
-- Data for Name: asset; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.asset VALUES (4, 'negro', NULL, 3, 2126, NULL, 22, 'Laptop', '2021-10-04', 2369000.00, 'ASD2126', 2000.00, 15, 1, 2);
INSERT INTO public.asset VALUES (1, 'negro', NULL, 2, 2123, NULL, 22, 'Monitor', '2021-10-04', 1050000.00, 'ASD2123', 900.00, 25, 1, 2);
INSERT INTO public.asset VALUES (3, 'gris', NULL, 98, 2125, NULL, 65, 'Silla', '2021-10-04', 650000.00, 'ASD2125', 20000.00, 75, 5, 1);
INSERT INTO public.asset VALUES (2, 'negro', NULL, 3, 2129, '2021-10-04', 22, 'Laptop', '2021-10-04', 2369000.00, 'ASD2124', 2000.00, 15, 5, 2);


--
-- TOC entry 3281 (class 0 OID 24899)
-- Dependencies: 208
-- Data for Name: asset_status; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.asset_status VALUES (1, 'activo');
INSERT INTO public.asset_status VALUES (2, 'dado de baja');
INSERT INTO public.asset_status VALUES (3, 'en reparación');
INSERT INTO public.asset_status VALUES (4, 'disponible');
INSERT INTO public.asset_status VALUES (5, 'asignado');


--
-- TOC entry 3283 (class 0 OID 24907)
-- Dependencies: 210
-- Data for Name: asset_type; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.asset_type VALUES (1, true, 'Muebles y enceres');
INSERT INTO public.asset_type VALUES (2, true, 'Tecnología');
INSERT INTO public.asset_type VALUES (3, true, 'Cafetería');


--
-- TOC entry 3285 (class 0 OID 24915)
-- Dependencies: 212
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.city VALUES (1, '01', 'Bogotá');
INSERT INTO public.city VALUES (2, '02', 'Medellin');


--
-- TOC entry 3287 (class 0 OID 24926)
-- Dependencies: 214
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.person VALUES (1, 'Adriana Lopera');
INSERT INTO public.person VALUES (2, 'Oswaldo Pineda');


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 201
-- Name: area_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.area_area_id_seq', 1, false);


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 203
-- Name: area_by_city_area_by_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.area_by_city_area_by_city_id_seq', 1, false);


--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 205
-- Name: asset_asset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.asset_asset_id_seq', 1, false);


--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 207
-- Name: asset_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.asset_status_status_id_seq', 1, false);


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 209
-- Name: asset_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.asset_type_type_id_seq', 1, false);


--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 211
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.city_city_id_seq', 1, false);


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 213
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.person_person_id_seq', 2, true);


--
-- TOC entry 2903 (class 2606 OID 24869)
-- Name: allocation allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.allocation
    ADD CONSTRAINT allocation_pkey PRIMARY KEY (asset_id);


--
-- TOC entry 2907 (class 2606 OID 24885)
-- Name: area_by_city area_by_city_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.area_by_city
    ADD CONSTRAINT area_by_city_pkey PRIMARY KEY (area_by_city_id);


--
-- TOC entry 2905 (class 2606 OID 24877)
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (area_id);


--
-- TOC entry 2911 (class 2606 OID 24896)
-- Name: asset asset_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (asset_id);


--
-- TOC entry 2913 (class 2606 OID 24904)
-- Name: asset_status asset_status_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset_status
    ADD CONSTRAINT asset_status_pkey PRIMARY KEY (status_id);


--
-- TOC entry 2915 (class 2606 OID 24912)
-- Name: asset_type asset_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset_type
    ADD CONSTRAINT asset_type_pkey PRIMARY KEY (type_id);


--
-- TOC entry 2917 (class 2606 OID 24923)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- TOC entry 2919 (class 2606 OID 24931)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- TOC entry 2909 (class 2606 OID 24933)
-- Name: area_by_city uk6kqutd277ij5yydoo1qkkul5p; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.area_by_city
    ADD CONSTRAINT uk6kqutd277ij5yydoo1qkkul5p UNIQUE (area_id, city_id);


--
-- TOC entry 2921 (class 2606 OID 24980)
-- Name: allocation allocation_area_by_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.allocation
    ADD CONSTRAINT allocation_area_by_city_id_fkey FOREIGN KEY (area_by_city_id) REFERENCES public.area_by_city(area_by_city_id) NOT VALID;


--
-- TOC entry 2920 (class 2606 OID 24975)
-- Name: allocation allocation_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.allocation
    ADD CONSTRAINT allocation_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.asset(asset_id) NOT VALID;

--
-- TOC entry 2922 (class 2606 OID 24985)
-- Name: allocation allocation_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.allocation
    ADD CONSTRAINT allocation_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(person_id) NOT VALID;

--
-- TOC entry 3031 (class 2606 OID 24990)
-- Name: area_by_city area_by_city_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.area_by_city
    ADD CONSTRAINT area_by_city_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.area(area_id) NOT VALID;


--
-- TOC entry 3032 (class 2606 OID 24995)
-- Name: area_by_city area_by_city_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.area_by_city
    ADD CONSTRAINT area_by_city_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(city_id) NOT VALID;


--
-- TOC entry 3105 (class 2606 OID 24970)
-- Name: asset asset_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT asset_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.asset_type(type_id) NOT VALID;


--
-- TOC entry 3117 (class 2606 OID 24959)
-- Name: asset fkp5qqdd7r8xl7ne3x2h6jw83pg; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.asset
    ADD CONSTRAINT fkp5qqdd7r8xl7ne3x2h6jw83pg FOREIGN KEY (status_id) REFERENCES public.asset_status(status_id);

-- Completed on 2021-10-07 00:02:54

--
-- PostgreSQL database dump complete
--

