--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-24 20:19:31

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
-- TOC entry 217 (class 1259 OID 16418)
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    customer_id integer NOT NULL,
    c_name text NOT NULL,
    c_dob date NOT NULL,
    c_phone bigint,
    c_weight real NOT NULL,
    c_height real NOT NULL,
    c_gender character varying(6)
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE "Customer"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Customer" IS 'table to store details of customer';


--
-- TOC entry 216 (class 1259 OID 16417)
-- Name: Customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Customer_customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Customer_customer_id_seq" OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 216
-- Name: Customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Customer_customer_id_seq" OWNED BY public."Customer".customer_id;


--
-- TOC entry 219 (class 1259 OID 16433)
-- Name: Exercises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Exercises" (
    exercise_id integer NOT NULL,
    e_name text NOT NULL,
    e_difficulty character varying NOT NULL,
    e_muscles character varying[] NOT NULL
);


ALTER TABLE public."Exercises" OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "Exercises"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Exercises" IS 'table to store list of various exercises';


--
-- TOC entry 218 (class 1259 OID 16432)
-- Name: Exercises_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Exercises_exercise_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Exercises_exercise_id_seq" OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 218
-- Name: Exercises_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Exercises_exercise_id_seq" OWNED BY public."Exercises".exercise_id;


--
-- TOC entry 223 (class 1259 OID 16451)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    c_id integer NOT NULL,
    s_id integer NOT NULL,
    o_id integer NOT NULL,
    o_billingdate date NOT NULL,
    o_startdate date NOT NULL,
    o_enddate date NOT NULL,
    o_billamt money NOT NULL,
    CONSTRAINT check_billing_start_dates CHECK ((o_startdate >= o_billingdate)),
    CONSTRAINT check_start_end_dates CHECK ((o_startdate < o_enddate))
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE "Orders"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Orders" IS 'table to store the orders made by customers for a subscription plan';


--
-- TOC entry 222 (class 1259 OID 16450)
-- Name: Orders_o_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_o_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Orders_o_id_seq" OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 222
-- Name: Orders_o_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_o_id_seq" OWNED BY public."Orders".o_id;


--
-- TOC entry 221 (class 1259 OID 16442)
-- Name: Subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subscriptions" (
    s_id integer NOT NULL,
    s_name text NOT NULL,
    s_cost money NOT NULL,
    s_facilities character varying[],
    s_duration integer NOT NULL
);


ALTER TABLE public."Subscriptions" OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE "Subscriptions"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Subscriptions" IS 'table to store various subscription schemes
';


--
-- TOC entry 220 (class 1259 OID 16441)
-- Name: Subscriptions_s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Subscriptions_s_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Subscriptions_s_id_seq" OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 220
-- Name: Subscriptions_s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Subscriptions_s_id_seq" OWNED BY public."Subscriptions".s_id;


--
-- TOC entry 215 (class 1259 OID 16409)
-- Name: Trainer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Trainer" (
    trainer_id integer NOT NULL,
    t_name text NOT NULL,
    t_dob date NOT NULL,
    t_phone bigint,
    t_gender character varying(6) NOT NULL,
    t_salary double precision
);


ALTER TABLE public."Trainer" OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "Trainer"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Trainer" IS 'table to store details of trainers';


--
-- TOC entry 214 (class 1259 OID 16408)
-- Name: Trainer_trainer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Trainer_trainer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Trainer_trainer_id_seq" OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 214
-- Name: Trainer_trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Trainer_trainer_id_seq" OWNED BY public."Trainer".trainer_id;


--
-- TOC entry 3194 (class 2604 OID 16421)
-- Name: Customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer" ALTER COLUMN customer_id SET DEFAULT nextval('public."Customer_customer_id_seq"'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16436)
-- Name: Exercises exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exercises" ALTER COLUMN exercise_id SET DEFAULT nextval('public."Exercises_exercise_id_seq"'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16454)
-- Name: Orders o_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN o_id SET DEFAULT nextval('public."Orders_o_id_seq"'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16445)
-- Name: Subscriptions s_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscriptions" ALTER COLUMN s_id SET DEFAULT nextval('public."Subscriptions_s_id_seq"'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16412)
-- Name: Trainer trainer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trainer" ALTER COLUMN trainer_id SET DEFAULT nextval('public."Trainer_trainer_id_seq"'::regclass);


--
-- TOC entry 3357 (class 0 OID 16418)
-- Dependencies: 217
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" (customer_id, c_name, c_dob, c_phone, c_weight, c_height, c_gender) FROM stdin;
\.


--
-- TOC entry 3359 (class 0 OID 16433)
-- Dependencies: 219
-- Data for Name: Exercises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Exercises" (exercise_id, e_name, e_difficulty, e_muscles) FROM stdin;
\.


--
-- TOC entry 3363 (class 0 OID 16451)
-- Dependencies: 223
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" (c_id, s_id, o_id, o_billingdate, o_startdate, o_enddate, o_billamt) FROM stdin;
\.


--
-- TOC entry 3361 (class 0 OID 16442)
-- Dependencies: 221
-- Data for Name: Subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Subscriptions" (s_id, s_name, s_cost, s_facilities, s_duration) FROM stdin;
\.


--
-- TOC entry 3355 (class 0 OID 16409)
-- Dependencies: 215
-- Data for Name: Trainer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Trainer" (trainer_id, t_name, t_dob, t_phone, t_gender, t_salary) FROM stdin;
3	TTT	2001-06-24	8310802730	Female	11000
4	Bozo	2001-06-24	8310802730	Male	9000
\.


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 216
-- Name: Customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Customer_customer_id_seq"', 1, false);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 218
-- Name: Exercises_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Exercises_exercise_id_seq"', 1, false);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 222
-- Name: Orders_o_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_o_id_seq"', 1, false);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 220
-- Name: Subscriptions_s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Subscriptions_s_id_seq"', 1, false);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 214
-- Name: Trainer_trainer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Trainer_trainer_id_seq"', 5, true);


--
-- TOC entry 3203 (class 2606 OID 16425)
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (customer_id);


--
-- TOC entry 3205 (class 2606 OID 16440)
-- Name: Exercises Exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Exercises"
    ADD CONSTRAINT "Exercises_pkey" PRIMARY KEY (exercise_id);


--
-- TOC entry 3209 (class 2606 OID 16458)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (c_id, s_id, o_id);


--
-- TOC entry 3207 (class 2606 OID 16449)
-- Name: Subscriptions Subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subscriptions"
    ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (s_id);


--
-- TOC entry 3201 (class 2606 OID 16416)
-- Name: Trainer Trainer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trainer"
    ADD CONSTRAINT "Trainer_pkey" PRIMARY KEY (trainer_id);


--
-- TOC entry 3210 (class 2606 OID 16459)
-- Name: Orders cust_foreignKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "cust_foreignKey" FOREIGN KEY (c_id) REFERENCES public."Customer"(customer_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 3210
-- Name: CONSTRAINT "cust_foreignKey" ON "Orders"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "cust_foreignKey" ON public."Orders" IS 'references customer_id from customer table';


--
-- TOC entry 3211 (class 2606 OID 16464)
-- Name: Orders sub_foreignKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "sub_foreignKey" FOREIGN KEY (s_id) REFERENCES public."Subscriptions"(s_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 3211
-- Name: CONSTRAINT "sub_foreignKey" ON "Orders"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "sub_foreignKey" ON public."Orders" IS 'references subscription_id from subscription table';


-- Completed on 2023-07-24 20:19:31

--
-- PostgreSQL database dump complete
--

