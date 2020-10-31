--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-10-30 18:55:39

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

CREATE ROLE yesbot WITH ENCRYPTED PASSWORD 'yesbot' LOGIN;
CREATE DATABASE yesbot OWNER yesbot;

--
-- TOC entry 209 (class 1259 OID 16458)
-- Name: birthday; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.birthday (
    userid text NOT NULL,
    birthdate timestamp with time zone NOT NULL,
    timezone text
);


ALTER TABLE public.birthday OWNER TO yesbot;

--
-- TOC entry 215 (class 1259 OID 16629)
-- Name: blog; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.blog (
    id integer NOT NULL,
    title_image character varying NOT NULL,
    title character varying NOT NULL,
    author_id character varying NOT NULL,
    read_time integer NOT NULL,
    blog_content character varying NOT NULL,
    preview_id character varying NOT NULL,
    "isPublic" boolean DEFAULT false NOT NULL,
    author_name character varying NOT NULL
);


ALTER TABLE public.blog OWNER TO yesbot;

--
-- TOC entry 214 (class 1259 OID 16627)
-- Name: blog_id_seq; Type: SEQUENCE; Schema: public; Owner: yesbot
--

CREATE SEQUENCE public.blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_id_seq OWNER TO yesbot;

--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 214
-- Name: blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yesbot
--

ALTER SEQUENCE public.blog_id_seq OWNED BY public.blog.id;


--
-- TOC entry 213 (class 1259 OID 16615)
-- Name: buddy_project_entry; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.buddy_project_entry (
    user_id text NOT NULL,
    matched boolean NOT NULL,
    discord_user boolean NOT NULL,
    buddy_id text,
    matched_date timestamp with time zone,
    reported_ghost_date timestamp with time zone
);


ALTER TABLE public.buddy_project_entry OWNER TO yesbot;

--
-- TOC entry 212 (class 1259 OID 16571)
-- Name: channel_toggle; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.channel_toggle (
    id integer NOT NULL,
    channel text NOT NULL,
    emoji text NOT NULL,
    "messageId" character varying
);


ALTER TABLE public.channel_toggle OWNER TO yesbot;

--
-- TOC entry 211 (class 1259 OID 16569)
-- Name: channel_toggle_id_seq; Type: SEQUENCE; Schema: public; Owner: yesbot
--

CREATE SEQUENCE public.channel_toggle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_toggle_id_seq OWNER TO yesbot;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 211
-- Name: channel_toggle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yesbot
--

ALTER SEQUENCE public.channel_toggle_id_seq OWNED BY public.channel_toggle.id;


--
-- TOC entry 208 (class 1259 OID 16444)
-- Name: deadchat_question; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.deadchat_question (
    id integer NOT NULL,
    question character varying NOT NULL,
    last_used timestamp without time zone DEFAULT '2020-10-29 23:47:03.223'::timestamp without time zone NOT NULL
);


ALTER TABLE public.deadchat_question OWNER TO yesbot;

--
-- TOC entry 207 (class 1259 OID 16442)
-- Name: deadchat_question_id_seq; Type: SEQUENCE; Schema: public; Owner: yesbot
--

CREATE SEQUENCE public.deadchat_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deadchat_question_id_seq OWNER TO yesbot;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 207
-- Name: deadchat_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yesbot
--

ALTER SEQUENCE public.deadchat_question_id_seq OWNED BY public.deadchat_question.id;


--
-- TOC entry 203 (class 1259 OID 16403)
-- Name: group_member; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.group_member (
    id character varying NOT NULL
);


ALTER TABLE public.group_member OWNER TO yesbot;

--
-- TOC entry 210 (class 1259 OID 16561)
-- Name: message; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.message (
    id character varying NOT NULL,
    channel text
);


ALTER TABLE public.message OWNER TO yesbot;

--
-- TOC entry 217 (class 1259 OID 16993)
-- Name: reaction_role; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.reaction_role (
    id integer NOT NULL,
    message_id character varying NOT NULL,
    channel_id character varying NOT NULL,
    reaction character varying NOT NULL,
    role_id character varying NOT NULL
);


ALTER TABLE public.reaction_role OWNER TO yesbot;

--
-- TOC entry 216 (class 1259 OID 16991)
-- Name: reaction_role_id_seq; Type: SEQUENCE; Schema: public; Owner: yesbot
--

CREATE SEQUENCE public.reaction_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reaction_role_id_seq OWNER TO yesbot;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 216
-- Name: reaction_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yesbot
--

