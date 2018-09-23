--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ericfries;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ericfries;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ericfries;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ericfries;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ericfries;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ericfries;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ericfries;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ericfries;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ericfries;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ericfries;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ericfries;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ericfries;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ericfries;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ericfries;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ericfries;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ericfries;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ericfries;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ericfries;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ericfries;

--
-- Name: states_historicalpopulation; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.states_historicalpopulation (
    id integer NOT NULL,
    year smallint NOT NULL,
    population integer NOT NULL,
    state_id integer NOT NULL,
    CONSTRAINT states_historicalpopulation_year_check CHECK ((year >= 0))
);


ALTER TABLE public.states_historicalpopulation OWNER TO ericfries;

--
-- Name: states_historicalpopulation_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.states_historicalpopulation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_historicalpopulation_id_seq OWNER TO ericfries;

--
-- Name: states_historicalpopulation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.states_historicalpopulation_id_seq OWNED BY public.states_historicalpopulation.id;


--
-- Name: states_state; Type: TABLE; Schema: public; Owner: ericfries
--

CREATE TABLE public.states_state (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.states_state OWNER TO ericfries;

--
-- Name: states_state_id_seq; Type: SEQUENCE; Schema: public; Owner: ericfries
--

CREATE SEQUENCE public.states_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_state_id_seq OWNER TO ericfries;

--
-- Name: states_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ericfries
--

ALTER SEQUENCE public.states_state_id_seq OWNED BY public.states_state.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: states_historicalpopulation id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.states_historicalpopulation ALTER COLUMN id SET DEFAULT nextval('public.states_historicalpopulation_id_seq'::regclass);


--
-- Name: states_state id; Type: DEFAULT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.states_state ALTER COLUMN id SET DEFAULT nextval('public.states_state_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add historical population	7	add_historicalpopulation
26	Can change historical population	7	change_historicalpopulation
27	Can delete historical population	7	delete_historicalpopulation
28	Can view historical population	7	view_historicalpopulation
29	Can add state	8	add_state
30	Can change state	8	change_state
31	Can delete state	8	delete_state
32	Can view state	8	view_state
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	states	historicalpopulation
8	states	state
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-09-23 13:02:47.534504-04
2	auth	0001_initial	2018-09-23 13:02:47.599969-04
3	admin	0001_initial	2018-09-23 13:02:47.621923-04
4	admin	0002_logentry_remove_auto_add	2018-09-23 13:02:47.631136-04
5	admin	0003_logentry_add_action_flag_choices	2018-09-23 13:02:47.640473-04
6	contenttypes	0002_remove_content_type_name	2018-09-23 13:02:47.670847-04
7	auth	0002_alter_permission_name_max_length	2018-09-23 13:02:47.677239-04
8	auth	0003_alter_user_email_max_length	2018-09-23 13:02:47.685551-04
9	auth	0004_alter_user_username_opts	2018-09-23 13:02:47.693373-04
10	auth	0005_alter_user_last_login_null	2018-09-23 13:02:47.701972-04
11	auth	0006_require_contenttypes_0002	2018-09-23 13:02:47.704224-04
12	auth	0007_alter_validators_add_error_messages	2018-09-23 13:02:47.712917-04
13	auth	0008_alter_user_username_max_length	2018-09-23 13:02:47.727135-04
14	auth	0009_alter_user_last_name_max_length	2018-09-23 13:02:47.735239-04
15	sessions	0001_initial	2018-09-23 13:02:47.744553-04
16	states	0001_initial	2018-09-23 13:31:35.214121-04
30	states	0002_auto_20180923_1747	2018-09-23 14:26:17.280669-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: states_historicalpopulation; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.states_historicalpopulation (id, year, population, state_id) FROM stdin;
1621	1990	12937926	410
1622	1980	9746324	410
1623	1970	6789443	410
1624	1960	4951560	410
1625	1950	2771305	410
1626	1940	1897414	410
1627	1930	1468211	410
1628	1920	968470	410
1629	1910	752619	410
1630	1900	528542	410
1631	1990	6478216	411
1632	1980	5463105	411
1633	1970	4589575	411
1634	1960	3943116	411
1635	1950	3444578	411
1636	1940	3123723	411
1637	1930	2908506	411
1638	1920	2895832	411
1639	1910	2609121	411
1640	1900	2216331	411
1641	1990	1108229	412
1642	1980	964691	412
1643	1970	768561	412
1644	1960	632772	412
1645	1950	499794	412
1646	1940	422770	412
1647	1930	368300	412
1648	1920	255881	412
1649	1910	191874	412
1650	1900	154001	412
1651	1990	1006749	413
1652	1980	943935	413
1653	1970	712567	413
1654	1960	667191	413
1655	1950	588637	413
1656	1940	524873	413
1657	1930	445032	413
1658	1920	431866	413
1659	1910	325594	413
1660	1900	161772	413
1661	1990	11430602	414
1531	1990	4040587	401
1532	1980	3893888	401
1533	1970	3444165	401
1534	1960	3266740	401
1535	1950	3061743	401
1536	1940	2832961	401
1537	1930	2646248	401
1538	1920	2348174	401
1539	1910	2138093	401
1540	1900	1828697	401
1541	1990	550043	402
1542	1980	401851	402
1543	1970	300382	402
1544	1960	226167	402
1545	1950	128643	402
1546	1940	72524	402
1547	1930	59278	402
1548	1920	55036	402
1549	1910	64356	402
1550	1900	63592	402
1551	1990	3665228	403
1552	1980	2718215	403
1553	1970	1770900	403
1554	1960	1302161	403
1555	1950	749587	403
1556	1940	499261	403
1557	1930	435573	403
1558	1920	334162	403
1559	1910	204354	403
1560	1900	122931	403
1561	1990	2350725	404
1562	1980	2286435	404
1563	1970	1923295	404
1564	1960	1786272	404
1565	1950	1909511	404
1566	1940	1949387	404
1567	1930	1854482	404
1568	1920	1752204	404
1569	1910	1574449	404
1570	1900	1311564	404
1571	1990	29760021	405
1572	1980	23667902	405
1573	1970	19953134	405
1574	1960	15717204	405
1575	1950	10586223	405
1576	1940	6907387	405
1577	1930	5677251	405
1578	1920	3426861	405
1579	1910	2377549	405
1580	1900	1485053	405
1581	1990	3294394	406
1582	1980	2889964	406
1583	1970	2207259	406
1584	1960	1753947	406
1585	1950	1325089	406
1586	1940	1123296	406
1587	1930	1035791	406
1588	1920	939629	406
1589	1910	799024	406
1590	1900	539700	406
1591	1990	3287116	407
1592	1980	3107576	407
1593	1970	3031709	407
1594	1960	2535234	407
1595	1950	2007280	407
1596	1940	1709242	407
1597	1930	1606903	407
1598	1920	1380631	407
1599	1910	1114756	407
1600	1900	908420	407
1601	1990	666168	408
1602	1980	594338	408
1603	1970	548104	408
1604	1960	446292	408
1605	1950	318085	408
1606	1940	266505	408
1607	1930	238380	408
1608	1920	223003	408
1609	1910	202322	408
1610	1900	184735	408
1611	1990	606900	409
1612	1980	638333	409
1613	1970	756510	409
1614	1960	763956	409
1615	1950	802178	409
1616	1940	663091	409
1617	1930	486869	409
1618	1920	437571	409
1619	1910	331069	409
1620	1900	278718	409
1662	1980	11426518	414
1663	1970	11113976	414
1664	1960	10081158	414
1665	1950	8712176	414
1666	1940	7897241	414
1667	1930	7630654	414
1668	1920	6485280	414
1669	1910	5638591	414
1670	1900	4821550	414
1671	1990	5544159	415
1672	1980	5490224	415
1673	1970	5193669	415
1674	1960	4662498	415
1675	1950	3934224	415
1676	1940	3427796	415
1677	1930	3238503	415
1678	1920	2930390	415
1679	1910	2700876	415
1680	1900	2516462	415
1681	1990	2776755	416
1682	1980	2913808	416
1683	1970	2824376	416
1684	1960	2757537	416
1685	1950	2621073	416
1686	1940	2538268	416
1687	1930	2470939	416
1688	1920	2404021	416
1689	1910	2224771	416
1690	1900	2231853	416
1691	1990	2477574	417
1692	1980	2363679	417
1693	1970	2246578	417
1694	1960	2178611	417
1695	1950	1905299	417
1696	1940	1801028	417
1697	1930	1880999	417
1698	1920	1769257	417
1699	1910	1690949	417
1700	1900	1470495	417
1701	1990	3685296	418
1702	1980	3660777	418
1703	1970	3218706	418
1704	1960	3038156	418
1705	1950	2944806	418
1706	1940	2845627	418
1707	1930	2614589	418
1708	1920	2416630	418
1709	1910	2289905	418
1710	1900	2147174	418
1711	1990	4219973	419
1712	1980	4205900	419
1713	1970	3641306	419
1714	1960	3257022	419
1715	1950	2683516	419
1716	1940	2363880	419
1717	1930	2101593	419
1718	1920	1798509	419
1719	1910	1656388	419
1720	1900	1381625	419
1721	1990	1227928	420
1722	1980	1124660	420
1723	1970	992048	420
1724	1960	969265	420
1725	1950	913774	420
1726	1940	847226	420
1727	1930	797423	420
1728	1920	768014	420
1729	1910	742371	420
1730	1900	694466	420
1731	1990	4781468	421
1732	1980	4216975	421
1733	1970	3922399	421
1734	1960	3100689	421
1735	1950	2343001	421
1736	1940	1821244	421
1737	1930	1631526	421
1738	1920	1449661	421
1739	1910	1295346	421
1740	1900	1188044	421
1741	1990	6016425	422
1742	1980	5737037	422
1743	1970	5689170	422
1744	1960	5148578	422
1745	1950	4690514	422
1746	1940	4316721	422
1747	1930	4249614	422
1748	1920	3852356	422
1749	1910	3366416	422
1750	1900	2805346	422
1751	1990	9295297	423
1752	1980	9262078	423
1753	1970	8875083	423
1754	1960	7823194	423
1755	1950	6371766	423
1756	1940	5256106	423
1757	1930	4842325	423
1758	1920	3668412	423
1759	1910	2810173	423
1760	1900	2420982	423
1761	1990	4375099	424
1762	1980	4075970	424
1763	1970	3804971	424
1764	1960	3413864	424
1765	1950	2982483	424
1766	1940	2792300	424
1767	1930	2563953	424
1768	1920	2387125	424
1769	1910	2075708	424
1770	1900	1751394	424
1771	1990	2573216	425
1772	1980	2520638	425
1773	1970	2216912	425
1774	1960	2178141	425
1775	1950	2178914	425
1776	1940	2183796	425
1777	1930	2009821	425
1778	1920	1790618	425
1779	1910	1797114	425
1780	1900	1551270	425
1781	1990	5117073	426
1782	1980	4916686	426
1783	1970	4676501	426
1784	1960	4319813	426
1785	1950	3954653	426
1786	1940	3784664	426
1787	1930	3629367	426
1788	1920	3404055	426
1789	1910	3293335	426
1790	1900	3106665	426
1791	1990	799065	427
1792	1980	786690	427
1793	1970	694409	427
1794	1960	674767	427
1795	1950	591024	427
1796	1940	559456	427
1797	1930	537606	427
1798	1920	548889	427
1799	1910	376053	427
1800	1900	243329	427
1801	1990	1578385	428
1802	1980	1569825	428
1803	1970	1483493	428
1804	1960	1411330	428
1805	1950	1325510	428
1806	1940	1315834	428
1807	1930	1377963	428
1808	1920	1296372	428
1809	1910	1192214	428
1810	1900	1066300	428
1811	1990	1201833	429
1812	1980	800493	429
1813	1970	488738	429
1814	1960	285278	429
1815	1950	160083	429
1816	1940	110247	429
1817	1930	91058	429
1818	1920	77407	429
1819	1910	81875	429
1820	1900	42335	429
1821	1990	1109252	430
1822	1980	920610	430
1823	1970	737681	430
1824	1960	606921	430
1825	1950	533242	430
1826	1940	491524	430
1827	1930	465293	430
1828	1920	443083	430
1829	1910	430572	430
1830	1900	411588	430
1831	1990	7730188	431
1832	1980	7364823	431
1833	1970	7168164	431
1834	1960	6066782	431
1835	1950	4835329	431
1836	1940	4160165	431
1837	1930	4041334	431
1838	1920	3155900	431
1839	1910	2537167	431
1840	1900	1883669	431
1841	1990	1515069	432
1842	1980	1302894	432
1843	1970	1016000	432
1844	1960	951023	432
1845	1950	681187	432
1846	1940	531818	432
1847	1930	423317	432
1848	1920	360350	432
1849	1910	327301	432
1850	1900	195310	432
1851	1990	17990455	433
1852	1980	17558072	433
1853	1970	18236967	433
1854	1960	16782304	433
1855	1950	14830192	433
1856	1940	13479142	433
1857	1930	12588066	433
1858	1920	10385227	433
1859	1910	9113614	433
1860	1900	7268894	433
1861	1990	6628637	434
1862	1980	5881766	434
1863	1970	5082059	434
1864	1960	4556155	434
1865	1950	4061929	434
1866	1940	3571623	434
1867	1930	3170276	434
1868	1920	2559123	434
1869	1910	2206287	434
1870	1900	1893810	434
1871	1990	638800	435
1872	1980	652717	435
1873	1970	617761	435
1874	1960	632446	435
1875	1950	619636	435
1876	1940	641935	435
1877	1930	680845	435
1878	1920	646872	435
1879	1910	577056	435
1880	1900	319146	435
1881	1990	10847115	436
1882	1980	10797630	436
1883	1970	10652017	436
1884	1960	9706397	436
1885	1950	7946627	436
1886	1940	6907612	436
1887	1930	6646697	436
1888	1920	5759394	436
1889	1910	4767121	436
1890	1900	4157545	436
1891	1990	3145585	437
1892	1980	3025290	437
1893	1970	2559229	437
1894	1960	2328284	437
1895	1950	2233351	437
1896	1940	2336434	437
1897	1930	2396040	437
1898	1920	2028283	437
1899	1910	1657155	437
1900	1900	790391	437
1901	1990	2842321	438
1902	1980	2633105	438
1903	1970	2091385	438
1904	1960	1768687	438
1905	1950	1521341	438
1906	1940	1089684	438
1907	1930	953786	438
1908	1920	783389	438
1909	1910	672765	438
1910	1900	413536	438
1911	1990	11881643	439
1912	1980	11863895	439
1913	1970	11793909	439
1914	1960	11319366	439
1915	1950	10498012	439
1916	1940	9900180	439
1917	1930	9631350	439
1918	1920	8720017	439
1919	1910	7665111	439
1920	1900	6302115	439
1921	1990	1003464	440
1922	1980	947154	440
1923	1970	946725	440
1924	1960	859488	440
1925	1950	791896	440
1926	1940	713346	440
1927	1930	687497	440
1928	1920	604397	440
1929	1910	542610	440
1930	1900	428556	440
1931	1990	3486703	441
1932	1980	3121820	441
1933	1970	2590516	441
1934	1960	2382594	441
1935	1950	2117027	441
1936	1940	1899804	441
1937	1930	1738765	441
1938	1920	1683724	441
1939	1910	1515400	441
1940	1900	1340316	441
1941	1990	696004	442
1942	1980	690768	442
1943	1970	665507	442
1944	1960	680514	442
1945	1950	652740	442
1946	1940	642961	442
1947	1930	692849	442
1948	1920	636547	442
1949	1910	583888	442
1950	1900	401570	442
1951	1990	4877185	443
1952	1980	4591120	443
1953	1970	3923687	443
1954	1960	3567089	443
1955	1950	3291718	443
1956	1940	2915841	443
1957	1930	2616556	443
1958	1920	2337885	443
1959	1910	2184789	443
1960	1900	2020616	443
1961	1990	16986510	444
1962	1980	14229191	444
1963	1970	11196730	444
1964	1960	9579677	444
1965	1950	7711194	444
1966	1940	6414824	444
1967	1930	5824715	444
1968	1920	4663228	444
1969	1910	3896542	444
1970	1900	3048710	444
1971	1990	1722850	445
1972	1980	1461037	445
1973	1970	1059273	445
1974	1960	890627	445
1975	1950	688862	445
1976	1940	550310	445
1977	1930	507847	445
1978	1920	449396	445
1979	1910	373351	445
1980	1900	276749	445
1981	1990	562758	446
1982	1980	511456	446
1983	1970	444330	446
1984	1960	389881	446
1985	1950	377747	446
1986	1940	359231	446
1987	1930	359611	446
1988	1920	352428	446
1989	1910	355956	446
1990	1900	343641	446
1991	1990	6187358	447
1992	1980	5346818	447
1993	1970	4648494	447
1994	1960	3966949	447
1995	1950	3318680	447
1996	1940	2677773	447
1997	1930	2421851	447
1998	1920	2309187	447
1999	1910	2061612	447
2000	1900	1854184	447
2001	1990	4866692	448
2002	1980	4132156	448
2003	1970	3409169	448
2004	1960	2853214	448
2005	1950	2378963	448
2006	1940	1736191	448
2007	1930	1563396	448
2008	1920	1356621	448
2009	1910	1141990	448
2010	1900	518103	448
2011	1990	1793477	449
2012	1980	1949644	449
2013	1970	1744237	449
2014	1960	1860421	449
2015	1950	2005552	449
2016	1940	1901974	449
2017	1930	1729205	449
2018	1920	1463701	449
2019	1910	1221119	449
2020	1900	958800	449
2021	1990	4891769	450
2022	1980	4705767	450
2023	1970	4417731	450
2024	1960	3951777	450
2025	1950	3434575	450
2026	1940	3137587	450
2027	1930	2939006	450
2028	1920	2632067	450
2029	1910	2333860	450
2030	1900	2069042	450
2031	1990	453588	451
2032	1980	469557	451
2033	1970	332416	451
2034	1960	330066	451
2035	1950	290529	451
2036	1940	250742	451
2037	1930	225565	451
2038	1920	194402	451
2039	1910	145965	451
2040	1900	92531	451
\.


--
-- Data for Name: states_state; Type: TABLE DATA; Schema: public; Owner: ericfries
--

COPY public.states_state (id, name) FROM stdin;
401	Alabama
402	Alaska
403	Arizona
404	Arkansas
405	California
406	Colorado
407	Connecticut
408	Delaware
409	District of Columbia
410	Florida
411	Georgia
412	Hawaii
413	Idaho
414	Illinois
415	Indiana
416	Iowa
417	Kansas
418	Kentucky
419	Louisiana
420	Maine
421	Maryland
422	Massachusetts
423	Michigan
424	Minnesota
425	Mississippi
426	Missouri
427	Montana
428	Nebraska
429	Nevada
430	New Hampshire
431	New Jersey
432	New Mexico
433	New York
434	North Carolina
435	North Dakota
436	Ohio
437	Oklahoma
438	Oregon
439	Pennsylvania
440	Rhode Island
441	South Carolina
442	South Dakota
443	Tennessee
444	Texas
445	Utah
446	Vermont
447	Virginia
448	Washington
449	West Virginia
450	Wisconsin
451	Wyoming
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: states_historicalpopulation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.states_historicalpopulation_id_seq', 2040, true);


--
-- Name: states_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ericfries
--

SELECT pg_catalog.setval('public.states_state_id_seq', 451, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: states_historicalpopulation states_historicalpopulation_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.states_historicalpopulation
    ADD CONSTRAINT states_historicalpopulation_pkey PRIMARY KEY (id);


--
-- Name: states_state states_state_pkey; Type: CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.states_state
    ADD CONSTRAINT states_state_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: states_historicalpopulation_state_id_e161797f; Type: INDEX; Schema: public; Owner: ericfries
--

CREATE INDEX states_historicalpopulation_state_id_e161797f ON public.states_historicalpopulation USING btree (state_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: states_historicalpopulation states_historicalpop_state_id_e161797f_fk_states_st; Type: FK CONSTRAINT; Schema: public; Owner: ericfries
--

ALTER TABLE ONLY public.states_historicalpopulation
    ADD CONSTRAINT states_historicalpop_state_id_e161797f_fk_states_st FOREIGN KEY (state_id) REFERENCES public.states_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

