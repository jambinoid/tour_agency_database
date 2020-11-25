--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id smallint NOT NULL,
    phone character varying(18) NOT NULL,
    email character varying(320),
    city character varying(58) NOT NULL,
    country character varying(56) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: entities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities (
    customer_id smallint NOT NULL,
    short_name character varying(255) NOT NULL,
    organisation_form character varying(255) NOT NULL,
    official_name character varying(255) NOT NULL,
    tour_agency boolean NOT NULL,
    CONSTRAINT entities_customer_id_check CHECK ((customer_id <= 0))
);


ALTER TABLE public.entities OWNER TO postgres;

--
-- Name: individuals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individuals (
    customer_id smallint NOT NULL,
    first_name character varying(255) NOT NULL,
    patronymic_name character varying(255),
    second_name character varying(255) NOT NULL,
    age smallint NOT NULL,
    CONSTRAINT individuals_age_check CHECK ((age >= 18))
);


ALTER TABLE public.individuals OWNER TO postgres;

--
-- Name: individuals_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.individuals_customer_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individuals_customer_id_seq OWNER TO postgres;

--
-- Name: individuals_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.individuals_customer_id_seq OWNED BY public.individuals.customer_id;


--
-- Name: managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managers (
    id smallint NOT NULL,
    first_name character varying(255) NOT NULL,
    patronymic_name character varying(255),
    second_name character varying(255) NOT NULL
);


ALTER TABLE public.managers OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.managers_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.managers_id_seq OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.managers_id_seq OWNED BY public.managers.id;


--
-- Name: order_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_list (
    order_id integer NOT NULL,
    service_id integer NOT NULL,
    service_total smallint NOT NULL
);


ALTER TABLE public.order_list OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_date date NOT NULL,
    customer_id smallint NOT NULL,
    manager_id smallint NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    tour_object_id smallint NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    unit_of_measurements character varying(20) NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: tour_objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tour_objects (
    id smallint NOT NULL,
    short_name character varying(255) NOT NULL,
    organisation_form character varying(255) NOT NULL,
    official_name character varying(255) NOT NULL,
    kind character varying(20) NOT NULL,
    phone character varying(18) NOT NULL,
    email character varying(320),
    city character varying(58) NOT NULL,
    country character varying(56) NOT NULL
);


ALTER TABLE public.tour_objects OWNER TO postgres;

--
-- Name: tour_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tour_objects_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tour_objects_id_seq OWNER TO postgres;

--
-- Name: tour_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tour_objects_id_seq OWNED BY public.tour_objects.id;


--
-- Name: individuals customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuals ALTER COLUMN customer_id SET DEFAULT nextval('public.individuals_customer_id_seq'::regclass);


--
-- Name: managers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers ALTER COLUMN id SET DEFAULT nextval('public.managers_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: tour_objects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_objects ALTER COLUMN id SET DEFAULT nextval('public.tour_objects_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, phone, email, city, country) FROM stdin;
1	79100001122	solovieva@randommail.ru	Тула	Россия
2	79100002233	serega_wot@randommail.ru	Москва	Россия
0	79615555555	discovery.tours@randommail.ru	Санкт-Петербург	Россия
3	79103156567	ivanov_ii@randommail.ru	Казань	Россия
4	79108864646	lyudkevich@randommail.ru	Тула	Россия
-1	3759023213362	tractor.zavod@randommail.com	Минск	Беларусь
5	79990033222	\N	Москва	Россия
-2	79990444444	litseum1973@randommail.ru	Санкт-Петербург	Россия
6	79330032131	jalelov_adil@randommail.com	Астана	Казахстан
-3	79102221122	raduga_travel@randommail.ru	Тула	Россия
\.


--
-- Data for Name: entities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities (customer_id, short_name, organisation_form, official_name, tour_agency) FROM stdin;
0	Дискавери	OOO	Дискавери	t
-1	Белорусский Тракторный Завод	OAO	Белорусский Тракторный Завод	f
-2	Лицей №1973	ГБОУ	Лицей №1973 Центрального района Санкт-Петербурга	f
-3	Турагенство Радуга	ИП	Соловьев Петр Петрович	t
\.


--
-- Data for Name: individuals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.individuals (customer_id, first_name, patronymic_name, second_name, age) FROM stdin;
1	Марина	Петровна	Соловьева	45
2	Cергей	Сергеевич	Буше	57
3	Иван	Иванович	Иванов	18
4	Сергей	Вячеславович	Людкевич	33
5	Марина	Александовна	Иванова	68
6	Адиль	Скриптонитович	Жалелов	90
\.


--
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.managers (id, first_name, patronymic_name, second_name) FROM stdin;
1	Татьяна	Александровна	Людкевич
2	Александра	Петровна	Мухина
3	Мария	Сергеевна	Карпатян
4	Антон	Николевич	Малышко
5	Александр	Александрович	Александров
6	Михаил	Александрович	Сомин
7	Александра	Олеговна	Сомина
8	Наталья	Петровна	Лашхидзе
9	Максим	Иванович	Иванов
10	Артем	Артемович	Артемов
\.