ALTER SEQUENCE public.reaction_role_id_seq OWNED BY public.reaction_role.id;


--
-- TOC entry 202 (class 1259 OID 16395)
-- Name: someone_user; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.someone_user (
    id character varying NOT NULL,
    "time" timestamp with time zone NOT NULL
);


ALTER TABLE public.someone_user OWNER TO yesbot;

--
-- TOC entry 220 (class 1259 OID 17230)
-- Name: testimonial; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.testimonial (
    id integer NOT NULL,
    content character varying NOT NULL,
    display_name character varying NOT NULL
);


ALTER TABLE public.testimonial OWNER TO yesbot;

--
-- TOC entry 219 (class 1259 OID 17228)
-- Name: testimonial_id_seq; Type: SEQUENCE; Schema: public; Owner: yesbot
--

CREATE SEQUENCE public.testimonial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testimonial_id_seq OWNER TO yesbot;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 219
-- Name: testimonial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yesbot
--

ALTER SEQUENCE public.testimonial_id_seq OWNED BY public.testimonial.id;


--
-- TOC entry 205 (class 1259 OID 16413)
-- Name: user_group; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.user_group (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    last_used timestamp without time zone DEFAULT ('2020-10-30 00:47:10.835996'::timestamp without time zone - '01:00:00'::interval) NOT NULL,
    cooldown integer DEFAULT 60 NOT NULL
);


ALTER TABLE public.user_group OWNER TO yesbot;

--
-- TOC entry 204 (class 1259 OID 16411)
-- Name: user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: yesbot
--

CREATE SEQUENCE public.user_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_id_seq OWNER TO yesbot;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yesbot
--

ALTER SEQUENCE public.user_group_id_seq OWNED BY public.user_group.id;


--
-- TOC entry 206 (class 1259 OID 16422)
-- Name: user_group_members_group_member; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.user_group_members_group_member (
    "userGroupId" integer NOT NULL,
    "groupMemberId" character varying NOT NULL
);


ALTER TABLE public.user_group_members_group_member OWNER TO yesbot;

--
-- TOC entry 218 (class 1259 OID 17003)
-- Name: voice_on_demand_mapping; Type: TABLE; Schema: public; Owner: yesbot
--

CREATE TABLE public.voice_on_demand_mapping (
    user_id character varying NOT NULL,
    channel_id character varying NOT NULL,
    emoji character varying NOT NULL
);


ALTER TABLE public.voice_on_demand_mapping OWNER TO yesbot;

--
-- TOC entry 2764 (class 2604 OID 16632)
-- Name: blog id; Type: DEFAULT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.blog ALTER COLUMN id SET DEFAULT nextval('public.blog_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 16574)
-- Name: channel_toggle id; Type: DEFAULT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.channel_toggle ALTER COLUMN id SET DEFAULT nextval('public.channel_toggle_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 16447)
-- Name: deadchat_question id; Type: DEFAULT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.deadchat_question ALTER COLUMN id SET DEFAULT nextval('public.deadchat_question_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 16996)
-- Name: reaction_role id; Type: DEFAULT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.reaction_role ALTER COLUMN id SET DEFAULT nextval('public.reaction_role_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 17233)
-- Name: testimonial id; Type: DEFAULT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.testimonial ALTER COLUMN id SET DEFAULT nextval('public.testimonial_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 16416)
-- Name: user_group id; Type: DEFAULT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.user_group ALTER COLUMN id SET DEFAULT nextval('public.user_group_id_seq'::regclass);


--
-- TOC entry 2936 (class 0 OID 16458)
-- Dependencies: 209
-- Data for Name: birthday; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.birthday (userid, birthdate, timezone) FROM stdin;
\.


--
-- TOC entry 2942 (class 0 OID 16629)
-- Dependencies: 215
-- Data for Name: blog; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.blog (id, title_image, title, author_id, read_time, blog_content, preview_id, "isPublic", author_name) FROM stdin;
1	https://picsum.photos/1380/487	When the code is smarter than I am	290193372407136256	7	{"ops":[{"insert":"I should remember to save this somewhere\\n\\n"},{"attributes":{"bold":true},"insert":"somewhere but in bold"},{"insert":{"image":"data:image/png;base64,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"}},{"insert":"\\nreeeeeeeeeeEEEEEEEE\\n"}]}	7Kr64pjKm	t	geisterfurz007
4	https://picsum.photos/1380/487	I am going to place a title here	290193372407136256	7	{"ops":[{"insert":"And some text here!\\n"}]}	HYGiwGPJn	t	geisterfurz007
9	https://picsum.photos/1380/487	This is a test for the new stuff	290193372407136256	7	{"ops":[{"insert":"This is just some fuckoff random text to fill the content of this blog :)\\n"}]}	sP9WNlB4s	f	geisterfurz007
6	https://picsum.photos/1380/487	Sad cry	290193372407136256	7	{"ops":[{"insert":"for help.\\n\\n\\n\\n\\n\\ndesperately\\n"}]}	ksw6YXRio	f	geisterfurz007
\.


--
-- TOC entry 2940 (class 0 OID 16615)
-- Dependencies: 213
-- Data for Name: buddy_project_entry; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.buddy_project_entry (user_id, matched, discord_user, buddy_id, matched_date, reported_ghost_date) FROM stdin;
440593108313440256	f	t	\N	\N	\N
140492559469248512	t	t	246945541466882048	\N	\N
246945541466882048	t	t	140492559469248512	\N	\N
193500142140129280	t	t	430004007491338240	\N	\N
430004007491338240	t	t	193500142140129280	\N	\N
290193372407136256	f	t	\N	\N	\N
\.


--
-- TOC entry 2939 (class 0 OID 16571)
-- Dependencies: 212
-- Data for Name: channel_toggle; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.channel_toggle (id, channel, emoji, "messageId") FROM stdin;
1	706080918913286214	🍷	707990716965453905
2	706080919299031105	🚙	707990716965453905
3	706080919299031108	🎾	713512354691809280
4	706080921815613513	🕹️	713512354691809280
5	706080921815613515	🕹️	713704162679848971
6	733698229883109443	🍷	757211659390681158
7	733698230772301896	👀	749510025197649921
\.


--
-- TOC entry 2935 (class 0 OID 16444)
-- Dependencies: 208
-- Data for Name: deadchat_question; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.deadchat_question (id, question, last_used) FROM stdin;
11	It’s a very different culture. What do people need to know when they move to Thailand?	2020-05-02 12:50:25.314
12	I am a mixed raced child. Will any country ever accept me as one of their own?	2020-05-02 12:50:25.314
13	Is it possible at all to live your life without fear?	2020-05-02 12:50:25.314
14	Is it unusual to have no fear in being jobless?	2020-05-02 12:50:25.314
15	How does “knowing too much” benefit or harm you?	2020-05-02 12:50:25.314
16	Should philosophy be taught earlier in school to inspire children to question more?	2020-05-02 12:50:25.314
17	What do you think about your country’s education system?	2020-05-02 12:50:25.314
18	What is the point of formal education?	2020-05-02 12:50:25.314
19	How can we revolutionize education for the 21st century and beyond?	2020-05-02 12:50:25.314
20	What does it mean to “be yourself”? Do you think you are these days? How can you be more yourself?	2020-05-02 12:50:25.314
21	What is the biggest challenge facing the next generation?	2020-05-02 12:50:25.314
22	What are some examples of justified violence that you can accept?	2020-05-02 12:50:25.314
23	How can I find passion?	2020-05-02 12:50:25.314
24	Will artificial intelligence eventually become a God?	2020-05-02 12:50:25.314
25	Is technology something to appreciate or fear?	2020-05-02 12:50:25.314
26	Is a good deed that goes unappreciated worthless?	2020-05-02 12:50:25.314
27	Is it selfish to have children?	2020-05-02 12:50:25.314
28	Is it important to be a risk taker?	2020-05-02 12:50:25.314
2	Do you think it is harder to exercise more or eat healthier?	2020-05-02 12:50:25.314
4	Should humanity aim to spend more time outside?	2020-05-02 12:50:25.314
1	Is drinking milk healthy for humans?	2020-05-02 12:50:25.314
3	Is reading paper books important for future generations?	2020-05-02 14:52:49.526
5	What are peoples' favourite day of the week and why?	2020-05-02 14:52:53.37
6	What is art?	2020-05-02 14:52:56.661
9	Globalization is inevitable – how can we make sure people who don’t want to participate can preserve their culture?	2020-05-02 14:52:58.164
10	How do you know if something is “normal”?	2020-05-02 14:52:59.667
8	In some cultures they wear black for 1 year when someone they love dies, do you think this is a good ritual? What do you do to show respect for those who have passed away?	2020-05-02 14:53:01.091
7	Is art still valuable in the world?	2020-05-02 14:53:02.654
\.


--
-- TOC entry 2930 (class 0 OID 16403)
-- Dependencies: 203
-- Data for Name: group_member; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.group_member (id) FROM stdin;
290193372407136256
\.


--
-- TOC entry 2937 (class 0 OID 16561)
-- Dependencies: 210
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.message (id, channel) FROM stdin;
707990716965453905	706080919299031110
713512354691809280	706080919299031104
713704162679848971	713704026583203890
757211659390681158	733698227487899753
749510025197649921	733698230457729084
\.


--
-- TOC entry 2944 (class 0 OID 16993)
-- Dependencies: 217
-- Data for Name: reaction_role; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.reaction_role (id, message_id, channel_id, reaction, role_id) FROM stdin;
1	751730804606107649	733698227487899751	🍷	733698226506432587
2	751730804606107649	733698227487899751	🎾	733698226506432583
3	751730804606107649	733698227487899751	🏄‍♂️	733698226506432585
\.


--
-- TOC entry 2929 (class 0 OID 16395)
-- Dependencies: 202
-- Data for Name: someone_user; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.someone_user (id, "time") FROM stdin;
160779166633951233	2020-09-16 18:32:50.24+02
290193372407136256	2020-09-16 23:36:35.495+02
\.


--
-- TOC entry 2947 (class 0 OID 17230)
-- Dependencies: 220
-- Data for Name: testimonial; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.testimonial (id, content, display_name) FROM stdin;
\.


--
-- TOC entry 2932 (class 0 OID 16413)
-- Dependencies: 205
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.user_group (id, name, description, last_used, cooldown) FROM stdin;
1	Something	Just so I got a group	2020-07-05 17:29:44.33	30
2	something2		2020-07-24 21:05:54.710291	60
3	something3		2020-07-24 21:05:54.710291	60
4	somethingelse		2020-07-24 21:05:54.710291	60
\.


--
-- TOC entry 2933 (class 0 OID 16422)
-- Dependencies: 206
-- Data for Name: user_group_members_group_member; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.user_group_members_group_member ("userGroupId", "groupMemberId") FROM stdin;
2	290193372407136256
\.


--
-- TOC entry 2945 (class 0 OID 17003)
-- Dependencies: 218
-- Data for Name: voice_on_demand_mapping; Type: TABLE DATA; Schema: public; Owner: yesbot
--

COPY public.voice_on_demand_mapping (user_id, channel_id, emoji) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 214
-- Name: blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yesbot
--

SELECT pg_catalog.setval('public.blog_id_seq', 9, true);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 211
-- Name: channel_toggle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yesbot
--

SELECT pg_catalog.setval('public.channel_toggle_id_seq', 7, true);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 207
-- Name: deadchat_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yesbot
--

SELECT pg_catalog.setval('public.deadchat_question_id_seq', 28, true);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 216
-- Name: reaction_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yesbot
--

SELECT pg_catalog.setval('public.reaction_role_id_seq', 4, true);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 219
-- Name: testimonial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yesbot
--

SELECT pg_catalog.setval('public.testimonial_id_seq', 26, true);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yesbot
--

SELECT pg_catalog.setval('public.user_group_id_seq', 4, true);


--
-- TOC entry 2769 (class 2606 OID 16402)
-- Name: someone_user PK_130023d8b6154fc2f76798ec215; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.someone_user
    ADD CONSTRAINT "PK_130023d8b6154fc2f76798ec215" PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 17001)
-- Name: reaction_role PK_2366830df888cf651ad941aed75; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.reaction_role
    ADD CONSTRAINT "PK_2366830df888cf651ad941aed75" PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 17010)
-- Name: voice_on_demand_mapping PK_25cccfee95e5b880d250d6a21ec; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.voice_on_demand_mapping
    ADD CONSTRAINT "PK_25cccfee95e5b880d250d6a21ec" PRIMARY KEY (user_id);


--
-- TOC entry 2773 (class 2606 OID 16421)
-- Name: user_group PK_3c29fba6fe013ec8724378ce7c9; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.user_group
    ADD CONSTRAINT "PK_3c29fba6fe013ec8724378ce7c9" PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 16622)
-- Name: buddy_project_entry PK_471364ecc7490fda984f87a8990; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.buddy_project_entry
    ADD CONSTRAINT "PK_471364ecc7490fda984f87a8990" PRIMARY KEY (user_id);


--
-- TOC entry 2771 (class 2606 OID 16410)
-- Name: group_member PK_65634517a244b69a8ef338d03c3; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.group_member
    ADD CONSTRAINT "PK_65634517a244b69a8ef338d03c3" PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 16637)
-- Name: blog PK_85c6532ad065a448e9de7638571; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT "PK_85c6532ad065a448e9de7638571" PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 16465)
-- Name: birthday PK_a86d822db17bcf9f182477ba0d7; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.birthday
    ADD CONSTRAINT "PK_a86d822db17bcf9f182477ba0d7" PRIMARY KEY (userid);