--
-- Data for Name: order_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_list (order_id, service_id, service_total) FROM stdin;
1	1	1
2	1	1
3	1	10
3	2	1
3	6	10
3	7	10
3	5	10
4	6	3
4	7	3
5	6	2
6	2	5
6	3	7
6	10	7
6	12	1
7	3	1
7	4	2
8	11	1
8	3	2
8	4	23
8	5	25
8	6	25
8	7	25
9	12	1
9	8	4
10	13	1
10	14	1
10	15	2
11	5	4
11	12	1
11	3	2
11	4	2
11	8	4
11	9	4
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, order_date, customer_id, manager_id) FROM stdin;
1	2019-06-10	1	1
2	2019-06-10	2	1
3	2019-06-23	0	2
4	2019-07-11	3	7
5	2019-07-14	4	8
6	2019-07-21	-1	9
7	2019-07-29	5	10
8	2019-08-01	-2	3
9	2019-08-01	6	4
10	2019-08-10	1	1
11	2019-08-28	-3	5
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, tour_object_id, name, price, unit_of_measurements) FROM stdin;
1	1	Экскурсия для взрослого	200	Штука
2	2	Транспортное обслуживание по городу	1300	Час
3	3	Экскурсия для взрослого	400	Штука
4	3	Экскурсия для ребенка	0	Штука
5	4	Обед	350	Штука
6	5	Входной билет	200	Штука
7	5	Экскурсия	300	Штука
8	6	Входной билет в усадьбу	500	Штука
9	6	Входной билет в дом	500	Штука
10	7	Ужин	450	Штука
11	8	Перевозка СПб-Тула-СПб	5000	Штука
12	9	Услуги гида	4000	День
13	10	Стандартный номер на двоих	2000	Ночь
14	10	Уборка	1600	Штука
15	10	Завтрак	500	Штука
\.


--
-- Data for Name: tour_objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tour_objects (id, short_name, organisation_form, official_name, kind, phone, email, city, country) FROM stdin;
1	Музей "Тульский Кремль"	ГУК ТО	Объединение "Историко-краеведческий и художественный музей"	Музей	74872774934	guk.kremlmuzey@tularegion.ru	Тула	Россия
2	Пассажирские перевозки	ООО	Пассажирские перевозки	Транспорт	74872800055	transport_tula@fakemail.ru	Тула	Россия
3	Тульский музей изобразительных искусств	ГУК ТО	Объединение "Историко-краеведческий и художественный музей"	Музей	74872354053	guk.tohmuzey@tularegion.ru	Тула	Россия
4	Кафe "Гурман"	ИП	Борисова Тамара Павловна	Питание	78005553535	cafe.gurman@fakemail.ru	Тула	Россия
5	Музей оружия	ФГБУК	Тульский государственный музей оружия	Музей	74872308445	excurs-arms@mail.ru	Тула	Россия
6	Ясная Поляна	ГМиПЗ	Музей-усадьба Л.Н.Толстого "Ясная поляна"	Музей	74872393599	tour@tolstoy.ru	Тула	Россия
7	Ресторан "Дворянская усадьба"	ОАО	Ресторан "Дворянская усадьба"	Питание	79990011223	usadba@restorant.ru	Тула	Россия
8	Пассажирские перевозки	ООО	Пассажирские перевозки	Транспорт	74872880055	tp.spb@fakemail.ru	Санкт-Петербург	Россия
9	Экскурсии и гиды	ИП	Иванов Алексей Петрович	Гид	74872550012	gidy@tula.ru	Тула	Россия
10	Гостевой дом "Европейский"	ООО	Гостевой дом "Европейский"	Проживание	74872361991	evropeisky-hotel@vsegostinitsy.ru	Тула	Россия
\.


--
-- Name: individuals_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.individuals_customer_id_seq', 1, false);


--
-- Name: managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.managers_id_seq', 10, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 11, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: tour_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tour_objects_id_seq', 10, true);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: entities entities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (customer_id);


--
-- Name: individuals individuals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT individuals_pkey PRIMARY KEY (customer_id);


--
-- Name: managers managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: order_list order_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list
    ADD CONSTRAINT order_list_pkey PRIMARY KEY (order_id, service_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: tour_objects tour_objects_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_objects
    ADD CONSTRAINT tour_objects_email_key UNIQUE (email);


--
-- Name: tour_objects tour_objects_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_objects
    ADD CONSTRAINT tour_objects_phone_key UNIQUE (phone);


--
-- Name: tour_objects tour_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tour_objects
    ADD CONSTRAINT tour_objects_pkey PRIMARY KEY (id);


--
-- Name: entities entities_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: individuals individuals_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT individuals_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: order_list order_list_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list
    ADD CONSTRAINT order_list_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_list order_list_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_list
    ADD CONSTRAINT order_list_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders orders_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: services services_tour_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_tour_object_id_fkey FOREIGN KEY (tour_object_id) REFERENCES public.tour_objects(id);


--
-- PostgreSQL database dump complete
--