--
-- TOC entry 2783 (class 2606 OID 16568)
-- Name: message PK_ba01f0a3e0123651915008bc578; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT "PK_ba01f0a3e0123651915008bc578" PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 16579)
-- Name: channel_toggle PK_c32c171ae2d122efdf833cdc44b; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.channel_toggle
    ADD CONSTRAINT "PK_c32c171ae2d122efdf833cdc44b" PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 17238)
-- Name: testimonial PK_e1aee1c726db2d336480c69f7cb; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.testimonial
    ADD CONSTRAINT "PK_e1aee1c726db2d336480c69f7cb" PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 16453)
-- Name: deadchat_question PK_e32055532a70e36f21ce34a8d09; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.deadchat_question
    ADD CONSTRAINT "PK_e32055532a70e36f21ce34a8d09" PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 16429)
-- Name: user_group_members_group_member PK_fe90001a94cdd4257c8e5de56eb; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.user_group_members_group_member
    ADD CONSTRAINT "PK_fe90001a94cdd4257c8e5de56eb" PRIMARY KEY ("userGroupId", "groupMemberId");


--
-- TOC entry 2792 (class 2606 OID 16639)
-- Name: blog UQ_84b2925a23e2a11835f868b5f72; Type: CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.blog
    ADD CONSTRAINT "UQ_84b2925a23e2a11835f868b5f72" UNIQUE (preview_id);


--
-- TOC entry 2774 (class 1259 OID 16430)
-- Name: IDX_4d5a864456d00dafe30649263e; Type: INDEX; Schema: public; Owner: yesbot
--

CREATE INDEX "IDX_4d5a864456d00dafe30649263e" ON public.user_group_members_group_member USING btree ("userGroupId");


--
-- TOC entry 2784 (class 1259 OID 16580)
-- Name: IDX_886c4545692691c28e48cb964f; Type: INDEX; Schema: public; Owner: yesbot
--

CREATE UNIQUE INDEX "IDX_886c4545692691c28e48cb964f" ON public.channel_toggle USING btree (emoji, "messageId");


--
-- TOC entry 2793 (class 1259 OID 17002)
-- Name: IDX_9a7f4eb4ad5822073b7454344b; Type: INDEX; Schema: public; Owner: yesbot
--

CREATE UNIQUE INDEX "IDX_9a7f4eb4ad5822073b7454344b" ON public.reaction_role USING btree (message_id, channel_id, reaction);


--
-- TOC entry 2775 (class 1259 OID 16431)
-- Name: IDX_b21e7c86a67e5a158ef88b530b; Type: INDEX; Schema: public; Owner: yesbot
--

CREATE INDEX "IDX_b21e7c86a67e5a158ef88b530b" ON public.user_group_members_group_member USING btree ("groupMemberId");


--
-- TOC entry 2800 (class 2606 OID 16432)
-- Name: user_group_members_group_member FK_4d5a864456d00dafe30649263e4; Type: FK CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.user_group_members_group_member
    ADD CONSTRAINT "FK_4d5a864456d00dafe30649263e4" FOREIGN KEY ("userGroupId") REFERENCES public.user_group(id) ON DELETE CASCADE;


--
-- TOC entry 2801 (class 2606 OID 16437)
-- Name: user_group_members_group_member FK_b21e7c86a67e5a158ef88b530bc; Type: FK CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.user_group_members_group_member
    ADD CONSTRAINT "FK_b21e7c86a67e5a158ef88b530bc" FOREIGN KEY ("groupMemberId") REFERENCES public.group_member(id) ON DELETE CASCADE;


--
-- TOC entry 2802 (class 2606 OID 16582)
-- Name: channel_toggle FK_cfeb5cc81c75cd6b43dbe58829d; Type: FK CONSTRAINT; Schema: public; Owner: yesbot
--

ALTER TABLE ONLY public.channel_toggle
    ADD CONSTRAINT "FK_cfeb5cc81c75cd6b43dbe58829d" FOREIGN KEY ("messageId") REFERENCES public.message(id);


-- Completed on 2020-10-30 18:55:41

--
-- PostgreSQL database dump complete
--

