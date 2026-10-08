-- CRM demo schema and data for the demo "Jmix from an existing database" (crm-from-db).
-- Source: demo data of https://github.com/jmix-framework/jmix-crm (main @ 7b435f2, Jmix 3.0.3),
-- generated on PostgreSQL 17 and dumped with pg_dump: only the CRM business tables
-- client, contact, category, category_item, order_, order_item, invoice and user_ (CRM users,
-- account managers of clients). Jmix framework tables, DATABASECHANGELOG* and sequences are left out:
-- the crm-from-db application creates its own framework tables with Liquibase. user_.password is cleared.
-- Loaded on the first start of db/docker-compose.yml (docker-entrypoint-initdb.d).

--
-- PostgreSQL database dump
--


-- Dumped from database version 17.11 (Debian 17.11-1.pgdg13+2)
-- Dumped by pg_dump version 17.11 (Debian 17.11-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    parent_id uuid,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description text
);


--
-- Name: category_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category_item (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    category_id uuid,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    price numeric(19,2) NOT NULL,
    image character varying(1024),
    description text,
    uom character varying(255) NOT NULL
);


--
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255),
    type_ character varying(255) NOT NULL,
    vat_number character varying(255),
    reg_number character varying(255),
    website character varying(255),
    account_manager_id uuid,
    postal_code character varying(255),
    country character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    house character varying(255) NOT NULL,
    street character varying(255) NOT NULL,
    apartment character varying(255)
);


--
-- Name: contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    client_id uuid NOT NULL,
    person character varying(255) NOT NULL,
    position_ character varying(255),
    start_date date,
    end_date date,
    phone character varying(255),
    email character varying(255)
);


--
-- Name: invoice; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoice (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    number character varying(255) NOT NULL,
    client_id uuid NOT NULL,
    order_id uuid,
    date_ date,
    due_date date,
    subtotal numeric(19,2),
    vat numeric(19,2),
    total numeric(19,2),
    status integer
);


--
-- Name: order_; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_ (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    number character varying(255) NOT NULL,
    client_id uuid NOT NULL,
    date_ date,
    purchase_order character varying(255),
    comment_ text,
    total numeric(19,2),
    discount_value numeric(19,2),
    discount_percent numeric(19,2),
    status integer
);


--
-- Name: order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_item (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    category_item_id uuid,
    quantity numeric(19,2) NOT NULL,
    discount numeric(19,2),
    net_price numeric(19,2) NOT NULL,
    gross_price numeric(19,2) NOT NULL,
    vat numeric(19,2) NOT NULL,
    order_id uuid NOT NULL
);


--
-- Name: user_; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_ (
    id uuid NOT NULL,
    created_by character varying(255),
    created_date timestamp with time zone,
    updated_by character varying(255),
    updated_date timestamp with time zone,
    deleted_by character varying(255),
    deleted_date timestamp with time zone,
    version integer NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    email character varying(255),
    active boolean,
    time_zone_id character varying(255)
);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, parent_id, name, code, description) FROM stdin;
01a11c74-99d9-7fbe-894f-10b4942ca159	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Networking	NET	Network infrastructure and connectivity solutions
01a11c74-99e2-7db6-a853-2dd8eeba90a7	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Professional Services	SRV	Implementation, integration, and consulting services
01a11c74-99cf-7f1e-8701-9ae598e0f74b	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Cloud Services	CLOUD	Cloud computing, storage, and managed services
01a11c74-99f8-7168-83b1-a81445fb1db8	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Consulting Services	CONS	Strategic consulting and business assessment
01a11c74-99c7-72d0-819a-c531f9dd9b9e	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Software Solutions	SW	Enterprise software licenses and suites
01a11c74-99d5-72c4-bb95-5e3e2ed96482	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Hardware & Equipment	HW	Servers, workstations, and peripherals
01a11c74-99ee-7a87-b436-01a4c3683f7c	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Training & Education	EDU	Workshops, training sessions, and certification programs
01a11c74-99f3-75a9-af6f-58fc28369f15	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Office Technology	OFFICE	Modern office equipment and communication tools
01a11c74-99ea-7241-b3ea-e10aeeba0aa0	system	2026-10-08 16:59:26.076+00	\N	2026-10-08 16:59:26.076+00	\N	\N	1	\N	Support & Maintenance	SUPP	Ongoing technical support and maintenance contracts
01a11c74-99df-7083-a384-1d2d16901f79	system	2026-10-08 16:59:26.072+00	\N	2026-10-08 16:59:26.072+00	\N	\N	1	\N	Security Systems	SEC	Cybersecurity products and identity management
\.


--
-- Data for Name: category_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.category_item (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, category_id, name, code, price, image, description, uom) FROM stdin;
01a11c74-9b23-769b-abb2-ce044d3ad1f8	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99e2-7db6-a853-2dd8eeba90a7	Legacy Data Migration	SRV-MIG-DATA	8000.00	crm://2026/01/01//srv_mig.png?name=srv_mig.png	Safe migration from legacy systems	PIECES
01a11c74-9b59-70a3-bbad-432f07b7eaa9	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99ee-7a87-b436-01a4c3683f7c	Advanced Analytics Training	EDU-TR-ANALYT	1800.00	crm://2026/01/01//edu_analyt.png?name=edu_analyt.png	Training on advanced data analytics tools	PIECES
01a11c74-9b01-7a6e-9f5c-982180f5e7a3	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99df-7083-a384-1d2d16901f79	Email Encryption Gateway	SEC-MAIL-ENC	1200.00	crm://2026/01/01//mail_enc.png?name=mail_enc.png	Secure email communication gateway	PIECES
01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99e2-7db6-a853-2dd8eeba90a7	Business Process Audit	SRV-AUDIT-BP	5000.00	crm://2026/01/01//srv_audit.png?name=srv_audit.png	Detailed audit of business processes	PIECES
01a11c74-9ae0-7b06-9f75-388a72935a47	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99d9-7fbe-894f-10b4942ca159	L3 Managed Switch 48-port	NET-SW-48M	1800.00	crm://2026/01/01//sw_48m.png?name=sw_48m.png	Layer 3 managed gigabit switch	PIECES
01a11c74-9aa2-7c45-89a0-cc3ad204df5c	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99cf-7f1e-8701-9ae598e0f74b	Cloud Storage 10TB	CLOUD-STR-10	150.00	crm://2026/01/01//cloud_storage.png?name=cloud_storage.png	Secure enterprise cloud storage	PIECES
01a11c74-9aa9-7574-af9d-89923f6fe277	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99cf-7f1e-8701-9ae598e0f74b	Dedicated Virtual Server	CLOUD-VPS-DED	200.00	crm://2026/01/01//vps_server.png?name=vps_server.png	High-performance dedicated virtual server	PIECES
01a11c74-9a94-73e7-8397-135ecd7c93d2	system	2026-10-08 16:59:26.54+00	\N	2026-10-08 16:59:26.54+00	\N	\N	1	01a11c74-99c7-72d0-819a-c531f9dd9b9e	BI Analytics Suite	SW-BI-SUITE	2500.00	crm://2026/01/01//bi_suite.png?name=bi_suite.png	Advanced business intelligence and data visualization	PIECES
01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99ea-7241-b3ea-e10aeeba0aa0	Hardware Warranty Ext.	SUPP-WAR-EXT	300.00	crm://2026/01/01//supp_war.png?name=supp_war.png	Extended hardware warranty service	PIECES
01a11c74-9a8d-7753-bf02-fecebc85c314	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99c7-72d0-819a-c531f9dd9b9e	ERP Enterprise Edition	SW-ERP-ENT	5000.00	crm://2026/01/01//erp_ent.png?name=erp_ent.png	Complete ERP solution for large enterprises	PIECES
01a11c74-9afa-7a10-a359-68c24ba6200b	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99df-7083-a384-1d2d16901f79	Endpoint Security Solution	SEC-END-SEC	50.00	crm://2026/01/01//end_sec.png?name=end_sec.png	Comprehensive endpoint protection per seat	PIECES
01a11c74-9ac0-705a-b77b-90e6d973386a	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99d5-72c4-bb95-5e3e2ed96482	Enterprise Workstation	HW-WS-ENT	1500.00	crm://2026/01/01//ws_ent.png?name=ws_ent.png	High-end workstation for professionals	PIECES
01a11c74-9aef-757c-81c6-7393bbdaff76	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99d9-7fbe-894f-10b4942ca159	Wi-Fi 6 Access Point	NET-AP-WF6	350.00	crm://2026/01/01//ap_wf6.png?name=ap_wf6.png	Next-gen Wi-Fi 6 access point	PIECES
01a11c74-9a9a-7fb2-9433-db46fa0c796d	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99c7-72d0-819a-c531f9dd9b9e	Marketing Automation Pro	SW-MKT-AUTO	800.00	crm://2026/01/01//mkt_auto.png?name=mkt_auto.png	Professional marketing automation tools	PIECES
01a11c74-9b5e-7e5a-84de-4afadbe1c2d1	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99f3-75a9-af6f-58fc28369f15	Smart Whiteboard 75"	OFF-WBOARD-75	3500.00	crm://2026/01/01//off_wboard.png?name=off_wboard.png	Interactive 75-inch smart whiteboard	PIECES
01a11c74-9b0c-78e5-ad16-58ca00dca852	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99df-7083-a384-1d2d16901f79	Identity & Access Management	SEC-IAM-SUITE	4500.00	crm://2026/01/01//iam_suite.png?name=iam_suite.png	Centralized IAM solution	PIECES
01a11c74-9b07-7768-8594-d3b3b419614d	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99df-7083-a384-1d2d16901f79	DLP Enterprise License	SEC-DLP-ENT	3000.00	crm://2026/01/01//dlp_ent.png?name=dlp_ent.png	Data loss prevention for enterprises	PIECES
01a11c74-9ab0-734b-8667-5bc5f75be1ca	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99cf-7f1e-8701-9ae598e0f74b	Managed Kubernetes Cluster	CLOUD-K8S-MNG	500.00	crm://2026/01/01//k8s_mng.png?name=k8s_mng.png	Fully managed Kubernetes infrastructure	PIECES
01a11c74-9b45-7e08-9848-b60e61ee2eff	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99ee-7a87-b436-01a4c3683f7c	SysAdmin Workshop	EDU-WS-ADM	2000.00	crm://2026/01/01//edu_adm.png?name=edu_adm.png	Intensive workshop for system administrators	PIECES
01a11c74-9adb-7445-9604-6076bda7f586	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99d5-72c4-bb95-5e3e2ed96482	Office Printer Multi	HW-PRN-MULTI	800.00	crm://2026/01/01//prn_multi.png?name=prn_multi.png	All-in-one office printer/scanner	PIECES
01a11c74-9a84-7e24-a767-ff4c2027d614	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99c7-72d0-819a-c531f9dd9b9e	CRM Professional License	SW-CRM-PRO	1200.00	crm://2026/01/01//crm_pro.png?name=crm_pro.png	Full-featured CRM license for professional teams	PIECES
01a11c74-9b52-76c4-bb75-5348e993ed18	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99ee-7a87-b436-01a4c3683f7c	Security Awareness Program	EDU-SEC-AWARE	1500.00	crm://2026/01/01//edu_sec.png?name=edu_sec.png	Enterprise-wide security awareness training	PIECES
01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99f8-7168-83b1-a81445fb1db8	Strategic IT Planning	CONS-IT-STRAT	12000.00	crm://2026/01/01//cons_strat.png?name=cons_strat.png	Expert strategic IT infrastructure planning	PIECES
01a11c74-9ac6-7a20-bca7-4a94860bd785	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99d5-72c4-bb95-5e3e2ed96482	Rackmount Server 2U	HW-SRV-2U	4500.00	crm://2026/01/01//srv_2u.png?name=srv_2u.png	Powerful 2U rackmount server	PIECES
01a11c74-9b75-71ae-ade7-002a1dd64465	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99f3-75a9-af6f-58fc28369f15	Video Conferencing Kit	OFF-VC-KIT	1500.00	crm://2026/01/01//off_vc.png?name=off_vc.png	Complete video conferencing solution	PIECES
01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99f8-7168-83b1-a81445fb1db8	Cybersecurity Risk Assessment	CONS-SEC-RISK	7500.00	crm://2026/01/01//cons_risk.png?name=cons_risk.png	Comprehensive cybersecurity risk analysis	PIECES
01a11c74-9ab6-79e7-8eda-e340999bdfc1	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99cf-7f1e-8701-9ae598e0f74b	Enterprise Email Hosting	CLOUD-MAIL-ENT	5.00	crm://2026/01/01//mail_ent.png?name=mail_ent.png	Secure email hosting per user	PIECES
01a11c74-9b4b-7808-91f2-c8df3d62e63b	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99ee-7a87-b436-01a4c3683f7c	End-user Training	EDU-TR-USER	500.00	crm://2026/01/01//edu_user.png?name=edu_user.png	Comprehensive training for end users	PIECES
01a11c74-9b12-7a2d-a491-e795df55b021	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99e2-7db6-a853-2dd8eeba90a7	CRM Implementation Service	SRV-CRM-IMP	15000.00	crm://2026/01/01//srv_imp.png?name=srv_imp.png	Professional CRM setup and configuration	PIECES
01a11c74-9b89-7195-81fc-ca49e6b351cf	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99f8-7168-83b1-a81445fb1db8	Digital Transformation Roadmap	CONS-DIGI-ROAD	9000.00	crm://2026/01/01//cons_digi.png?name=cons_digi.png	Complete digital transformation strategy	PIECES
01a11c74-9ae9-7774-ac8e-a3745855ada3	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99d9-7fbe-894f-10b4942ca159	Enterprise Edge Router	NET-RTR-ENT	1200.00	crm://2026/01/01//rtr_ent.png?name=rtr_ent.png	High-performance enterprise router	PIECES
01a11c74-9b6f-77db-86d8-b0ff8b1895ad	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99f3-75a9-af6f-58fc28369f15	Document Scanner Pro	OFF-SCAN-PRO	400.00	crm://2026/01/01//off_scan.png?name=off_scan.png	High-speed professional document scanner	PIECES
01a11c74-9acb-7f9d-ac7d-11ca84b2b48d	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99d5-72c4-bb95-5e3e2ed96482	UPS 5kVA	HW-UPS-5K	1200.00	crm://2026/01/01//ups_5k.png?name=ups_5k.png	Uninterruptible power supply 5kVA	PIECES
01a11c74-9af4-78a7-81a4-348c224aaa82	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99d9-7fbe-894f-10b4942ca159	Hardware Firewall Appliance	NET-FW-HW	2500.00	crm://2026/01/01//fw_hw.png?name=fw_hw.png	Advanced hardware security appliance	PIECES
01a11c74-9ad3-7fc2-8917-a4e522e1981f	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99d5-72c4-bb95-5e3e2ed96482	Professional Laptop 16"	HW-LT-16	2200.00	crm://2026/01/01//lt_16.png?name=lt_16.png	Enterprise-grade 16-inch laptop	PIECES
01a11c74-9b28-7e9f-b5df-bf408a68d7ce	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99e2-7db6-a853-2dd8eeba90a7	Custom API Integration	SRV-API-INT	6000.00	crm://2026/01/01//srv_api.png?name=srv_api.png	Custom software integration services	PIECES
01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99ea-7241-b3ea-e10aeeba0aa0	On-site Emergency Response	SUPP-ONSITE-EM	500.00	crm://2026/01/01//supp_onsite.png?name=supp_onsite.png	Emergency on-site technical assistance	PIECES
01a11c74-9b83-706a-ae35-e7566c27728d	system	2026-10-08 16:59:26.551+00	\N	2026-10-08 16:59:26.551+00	\N	\N	1	01a11c74-99f8-7168-83b1-a81445fb1db8	Cloud Readiness Assessment	CONS-CLOUD-READY	4000.00	crm://2026/01/01//cons_cloud.png?name=cons_cloud.png	Assessment of cloud migration readiness	PIECES
01a11c74-9b66-7cb0-9b71-c2b13e389c12	system	2026-10-08 16:59:26.552+00	\N	2026-10-08 16:59:26.552+00	\N	\N	1	01a11c74-99f3-75a9-af6f-58fc28369f15	IP Conference Phone	OFF-CONF-PH	600.00	crm://2026/01/01//off_conf.png?name=off_conf.png	High-quality IP conferencing solution	PIECES
01a11c74-9b2e-702d-9811-c4ee5ad4f08c	system	2026-10-08 16:59:26.553+00	\N	2026-10-08 16:59:26.553+00	\N	\N	1	01a11c74-99ea-7241-b3ea-e10aeeba0aa0	24/7 Premium Support	SUPP-247-PREM	2500.00	crm://2026/01/01//supp_247.png?name=supp_247.png	Round-the-clock priority technical support	PIECES
01a11c74-9b33-77ef-8f8d-dc4d72040378	system	2026-10-08 16:59:26.55+00	\N	2026-10-08 16:59:26.55+00	\N	\N	1	01a11c74-99ea-7241-b3ea-e10aeeba0aa0	Standard Support Yearly	SUPP-STD-YR	1000.00	crm://2026/01/01//supp_std.png?name=supp_std.png	Yearly standard technical support	PIECES
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.client (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, name, full_name, type_, vat_number, reg_number, website, account_manager_id, postal_code, country, city, house, street, apartment) FROM stdin;
01a11c74-9ef1-7106-93d3-8a9df5e4b223	system	2026-10-08 16:59:27.346+00	\N	2026-10-08 16:59:27.346+00	\N	\N	1	Hilpert, Kemmer and Kunze	Hilpert, Kemmer and Kunze	INDIVIDUAL	SG75-8409693	REG-59890	https://hilpert-kemmer-and-kunze.io	a1b2c3d4-e5f6-7890-abcd-ef1234567890	05968	Brunei Darussalam	North Alexisbury	593	Kertzmann Crescent	48
01a11c74-9f31-77fb-a047-051fc4dbeb47	system	2026-10-08 16:59:27.409+00	\N	2026-10-08 16:59:27.409+00	\N	\N	1	Kulas-Luettgen	Kulas-Luettgen	BUSINESS	IE23-4744145	REG-28041	https://kulas-luettgen.biz	b2c3d4e5-f6a7-8901-bcde-f12345678901	81587	Palestinian Territory	Port Marlon	1438	Ledner Forest	30
01a11c74-9f4a-72fd-bbed-cdadd537c3d0	system	2026-10-08 16:59:27.434+00	\N	2026-10-08 16:59:27.434+00	\N	\N	1	Champlin-Reichel	Champlin-Reichel	INDIVIDUAL	AU97-5300778	REG-99932	https://champlin-reichel.net	a1b2c3d4-e5f6-7890-abcd-ef1234567890	39126	Trinidad and Tobago	North Nubia	0213	Felice Court	39
01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	system	2026-10-08 16:59:27.459+00	\N	2026-10-08 16:59:27.459+00	\N	\N	1	Kuvalis, Christiansen and Romaguera	Kuvalis, Christiansen and Romaguera	BUSINESS	US48-4201101	REG-21153	https://kuvalis-christiansen-and-romaguera.biz	a1b2c3d4-e5f6-7890-abcd-ef1234567890	42897	Iran	New Marjoryburgh	1310	Kristofer Bridge	11
01a11c74-9f7f-7235-bac7-fca857bd64c8	system	2026-10-08 16:59:27.487+00	\N	2026-10-08 16:59:27.487+00	\N	\N	1	Bradtke, Kozey and Rosenbaum	Bradtke, Kozey and Rosenbaum	INDIVIDUAL	US45-5750853	REG-15374	https://bradtke-kozey-and-rosenbaum.net	a1b2c3d4-e5f6-7890-abcd-ef1234567890	62639	Norway	Tobiport	0976	Angie Tunnel	28
01a11c74-9fa6-7887-a91e-a2e7b77d6368	system	2026-10-08 16:59:27.527+00	\N	2026-10-08 16:59:27.527+00	\N	\N	1	Zulauf, Kihn and Lakin	Zulauf, Kihn and Lakin	BUSINESS	IE94-4338013	REG-87385	https://zulauf-kihn-and-lakin.net	a1b2c3d4-e5f6-7890-abcd-ef1234567890	85479	Burkina Faso	Johnborough	982	Alberto Viaduct	48
01a11c74-9fd3-72c4-bc60-86e0edb84bf4	system	2026-10-08 16:59:27.571+00	\N	2026-10-08 16:59:27.571+00	\N	\N	1	King-Adams	King-Adams	BUSINESS	ES96-1372869	REG-75946	https://king-adams.com	b2c3d4e5-f6a7-8901-bcde-f12345678901	66901	Ghana	Dwightbury	490	Simonis Road	36
01a11c74-9ffa-784d-b037-4570b6b01a46	system	2026-10-08 16:59:27.611+00	\N	2026-10-08 16:59:27.611+00	\N	\N	1	Kling, Kuhn and VonRueden	Kling, Kuhn and VonRueden	INDIVIDUAL	CA25-1314736	REG-44547	https://kling-kuhn-and-vonrueden.com	a1b2c3d4-e5f6-7890-abcd-ef1234567890	12535	Mayotte	New Ellenland	29375	Lenita Forks	19
01a11c74-a012-7ab8-840c-0c26f7b71e06	system	2026-10-08 16:59:27.635+00	\N	2026-10-08 16:59:27.635+00	\N	\N	1	Dooley, Jacobs and O'Conner	Dooley, Jacobs and O'Conner	INDIVIDUAL	AU85-3840339	REG-46448	https://dooley-jacobs-and-o-conner.net	b2c3d4e5-f6a7-8901-bcde-f12345678901	33093	Central African Republic	Port Marielview	15944	Rutherford Loop	26
01a11c74-a02d-7f47-aaef-74c827bc3bc4	system	2026-10-08 16:59:27.662+00	\N	2026-10-08 16:59:27.662+00	\N	\N	1	Connelly LLC	Connelly LLC	BUSINESS	PL23-9576256	REG-33469	https://connelly-llc.co	a1b2c3d4-e5f6-7890-abcd-ef1234567890	57623	Paraguay	East Waylon	463	Kiehn Islands	29
01a11c74-a04c-7424-a2b7-311cf2cfac67	system	2026-10-08 16:59:27.692+00	\N	2026-10-08 16:59:27.692+00	\N	\N	1	Strosin Inc	Strosin Inc	INDIVIDUAL	ES25-2838704	REG-24890	https://strosin-inc.io	b2c3d4e5-f6a7-8901-bcde-f12345678901	50763	Morocco	Lake Cherlynview	277	Wuckert Walks	4
01a11c74-a06f-7887-860c-5b72f3a1fc25	system	2026-10-08 16:59:27.728+00	\N	2026-10-08 16:59:27.728+00	\N	\N	1	Rogahn, Klocko and Hills	Rogahn, Klocko and Hills	INDIVIDUAL	SE24-7539646	REG-99791	https://rogahn-klocko-and-hills.io	a1b2c3d4-e5f6-7890-abcd-ef1234567890	68449	Cameroon	Xiomaraberg	83112	Ebert Coves	16
01a11c74-a08d-77eb-941f-009a8b83b02d	system	2026-10-08 16:59:27.758+00	\N	2026-10-08 16:59:27.758+00	\N	\N	1	Osinski-Keeling	Osinski-Keeling	BUSINESS	NO59-7592958	REG-92192	https://osinski-keeling.biz	b2c3d4e5-f6a7-8901-bcde-f12345678901	23293	Lesotho	East Lupechester	868	Collins Spring	31
01a11c74-a0aa-7bef-b23d-f90abd65e0a9	system	2026-10-08 16:59:27.787+00	\N	2026-10-08 16:59:27.787+00	\N	\N	1	Lubowitz Inc	Lubowitz Inc	BUSINESS	NL94-4178522	REG-18083	https://lubowitz-inc.biz	a1b2c3d4-e5f6-7890-abcd-ef1234567890	18293	Rwanda	New Jenaeview	4280	Flatley Pass	36
01a11c74-a0be-7f47-beab-8600ed3193cb	system	2026-10-08 16:59:27.807+00	\N	2026-10-08 16:59:27.807+00	\N	\N	1	McDermott-Kub	McDermott-Kub	BUSINESS	DE42-9244086	REG-18544	https://mcdermott-kub.co	b2c3d4e5-f6a7-8901-bcde-f12345678901	05589	Greece	Walshport	9842	Kling Locks	32
01a11c74-a0d6-7d2f-9560-f0f62699d2e2	system	2026-10-08 16:59:27.831+00	\N	2026-10-08 16:59:27.831+00	\N	\N	1	Feest-Lockman	Feest-Lockman	INDIVIDUAL	SE90-1488817	REG-52755	https://feest-lockman.biz	b2c3d4e5-f6a7-8901-bcde-f12345678901	08475	India	New Laylaton	0799	Loriann Ferry	17
01a11c74-a0f0-7a76-afc1-0332e0e65590	system	2026-10-08 16:59:27.857+00	\N	2026-10-08 16:59:27.857+00	\N	\N	1	Jakubowski-Graham	Jakubowski-Graham	INDIVIDUAL	NL28-5174186	REG-63036	https://jakubowski-graham.co	a1b2c3d4-e5f6-7890-abcd-ef1234567890	57677	Sierra Leone	North Omaview	40050	Kovacek Squares	12
01a11c74-a107-7506-9b81-75b858244b15	system	2026-10-08 16:59:27.879+00	\N	2026-10-08 16:59:27.879+00	\N	\N	1	Batz-Goldner	Batz-Goldner	BUSINESS	CA82-9148125	REG-52867	https://batz-goldner.com	b2c3d4e5-f6a7-8901-bcde-f12345678901	81810	Kyrgyz Republic	Port Nobukoton	326	Rippin Ranch	24
01a11c74-a11e-7639-9fdf-1699b47e1124	system	2026-10-08 16:59:27.902+00	\N	2026-10-08 16:59:27.902+00	\N	\N	1	Stokes Inc	Stokes Inc	BUSINESS	SG70-4904311	REG-90828	https://stokes-inc.net	a1b2c3d4-e5f6-7890-abcd-ef1234567890	81801	China	South Sharynchester	248	Ilse Inlet	34
01a11c74-a139-74d9-b074-88a64f49a13f	system	2026-10-08 16:59:27.929+00	\N	2026-10-08 16:59:27.929+00	\N	\N	1	Carter, Stracke and Ebert	Carter, Stracke and Ebert	BUSINESS	IT83-1768346	REG-23889	https://carter-stracke-and-ebert.biz	b2c3d4e5-f6a7-8901-bcde-f12345678901	60646	Anguilla	Leonardland	782	Necole Parkways	41
01a11c74-a14d-79f7-98a2-9e31e19c3c24	system	2026-10-08 16:59:27.95+00	\N	2026-10-08 16:59:27.95+00	\N	\N	1	Hand LLC	Hand LLC	INDIVIDUAL	NO78-9545301	REG-26210	https://hand-llc.co	b2c3d4e5-f6a7-8901-bcde-f12345678901	39209	Burkina Faso	Joystad	06116	Pfeffer Plain	39
01a11c74-a163-7b85-a43c-74a51a5feb0c	system	2026-10-08 16:59:27.972+00	\N	2026-10-08 16:59:27.972+00	\N	\N	1	Kshlerin LLC	Kshlerin LLC	BUSINESS	NL66-5684217	REG-35141	https://kshlerin-llc.biz	b2c3d4e5-f6a7-8901-bcde-f12345678901	25857	Libyan Arab Jamahiriya	North Freda	3437	Prohaska Estate	29
01a11c74-a179-7347-a816-c242e83d8357	system	2026-10-08 16:59:27.993+00	\N	2026-10-08 16:59:27.993+00	\N	\N	1	Dietrich, Schiller and Ruecker	Dietrich, Schiller and Ruecker	INDIVIDUAL	JP66-5120960	REG-37532	https://dietrich-schiller-and-ruecker.net	b2c3d4e5-f6a7-8901-bcde-f12345678901	61743	Haiti	North Hsiu	2146	Virgina Via	48
01a11c74-a193-76fd-94e9-0b29a9032f4a	system	2026-10-08 16:59:28.019+00	\N	2026-10-08 16:59:28.019+00	\N	\N	1	Bosco, Block and Renner	Bosco, Block and Renner	BUSINESS	ES29-1906811	REG-48963	https://bosco-block-and-renner.com	a1b2c3d4-e5f6-7890-abcd-ef1234567890	93467	Denmark	Kenethside	07219	Rowe Ville	42
01a11c74-a1ac-74c8-b2a9-08d0dc87345c	system	2026-10-08 16:59:28.044+00	\N	2026-10-08 16:59:28.044+00	\N	\N	1	Hackett, Corkery and Mraz	Hackett, Corkery and Mraz	INDIVIDUAL	NO34-4506763	REG-69894	https://hackett-corkery-and-mraz.co	b2c3d4e5-f6a7-8901-bcde-f12345678901	50151	Burkina Faso	New Aline	318	Hamill Hills	21
01a11c74-a1c6-74e5-90c9-0982c31c1520	system	2026-10-08 16:59:28.07+00	\N	2026-10-08 16:59:28.07+00	\N	\N	1	Gibson-Wintheiser	Gibson-Wintheiser	INDIVIDUAL	FR31-3063589	REG-84345	https://gibson-wintheiser.com	b2c3d4e5-f6a7-8901-bcde-f12345678901	72325	Argentina	Port Taneka	14248	Deckow Wells	22
01a11c74-a1e6-72ed-986f-245eeed408fb	system	2026-10-08 16:59:28.102+00	\N	2026-10-08 16:59:28.102+00	\N	\N	1	Ward-McDermott	Ward-McDermott	BUSINESS	PL79-4432528	REG-77456	https://ward-mcdermott.biz	b2c3d4e5-f6a7-8901-bcde-f12345678901	88458	French Polynesia	Wunschmouth	777	Fisher Pine	34
01a11c74-a1ff-7785-9788-e74ef0b4c9c4	system	2026-10-08 16:59:28.127+00	\N	2026-10-08 16:59:28.127+00	\N	\N	1	Schroeder Group	Schroeder Group	INDIVIDUAL	PL63-4066620	REG-66567	https://schroeder-group.net	b2c3d4e5-f6a7-8901-bcde-f12345678901	43312	Ghana	East Arnita	47959	Bailey Trail	21
01a11c74-a216-77ce-baef-4da7e1148c67	system	2026-10-08 16:59:28.151+00	\N	2026-10-08 16:59:28.151+00	\N	\N	1	Thompson LLC	Thompson LLC	INDIVIDUAL	JP59-6856578	REG-67718	https://thompson-llc.biz	a1b2c3d4-e5f6-7890-abcd-ef1234567890	87607	Saint Pierre and Miquelon	West Twannastad	8155	Marcelo Lane	26
01a11c74-a230-7249-85d3-fd922929da03	system	2026-10-08 16:59:28.176+00	\N	2026-10-08 16:59:28.176+00	\N	\N	1	Kris, Skiles and Hagenes	Kris, Skiles and Hagenes	BUSINESS	SG74-6891561	REG-32929	https://kris-skiles-and-hagenes.net	b2c3d4e5-f6a7-8901-bcde-f12345678901	37475	Estonia	South Merri	231	Ryan Lake	7
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, client_id, person, position_, start_date, end_date, phone, email) FROM stdin;
01a11c74-a253-7f43-89b0-f374d99d8749	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0be-7f47-beab-8600ed3193cb	Noel Senger	Project Manager	2026-02-14	2026-11-15	(505) 638-0165	noel.senger@mcdermott-kub.co
01a11c74-a254-7353-9aa5-6aed4019f7ca	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0f0-7a76-afc1-0332e0e65590	Aurelio Lesch	Finance Manager	2026-05-07	2027-06-07	(636) 279-2458	aurelio.lesch@jakubowski-graham.co
01a11c74-a252-71a9-a1ac-a9142621b3f7	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9fa6-7887-a91e-a2e7b77d6368	Lang Turcotte	Finance Manager	2025-05-02	\N	(505) 664-1379	lang.turcotte@zulauf-kihn-and-lakin.net
01a11c74-a253-7e41-89af-ae10d2d5443b	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0be-7f47-beab-8600ed3193cb	Larue Reinger	Operations Manager	2026-04-16	2027-09-16	(872) 527-9433	larue.reinger@mcdermott-kub.co
01a11c74-a254-7758-9aa9-fc918d4582b6	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a107-7506-9b81-75b858244b15	Junior Langosh	Head of Procurement	2025-07-28	\N	(305) 200-1681	junior.langosh@batz-goldner.com
01a11c74-a251-7f74-a754-f632a9bcfa31	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9f7f-7235-bac7-fca857bd64c8	Richie Flatley	Head of Procurement	2024-10-29	2026-01-28	(305) 807-6354	richie.flatley@bradtke-kozey-and-rosenbaum.net
01a11c74-a253-7d3f-89ae-70b6726f55e1	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	Evelyn Pouros	Head of Procurement	2025-10-26	2026-06-27	(505) 609-0882	evelyn.pouros@lubowitz-inc.biz
01a11c74-a251-7a39-a74f-1da3de25c12c	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9f4a-72fd-bbed-cdadd537c3d0	Candida Harvey	CIO	2025-07-20	2026-03-20	(580) 513-1122	candida.harvey@champlin-reichel.net
01a11c74-a255-70b8-9e2d-f8ec4163a369	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a163-7b85-a43c-74a51a5feb0c	Chong Reichel	Project Manager	2025-12-17	2027-05-19	(983) 250-3074	chong.reichel@kshlerin-llc.biz
01a11c74-a255-7a66-9e37-6cf203cf4b10	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a1c6-74e5-90c9-0982c31c1520	Logan Mills	CIO	2025-06-27	2026-08-28	(983) 391-6249	logan.mills@gibson-wintheiser.com
01a11c74-a255-769f-9e33-940beffe1b3d	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a193-76fd-94e9-0b29a9032f4a	Val Botsford	IT Specialist	2025-03-09	2025-07-09	(307) 772-0404	val.botsford@bosco-block-and-renner.com
01a11c74-a252-76e5-a1b1-7f7f74a86595	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9ffa-784d-b037-4570b6b01a46	Brain Koch	CTO	2025-06-01	2026-05-01	(505) 668-3317	brain.koch@kling-kuhn-and-vonrueden.com
01a11c74-a255-71b6-9e2e-595ed0c97c06	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a163-7b85-a43c-74a51a5feb0c	Deshawn Zboncak	Head of Procurement	2025-12-16	2026-02-15	(808) 532-4112	deshawn.zboncak@kshlerin-llc.biz
01a11c74-a255-7b68-9e38-028b5f034295	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a1e6-72ed-986f-245eeed408fb	Kiley Breitenberg	Head of Procurement	2026-04-16	2026-09-16	(305) 310-4225	kiley.breitenberg@ward-mcdermott.biz
01a11c74-a253-749f-89a8-92c36d6fcdea	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a04c-7424-a2b7-311cf2cfac67	Arlen Kihn	Finance Manager	2024-10-11	2025-05-13	(305) 202-7134	arlen.kihn@strosin-inc.io
01a11c74-a253-7835-89aa-7e8804a23b67	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a08d-77eb-941f-009a8b83b02d	Jerry Goldner	CTO	2026-01-27	\N	(305) 272-4167	jerry.goldner@osinski-keeling.biz
01a11c74-a254-7cf1-9aae-7c4c28219722	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a14d-79f7-98a2-9e31e19c3c24	January Jaskolski	IT Specialist	2026-08-08	2026-10-06	(686) 292-2090	january.jaskolski@hand-llc.co
01a11c74-a252-709b-a1ab-6157ca016c31	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9fa6-7887-a91e-a2e7b77d6368	Lilliam Hoppe	IT Specialist	2026-06-15	2027-07-15	(515) 290-7253	lilliam.hoppe@zulauf-kihn-and-lakin.net
01a11c74-a252-7c4d-a1b6-f3b243daf767	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a04c-7424-a2b7-311cf2cfac67	Tyrone Lesch	HR Lead	2025-11-29	2026-09-01	(305) 279-3306	tyrone.lesch@strosin-inc.io
01a11c74-a252-78ed-a1b3-b58f48bb9394	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-a012-7ab8-840c-0c26f7b71e06	Martina Pfeffer	CIO	2026-08-03	\N	(305) 206-1995	martina.pfeffer@dooley-jacobs-and-o-conner.net
01a11c74-a252-7a24-a1b4-f35bad4b6c41	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-a02d-7f47-aaef-74c827bc3bc4	Willis Anderson	IT Specialist	2026-02-20	\N	(561) 316-0333	willis.anderson@connelly-llc.co
01a11c74-a254-7a6a-9aac-3abfa81b85b9	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a139-74d9-b074-88a64f49a13f	Edison Howell	Operations Manager	2025-06-03	2026-01-31	(983) 749-4067	edison.howell@carter-stracke-and-ebert.biz
01a11c74-a254-7251-9aa4-160a03ad9372	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	Davis Rice	CTO	2026-08-31	2027-09-28	(985) 491-7962	davis.rice@feest-lockman.biz
01a11c74-a255-73ba-9e30-e57763e2a03f	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a179-7347-a816-c242e83d8357	Dortha Schuppe	Finance Manager	2024-10-26	2025-11-25	(505) 244-8813	dortha.schuppe@dietrich-schiller-and-ruecker.net
01a11c74-a256-7066-b92a-94643cecb9e3	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a230-7249-85d3-fd922929da03	Augusta Torp	CTO	2026-04-04	2026-12-02	(472) 298-6088	augusta.torp@kris-skiles-and-hagenes.net
01a11c74-a256-7168-b92b-d280be114a2f	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a230-7249-85d3-fd922929da03	Darcie Keebler	CTO	2026-04-26	\N	(472) 720-9749	darcie.keebler@kris-skiles-and-hagenes.net
01a11c74-a254-7051-9aa2-e6424c76fa42	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	Hunter Howell	Head of Procurement	2025-05-28	2025-10-26	(520) 784-2587	hunter.howell@feest-lockman.biz
01a11c74-a254-7fc6-9ab1-fdf32b661bc5	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a163-7b85-a43c-74a51a5feb0c	Lekisha Lesch	Head of Procurement	2024-12-02	\N	(305) 202-2366	lekisha.lesch@kshlerin-llc.biz
01a11c74-a253-7aa3-89ac-4438fce6278d	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a08d-77eb-941f-009a8b83b02d	Teena Hammes	IT Specialist	2024-10-28	2024-12-28	(505) 634-9653	teena.hammes@osinski-keeling.biz
01a11c74-a251-7b43-a750-4f51f36ace59	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9f4a-72fd-bbed-cdadd537c3d0	Emil Schimmel	HR Lead	2026-08-15	2027-11-13	(505) 618-1113	emil.schimmel@champlin-reichel.net
01a11c74-a254-7445-9aa6-a9eaa4d4c72d	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0f0-7a76-afc1-0332e0e65590	Charisse Toy	Finance Manager	2026-07-24	2027-02-21	(954) 819-7934	charisse.toy@jakubowski-graham.co
01a11c74-a255-7c66-9e39-3b55e295ebb4	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	Johnathon Berge	CIO	2025-05-15	2026-01-13	(305) 277-1887	johnathon.berge@schroeder-group.net
01a11c74-a252-73be-a1ae-d89472bdca3f	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	Ellsworth Dickinson	Head of Procurement	2026-07-28	\N	(484) 554-8720	ellsworth.dickinson@king-adams.com
01a11c74-a255-7799-9e34-b8e087fc0b8c	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	Belva Schoen	Operations Manager	2025-05-17	2025-09-17	(274) 245-5518	belva.schoen@hackett-corkery-and-mraz.co
01a11c74-a254-7bf7-9aad-82869745f6bc	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a139-74d9-b074-88a64f49a13f	Ezra Leffler	CIO	2026-05-09	2027-05-09	(274) 212-7595	ezra.leffler@carter-stracke-and-ebert.biz
01a11c74-a253-7c24-89ad-709b6c4c0c9e	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	Ermelinda Raynor	CIO	2025-02-19	\N	(505) 971-1604	ermelinda.raynor@lubowitz-inc.biz
01a11c74-a255-7974-9e36-1a8b8e06034e	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	Glinda Kertzmann	Project Manager	2025-03-19	\N	(505) 683-7550	glinda.kertzmann@hackett-corkery-and-mraz.co
01a11c74-a253-76e1-89a9-fe5decf6a224	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a06f-7887-860c-5b72f3a1fc25	Julienne Huel	CIO	2026-04-17	\N	(505) 671-4234	julienne.huel@rogahn-klocko-and-hills.io
01a11c74-a254-7de7-9aaf-086de15ada3e	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a14d-79f7-98a2-9e31e19c3c24	Cinda Hammes	Operations Manager	2025-11-26	\N	(505) 642-4646	cinda.hammes@hand-llc.co
01a11c74-a254-7656-9aa8-2a36cc672229	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a107-7506-9b81-75b858244b15	Myrtice McClure	CTO	2024-10-27	2024-12-27	(505) 949-4015	myrtice.mcclure@batz-goldner.com
01a11c74-a252-72b0-a1ad-7860094f8e2d	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	Kim Conn	HR Lead	2025-03-27	\N	(983) 928-4334	kim.conn@king-adams.com
01a11c74-a252-74c0-a1af-3ec587cf5e00	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	Zachery Bednar	Project Manager	2024-10-16	\N	(305) 648-3358	zachery.bednar@king-adams.com
01a11c74-a251-71df-a74a-993f90361f79	system	2026-10-08 16:59:28.216+00	\N	2026-10-08 16:59:28.216+00	\N	\N	1	01a11c74-9ef1-7106-93d3-8a9df5e4b223	Morris Krajcik	Operations Manager	2026-09-23	\N	(983) 226-6698	morris.krajcik@hilpert-kemmer-and-kunze.io
01a11c74-a255-7f64-9e3c-fdf12628c397	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a216-77ce-baef-4da7e1148c67	Sandy Kuhic	Head of Procurement	2024-12-31	2026-03-02	(959) 416-8943	sandy.kuhic@thompson-llc.biz
01a11c74-a255-75b2-9e32-c8c863183e13	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a193-76fd-94e9-0b29a9032f4a	Darla Altenwerth	Finance Manager	2025-12-10	\N	(274) 269-4981	darla.altenwerth@bosco-block-and-renner.com
01a11c74-a254-7153-9aa3-c5356e57004c	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	Carey Von	CTO	2025-12-25	\N	(305) 949-9051	carey.von@feest-lockman.biz
01a11c74-a254-7558-9aa7-b65224b32f0d	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a0f0-7a76-afc1-0332e0e65590	Lawerence Carter	CIO	2026-09-04	\N	(274) 283-0827	lawerence.carter@jakubowski-graham.co
01a11c74-a254-7ed4-9ab0-84f5166b827a	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a14d-79f7-98a2-9e31e19c3c24	Christene Kulas	CTO	2025-09-21	2026-12-22	(505) 648-4337	christene.kulas@hand-llc.co
01a11c74-a251-7933-a74e-71d016aeef35	system	2026-10-08 16:59:28.221+00	\N	2026-10-08 16:59:28.221+00	\N	\N	1	01a11c74-9f4a-72fd-bbed-cdadd537c3d0	Ernest Gusikowski	Operations Manager	2025-03-09	\N	(305) 268-9785	ernest.gusikowski@champlin-reichel.net
01a11c74-a255-74c0-9e31-55c3a5432a96	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a179-7347-a816-c242e83d8357	Isaiah Wiza	IT Specialist	2026-06-19	\N	(505) 668-5741	isaiah.wiza@dietrich-schiller-and-ruecker.net
01a11c74-a253-7958-89ab-bc3ba162c36b	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a08d-77eb-941f-009a8b83b02d	Shantel Haley	Operations Manager	2025-06-13	\N	(983) 337-4151	shantel.haley@osinski-keeling.biz
01a11c74-a251-7c5a-a751-f34aa460f001	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	Tommy Marquardt	IT Specialist	2025-11-27	\N	(274) 203-6738	tommy.marquardt@kuvalis-christiansen-and-romaguera.biz
01a11c74-a254-784d-9aaa-b06251396222	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a11e-7639-9fdf-1699b47e1124	Stanford Hyatt	Operations Manager	2025-04-21	2025-09-19	(305) 952-9462	stanford.hyatt@stokes-inc.net
01a11c74-a255-7887-9e35-5ce7b8c502c1	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	Cherise Schowalter	HR Lead	2025-10-15	\N	(505) 624-7379	cherise.schowalter@hackett-corkery-and-mraz.co
01a11c74-a252-7b33-a1b5-0390eae5334f	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a02d-7f47-aaef-74c827bc3bc4	Adrianna Reichert	Finance Manager	2025-02-27	2026-02-27	(505) 648-6910	adrianna.reichert@connelly-llc.co
01a11c74-a255-7d5c-9e3a-ac0a4cb958dd	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	Laurena Hickle	Finance Manager	2024-12-09	2025-07-11	(708) 535-7307	laurena.hickle@schroeder-group.net
01a11c74-a251-7d60-a752-3616bed8d429	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9f7f-7235-bac7-fca857bd64c8	James Bechtelar	Project Manager	2025-05-09	2026-03-09	(305) 434-8976	james.bechtelar@bradtke-kozey-and-rosenbaum.net
01a11c74-a251-7706-a74c-12cfd806c03a	system	2026-10-08 16:59:28.221+00	\N	2026-10-08 16:59:28.221+00	\N	\N	1	01a11c74-9f31-77fb-a047-051fc4dbeb47	Ricardo Gaylord	Project Manager	2026-08-10	2026-10-08	(505) 675-9402	ricardo.gaylord@kulas-luettgen.biz
01a11c74-a255-7e56-9e3b-e130bcec5fde	system	2026-10-08 16:59:28.225+00	\N	2026-10-08 16:59:28.225+00	\N	\N	1	01a11c74-a216-77ce-baef-4da7e1148c67	Rodger Dickens	Finance Manager	2026-07-13	\N	(505) 644-2436	rodger.dickens@thompson-llc.biz
01a11c74-a252-75c6-a1b0-0f04e9b8beca	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9ffa-784d-b037-4570b6b01a46	Wiley Baumbach	Operations Manager	2026-09-04	2026-11-02	(447) 691-9301	wiley.baumbach@kling-kuhn-and-vonrueden.com
01a11c74-a254-7964-9aab-1c1d27beda56	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a11e-7639-9fdf-1699b47e1124	Elina Marquardt	CTO	2025-11-07	2025-12-07	(505) 646-0705	elina.marquardt@stokes-inc.net
01a11c74-a253-7097-89a7-409203318ed6	system	2026-10-08 16:59:28.223+00	\N	2026-10-08 16:59:28.223+00	\N	\N	1	01a11c74-a04c-7424-a2b7-311cf2cfac67	Judson Adams	CTO	2025-06-19	2025-08-19	(337) 718-0253	judson.adams@strosin-inc.io
01a11c74-a251-75c2-a74b-f1508c936254	system	2026-10-08 16:59:28.221+00	\N	2026-10-08 16:59:28.221+00	\N	\N	1	01a11c74-9ef1-7106-93d3-8a9df5e4b223	Alvin Deckow	CIO	2025-06-04	2026-01-02	(505) 643-5223	alvin.deckow@hilpert-kemmer-and-kunze.io
01a11c74-a251-7e5a-a753-f6fc8ab79acc	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-9f7f-7235-bac7-fca857bd64c8	Lilly Stanton	IT Specialist	2026-01-04	2026-08-06	(305) 207-6963	lilly.stanton@bradtke-kozey-and-rosenbaum.net
01a11c74-a252-77e7-a1b2-39d9f6b28137	system	2026-10-08 16:59:28.222+00	\N	2026-10-08 16:59:28.222+00	\N	\N	1	01a11c74-a012-7ab8-840c-0c26f7b71e06	Chuck Schmeler	IT Specialist	2025-05-23	2025-06-22	(274) 204-5496	chuck.schmeler@dooley-jacobs-and-o-conner.net
01a11c74-a255-72ac-9e2f-130b5b923c3f	system	2026-10-08 16:59:28.224+00	\N	2026-10-08 16:59:28.224+00	\N	\N	1	01a11c74-a179-7347-a816-c242e83d8357	Tobias Dickinson	IT Specialist	2024-12-18	2026-04-19	(305) 636-0309	tobias.dickinson@dietrich-schiller-and-ruecker.net
01a11c74-a251-781c-a74d-119f56237c0f	system	2026-10-08 16:59:28.221+00	\N	2026-10-08 16:59:28.221+00	\N	\N	1	01a11c74-9f31-77fb-a047-051fc4dbeb47	Shon Hilpert	Head of Procurement	2025-06-20	\N	(305) 983-8800	shon.hilpert@kulas-luettgen.biz
\.


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.invoice (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, number, client_id, order_id, date_, due_date, subtotal, vat, total, status) FROM stdin;
01a11c74-d461-710a-bc92-efa78f3b7f52	system	2026-10-08 16:59:41.033+00	\N	2026-10-08 16:59:41.033+00	\N	\N	1	INV-1000	01a11c74-9ef1-7106-93d3-8a9df5e4b223	01a11c74-a377-7506-b064-832c07a347f8	2026-07-25	2026-08-10	6033960.00	1206792.00	7240752.00	30
01a11c74-d4ca-716c-a5e5-760e41572ce7	system	2026-10-08 16:59:41.131+00	\N	2026-10-08 16:59:41.131+00	\N	\N	1	INV-1001	01a11c74-9ef1-7106-93d3-8a9df5e4b223	01a11c74-a37a-7716-95ba-97f16ff1ab2c	2026-09-06	2026-09-17	1177200.00	235440.00	1412640.00	30
01a11c74-d510-7866-9f4e-8065b12193c1	system	2026-10-08 16:59:41.212+00	\N	2026-10-08 16:59:41.212+00	\N	\N	1	INV-1002	01a11c74-9ef1-7106-93d3-8a9df5e4b223	01a11c74-a37a-7cc0-95be-9c866039a521	2026-06-22	2026-07-07	2745288.00	549057.60	3294345.60	30
01a11c74-d56f-7831-ae21-f80e9b502642	system	2026-10-08 16:59:41.297+00	\N	2026-10-08 16:59:41.297+00	\N	\N	1	INV-1003	01a11c74-9ef1-7106-93d3-8a9df5e4b223	01a11c74-a37b-7b85-a9b6-dd9aeed6bf04	2026-08-23	2026-09-06	2663400.00	532680.00	3196080.00	40
01a11c74-d5b1-7641-b319-b2b51f26afc1	system	2026-10-08 16:59:41.362+00	\N	2026-10-08 16:59:41.362+00	\N	\N	1	INV-1004	01a11c74-9f31-77fb-a047-051fc4dbeb47	01a11c74-a37c-7c5a-8c17-d59251ec41ef	2026-10-02	2026-10-15	4863780.00	972756.00	5836536.00	40
01a11c74-d5fa-72a7-a538-58cdec79bc0a	system	2026-10-08 16:59:41.435+00	\N	2026-10-08 16:59:41.435+00	\N	\N	1	INV-1005	01a11c74-9f31-77fb-a047-051fc4dbeb47	01a11c74-a37e-75f7-ba20-8e7877089db2	2026-06-07	2026-06-19	3249000.00	649800.00	3898800.00	30
01a11c74-d636-77b2-b814-6f2eeb35e9fd	system	2026-10-08 16:59:41.495+00	\N	2026-10-08 16:59:41.495+00	\N	\N	1	INV-1006	01a11c74-9f31-77fb-a047-051fc4dbeb47	01a11c74-a37f-71a1-b2c1-06eaa2183b01	2026-08-09	2026-09-01	3079944.00	615988.80	3695932.80	30
01a11c74-d681-7856-a4f0-a817de5243cc	system	2026-10-08 16:59:41.571+00	\N	2026-10-08 16:59:41.571+00	\N	\N	1	INV-1007	01a11c74-9f31-77fb-a047-051fc4dbeb47	01a11c74-a380-704d-b5ae-c3dbddabdc3e	2025-06-25	2025-08-08	2811000.00	562200.00	3373200.00	30
01a11c74-d6c8-74fd-ac78-4b0baf1e230b	system	2026-10-08 16:59:41.641+00	\N	2026-10-08 16:59:41.641+00	\N	\N	1	INV-1008	01a11c74-9f31-77fb-a047-051fc4dbeb47	01a11c74-a381-7c24-9054-e89ec26a9ace	2026-09-14	2026-10-07	5118900.00	1023780.00	6142680.00	40
01a11c74-d712-74f1-a823-2a586e858afc	system	2026-10-08 16:59:41.715+00	\N	2026-10-08 16:59:41.715+00	\N	\N	1	INV-1009	01a11c74-9f4a-72fd-bbed-cdadd537c3d0	01a11c74-a382-7ae5-82e2-3ecfbf218ac0	2026-09-26	2026-10-13	3355800.00	671160.00	4026960.00	40
01a11c74-d75c-7f26-b433-08b95b5c8be9	system	2026-10-08 16:59:41.79+00	\N	2026-10-08 16:59:41.79+00	\N	\N	1	INV-1010	01a11c74-9f4a-72fd-bbed-cdadd537c3d0	01a11c74-a383-78e1-a983-80884ce4b713	2026-10-09	2026-10-24	4440600.00	888120.00	5328720.00	20
01a11c74-d79f-7ea3-8117-25d6bb41faab	system	2026-10-08 16:59:41.857+00	\N	2026-10-08 16:59:41.857+00	\N	\N	1	INV-1011	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	01a11c74-a384-77d2-8d17-e5d37a5448b3	2026-10-05	2026-10-20	3898800.00	779760.00	4678560.00	40
01a11c74-d7e8-73db-85b4-981cdc985f1d	system	2026-10-08 16:59:41.929+00	\N	2026-10-08 16:59:41.929+00	\N	\N	1	INV-1012	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	01a11c74-a385-712b-bf22-57b9a2ac61e9	2026-09-11	2026-10-06	3129600.00	625920.00	3755520.00	30
01a11c74-d82f-728f-8b18-4319e427e8bf	system	2026-10-08 16:59:42+00	\N	2026-10-08 16:59:42+00	\N	\N	1	INV-1013	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	01a11c74-a385-7d9d-bf2e-03d2c27493b6	2026-09-15	2026-10-10	4143360.00	828672.00	4972032.00	40
01a11c74-d883-7824-bbc4-3ea17c5b65b9	system	2026-10-08 16:59:42.084+00	\N	2026-10-08 16:59:42.084+00	\N	\N	1	INV-1014	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	01a11c74-a386-7c00-a181-870faca582b1	2026-08-02	2026-08-26	1009200.00	201840.00	1211040.00	30
01a11c74-d8ce-75a1-aa38-1d628c851f1e	system	2026-10-08 16:59:42.159+00	\N	2026-10-08 16:59:42.159+00	\N	\N	1	INV-1015	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	01a11c74-a387-710e-8607-ea156f0bc9f7	2026-07-13	2026-08-02	3432600.00	686520.00	4119120.00	40
01a11c74-d913-7be7-b227-26ebdc841e4c	system	2026-10-08 16:59:42.228+00	\N	2026-10-08 16:59:42.228+00	\N	\N	1	INV-1016	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	01a11c74-a387-7d3f-8613-ac5d86395f63	2026-09-07	2026-09-25	2591400.00	518280.00	3109680.00	30
01a11c74-d949-7e31-84b4-196a4a6e3dc4	system	2026-10-08 16:59:42.283+00	\N	2026-10-08 16:59:42.283+00	\N	\N	1	INV-1017	01a11c74-9f7f-7235-bac7-fca857bd64c8	01a11c74-a389-7eb8-bcd5-97bdc1af96fb	2026-07-06	2026-07-24	2240732.00	448146.40	2688878.40	40
01a11c74-d98c-7410-b7da-6c3309103fb2	system	2026-10-08 16:59:42.349+00	\N	2026-10-08 16:59:42.349+00	\N	\N	1	INV-1018	01a11c74-9f7f-7235-bac7-fca857bd64c8	01a11c74-a38b-7645-971d-7660dc232eec	2026-09-01	2026-09-17	3454200.00	690840.00	4145040.00	30
01a11c74-d9d0-799d-bfa3-167bbe7b4e41	system	2026-10-08 16:59:42.418+00	\N	2026-10-08 16:59:42.418+00	\N	\N	1	INV-1019	01a11c74-9f7f-7235-bac7-fca857bd64c8	01a11c74-a38c-717c-ad15-08b5568dd61e	2026-07-06	2026-08-05	1911000.00	382200.00	2293200.00	40
01a11c74-da10-73c2-b013-e265cd531402	system	2026-10-08 16:59:42.481+00	\N	2026-10-08 16:59:42.481+00	\N	\N	1	INV-1020	01a11c74-9f7f-7235-bac7-fca857bd64c8	01a11c74-a38d-7297-891b-00b18133b34f	2026-05-06	2026-05-27	3772620.00	754524.00	4527144.00	40
01a11c74-da5e-7ce5-9443-0ac78de95b42	system	2026-10-08 16:59:42.559+00	\N	2026-10-08 16:59:42.559+00	\N	\N	1	INV-1021	01a11c74-9f7f-7235-bac7-fca857bd64c8	01a11c74-a38e-7560-9027-f597d13890d5	2026-09-24	2026-10-23	2966400.00	593280.00	3559680.00	20
01a11c74-da9c-7181-8233-15a4a67ee71d	system	2026-10-08 16:59:42.621+00	\N	2026-10-08 16:59:42.621+00	\N	\N	1	INV-1022	01a11c74-9fa6-7887-a91e-a2e7b77d6368	01a11c74-a38e-7f70-902d-20a266ce24a5	2026-09-25	2026-10-24	4715280.00	943056.00	5658336.00	20
01a11c74-daec-772b-acfb-6b1e9e19c304	system	2026-10-08 16:59:42.702+00	\N	2026-10-08 16:59:42.702+00	\N	\N	1	INV-1023	01a11c74-9fa6-7887-a91e-a2e7b77d6368	01a11c74-a38f-7e24-ac7f-35367577a45d	2026-06-01	2026-06-18	5203800.00	1040760.00	6244560.00	30
01a11c74-db32-7b58-9cec-cbda511000b6	system	2026-10-08 16:59:42.771+00	\N	2026-10-08 16:59:42.771+00	\N	\N	1	INV-1024	01a11c74-9fa6-7887-a91e-a2e7b77d6368	01a11c74-a390-782d-a8d6-aa6e731763d0	2026-09-02	2026-09-17	4304400.00	860880.00	5165280.00	30
01a11c74-db74-73f7-bebc-367819187dab	system	2026-10-08 16:59:42.837+00	\N	2026-10-08 16:59:42.837+00	\N	\N	1	INV-1025	01a11c74-9fa6-7887-a91e-a2e7b77d6368	01a11c74-a391-7276-90e7-5e2c36a16736	2026-09-25	2026-10-11	2900720.00	580144.00	3480864.00	40
01a11c74-dbb4-7618-b4f3-3549fce66e76	system	2026-10-08 16:59:42.901+00	\N	2026-10-08 16:59:42.901+00	\N	\N	1	INV-1026	01a11c74-9fa6-7887-a91e-a2e7b77d6368	01a11c74-a391-7f2b-90f1-3f7c686ee68e	2025-06-21	2025-07-07	4710600.00	942120.00	5652720.00	30
01a11c74-dbf2-75a9-8b25-69b7fae03cda	system	2026-10-08 16:59:42.963+00	\N	2026-10-08 16:59:42.963+00	\N	\N	1	INV-1027	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	01a11c74-a392-7b02-bad3-79fdf0bc7f20	2026-10-03	2026-10-25	6174000.00	1234800.00	7408800.00	20
01a11c74-dc2c-7cb0-a9be-e3a54bd569a4	system	2026-10-08 16:59:43.021+00	\N	2026-10-08 16:59:43.021+00	\N	\N	1	INV-1028	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	01a11c74-a393-75db-975b-f75455af4ee4	2026-06-06	2026-06-26	879600.00	175920.00	1055520.00	30
01a11c74-dc5f-708f-aa85-65bc3e130e6d	system	2026-10-08 16:59:43.071+00	\N	2026-10-08 16:59:43.071+00	\N	\N	1	INV-1029	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	01a11c74-a393-7af9-975f-0ebf94c97c2a	2026-09-25	2026-10-12	4105080.00	821016.00	4926096.00	20
01a11c74-dca3-7beb-b996-30c5139fa217	system	2026-10-08 16:59:43.14+00	\N	2026-10-08 16:59:43.14+00	\N	\N	1	INV-1030	01a11c74-9ffa-784d-b037-4570b6b01a46	01a11c74-a394-7d68-8da6-5953b89a2adf	2026-10-07	2026-11-02	4477800.00	895560.00	5373360.00	40
01a11c74-dcdc-7cfd-963a-ee37f855734f	system	2026-10-08 16:59:43.197+00	\N	2026-10-08 16:59:43.197+00	\N	\N	1	INV-1031	01a11c74-9ffa-784d-b037-4570b6b01a46	01a11c74-a395-7774-9b20-77c1504111be	2026-09-17	2026-10-06	4054800.00	810960.00	4865760.00	30
01a11c74-dd1d-7512-a235-6c304be6cbfb	system	2026-10-08 16:59:43.262+00	\N	2026-10-08 16:59:43.262+00	\N	\N	1	INV-1032	01a11c74-9ffa-784d-b037-4570b6b01a46	01a11c74-a396-7547-a5f0-fb1bedac1975	2026-09-20	2026-10-13	3849600.00	769920.00	4619520.00	10
01a11c74-dd84-747e-95f0-1d3c7d2f463b	system	2026-10-08 16:59:43.365+00	\N	2026-10-08 16:59:43.365+00	\N	\N	1	INV-1033	01a11c74-9ffa-784d-b037-4570b6b01a46	01a11c74-a397-722d-b27d-3a949ae4157a	2026-09-14	2026-10-02	1844400.00	368880.00	2213280.00	30
01a11c74-ddc3-733b-a1ad-28a34fb98298	system	2026-10-08 16:59:43.428+00	\N	2026-10-08 16:59:43.428+00	\N	\N	1	INV-1034	01a11c74-9ffa-784d-b037-4570b6b01a46	01a11c74-a398-71ef-9a1b-d70c44311598	2026-09-21	2026-10-13	4926600.00	985320.00	5911920.00	40
01a11c74-de08-7b06-88a5-52f6c091a2b0	system	2026-10-08 16:59:43.497+00	\N	2026-10-08 16:59:43.497+00	\N	\N	1	INV-1035	01a11c74-9ffa-784d-b037-4570b6b01a46	01a11c74-a398-7f8d-9a29-43e0c32202b7	2026-06-28	2026-07-20	4009260.00	801852.00	4811112.00	40
01a11c74-de46-74ac-96f2-1ba920e2f0f5	system	2026-10-08 16:59:43.559+00	\N	2026-10-08 16:59:43.559+00	\N	\N	1	INV-1036	01a11c74-a012-7ab8-840c-0c26f7b71e06	01a11c74-a399-7ce1-8bba-01f68d93ee34	2026-09-19	2026-10-08	2622000.00	524400.00	3146400.00	40
01a11c74-de80-76e9-8cfa-92cce4a56e33	system	2026-10-08 16:59:43.617+00	\N	2026-10-08 16:59:43.617+00	\N	\N	1	INV-1037	01a11c74-a012-7ab8-840c-0c26f7b71e06	01a11c74-a39a-713f-8aa8-b6878a8db42f	2026-09-18	2026-10-26	5333400.00	1066680.00	6400080.00	10
01a11c74-dec5-7a66-a3ee-9c285c157cf0	system	2026-10-08 16:59:43.686+00	\N	2026-10-08 16:59:43.686+00	\N	\N	1	INV-1038	01a11c74-a012-7ab8-840c-0c26f7b71e06	01a11c74-a39b-796c-8971-a24400ac5f3e	2026-06-23	2026-07-12	2491980.00	498396.00	2990376.00	40
01a11c74-df17-7c66-a857-8ff6bddad6e4	system	2026-10-08 16:59:43.768+00	\N	2026-10-08 16:59:43.768+00	\N	\N	1	INV-1039	01a11c74-a012-7ab8-840c-0c26f7b71e06	01a11c74-a39c-76c4-8771-53f094abdd17	2026-07-19	2026-08-14	4894392.00	978878.40	5873270.40	40
01a11c74-df58-787a-8aac-78bdda283078	system	2026-10-08 16:59:43.833+00	\N	2026-10-08 16:59:43.833+00	\N	\N	1	INV-1040	01a11c74-a012-7ab8-840c-0c26f7b71e06	01a11c74-a39d-7199-b474-3ce6603d9200	2026-10-06	2026-11-03	2521200.00	504240.00	3025440.00	20
01a11c74-df8d-730a-b96a-e00a43969800	system	2026-10-08 16:59:43.886+00	\N	2026-10-08 16:59:43.886+00	\N	\N	1	INV-1041	01a11c74-a012-7ab8-840c-0c26f7b71e06	01a11c74-a39d-75db-b478-0d78ed8e1ab0	2025-08-08	2025-08-15	3057600.00	611520.00	3669120.00	30
01a11c74-dfcd-7370-a530-7772a7b011bd	system	2026-10-08 16:59:43.95+00	\N	2026-10-08 16:59:43.95+00	\N	\N	1	INV-1042	01a11c74-a02d-7f47-aaef-74c827bc3bc4	01a11c74-a39e-7041-9d91-50050e450433	2026-08-03	2026-08-13	5104800.00	1020960.00	6125760.00	40
01a11c74-e00b-7570-b408-e550a883b1fa	system	2026-10-08 16:59:44.012+00	\N	2026-10-08 16:59:44.012+00	\N	\N	1	INV-1043	01a11c74-a02d-7f47-aaef-74c827bc3bc4	01a11c74-a39e-79d2-9d9b-8f14e0482d72	2026-05-28	2026-06-26	1349166.00	269833.20	1618999.20	30
01a11c74-e047-7112-ab14-dbf35a6d1ee5	system	2026-10-08 16:59:44.072+00	\N	2026-10-08 16:59:44.072+00	\N	\N	1	INV-1044	01a11c74-a02d-7f47-aaef-74c827bc3bc4	01a11c74-a39e-7ef9-9da0-5219eda57ca3	2026-08-27	2026-09-08	3549600.00	709920.00	4259520.00	30
01a11c74-e08f-7af5-96b6-4a0a9d50893c	system	2026-10-08 16:59:44.144+00	\N	2026-10-08 16:59:44.144+00	\N	\N	1	INV-1045	01a11c74-a02d-7f47-aaef-74c827bc3bc4	01a11c74-a39f-7a5a-9f51-fd013ec94401	2026-10-15	2026-11-14	3648540.00	729708.00	4378248.00	20
01a11c74-e0fe-7ae9-9fdd-509f75ad97e2	system	2026-10-08 16:59:44.256+00	\N	2026-10-08 16:59:44.256+00	\N	\N	1	INV-1046	01a11c74-a02d-7f47-aaef-74c827bc3bc4	01a11c74-a3a0-778d-8dd3-477418e64b37	2026-09-29	2026-10-13	3204000.00	640800.00	3844800.00	20
01a11c74-e140-7476-b9d9-6d6df3b3935f	system	2026-10-08 16:59:44.321+00	\N	2026-10-08 16:59:44.321+00	\N	\N	1	INV-1047	01a11c74-a02d-7f47-aaef-74c827bc3bc4	01a11c74-a3a1-745e-adb5-0732387ef335	2026-09-12	2026-09-27	5235600.00	1047120.00	6282720.00	40
01a11c74-e1d8-7a7e-a496-90de7043c9dc	system	2026-10-08 16:59:44.475+00	\N	2026-10-08 16:59:44.475+00	\N	\N	1	INV-1048	01a11c74-a02d-7f47-aaef-74c827bc3bc4	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9	2026-08-22	2026-09-15	3150840.00	630168.00	3781008.00	40
01a11c74-e220-795c-b250-2e73dde2935b	system	2026-10-08 16:59:44.545+00	\N	2026-10-08 16:59:44.545+00	\N	\N	1	INV-1049	01a11c74-a04c-7424-a2b7-311cf2cfac67	01a11c74-a3a3-7337-88eb-7a9bdc26ed7e	2026-08-19	2026-09-10	3475200.00	695040.00	4170240.00	40
01a11c74-e251-7312-8b4f-1cb6ac0b5787	system	2026-10-08 16:59:44.593+00	\N	2026-10-08 16:59:44.593+00	\N	\N	1	INV-1050	01a11c74-a04c-7424-a2b7-311cf2cfac67	01a11c74-a3a3-7958-88f1-a09723ea994e	2025-01-07	2025-02-14	100800.00	20160.00	120960.00	30
01a11c74-e27d-75d2-8f8c-5014e823c312	system	2026-10-08 16:59:44.638+00	\N	2026-10-08 16:59:44.638+00	\N	\N	1	INV-1051	01a11c74-a04c-7424-a2b7-311cf2cfac67	01a11c74-a3a4-70e5-aaf1-a679b8ab1953	2026-07-10	2026-07-31	3355020.00	671004.00	4026024.00	30
01a11c74-e2bc-748b-b046-0912b7b5703d	system	2026-10-08 16:59:44.701+00	\N	2026-10-08 16:59:44.701+00	\N	\N	1	INV-1052	01a11c74-a06f-7887-860c-5b72f3a1fc25	01a11c74-a3a4-7e3d-aaff-54abedce29dc	2026-08-15	2026-09-02	3887400.00	777480.00	4664880.00	30
01a11c74-e2ef-7102-99d7-19271bea31c3	system	2026-10-08 16:59:44.751+00	\N	2026-10-08 16:59:44.751+00	\N	\N	1	INV-1053	01a11c74-a06f-7887-860c-5b72f3a1fc25	01a11c74-a3a5-7533-a737-e6885babfb29	2026-10-12	2026-11-02	5151600.00	1030320.00	6181920.00	20
01a11c74-e320-71ce-a405-f3c3e8f054c5	system	2026-10-08 16:59:44.8+00	\N	2026-10-08 16:59:44.8+00	\N	\N	1	INV-1054	01a11c74-a06f-7887-860c-5b72f3a1fc25	01a11c74-a3a5-7b4f-a73d-b49ad274a3ef	2026-08-23	2026-09-20	2362338.00	472467.60	2834805.60	30
01a11c74-e34e-73a5-bc06-5ad37924aa58	system	2026-10-08 16:59:44.846+00	\N	2026-10-08 16:59:44.846+00	\N	\N	1	INV-1055	01a11c74-a08d-77eb-941f-009a8b83b02d	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3	2026-06-03	2026-06-28	5664000.00	1132800.00	6796800.00	30
01a11c74-e384-7fa1-ba2b-aa0bcba13296	system	2026-10-08 16:59:44.901+00	\N	2026-10-08 16:59:44.901+00	\N	\N	1	INV-1056	01a11c74-a08d-77eb-941f-009a8b83b02d	01a11c74-a3a7-75a1-a980-4f37200e8acf	2026-07-18	2026-08-09	5338200.00	1067640.00	6405840.00	30
01a11c74-e3bd-7462-b4cb-4986098ed34b	system	2026-10-08 16:59:44.958+00	\N	2026-10-08 16:59:44.958+00	\N	\N	1	INV-1057	01a11c74-a08d-77eb-941f-009a8b83b02d	01a11c74-a3a7-7b99-a986-60e5ef048829	2026-08-25	2026-09-09	4014720.00	802944.00	4817664.00	30
01a11c74-e401-7147-a750-7fab54f785ab	system	2026-10-08 16:59:45.025+00	\N	2026-10-08 16:59:45.025+00	\N	\N	1	INV-1058	01a11c74-a08d-77eb-941f-009a8b83b02d	01a11c74-a3a8-7cf9-9824-f0eceb12f935	2026-10-01	2026-10-11	3811320.00	762264.00	4573584.00	40
01a11c74-e441-72f5-acb3-17bd95379423	system	2026-10-08 16:59:45.091+00	\N	2026-10-08 16:59:45.091+00	\N	\N	1	INV-1059	01a11c74-a08d-77eb-941f-009a8b83b02d	01a11c74-a3a9-77ae-8745-d7437b2873b0	2026-09-20	2026-10-18	3936360.00	787272.00	4723632.00	40
01a11c74-e482-790a-af09-bdca37ba9662	system	2026-10-08 16:59:45.155+00	\N	2026-10-08 16:59:45.155+00	\N	\N	1	INV-1060	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4	2026-09-29	2026-10-22	2385600.00	477120.00	2862720.00	20
01a11c74-e4b8-7bf3-844a-0d772a2a92fd	system	2026-10-08 16:59:45.209+00	\N	2026-10-08 16:59:45.209+00	\N	\N	1	INV-1061	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	01a11c74-a3ac-7a7e-ac24-02774fd58923	2026-07-19	2026-08-11	6079800.00	1215960.00	7295760.00	40
01a11c74-e4f2-7d43-bfd9-ba148436a705	system	2026-10-08 16:59:45.267+00	\N	2026-10-08 16:59:45.267+00	\N	\N	1	INV-1062	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	01a11c74-a3ad-7381-bf09-b5ff004181b2	2025-09-28	2025-10-06	3469860.00	693972.00	4163832.00	40
01a11c74-e532-783d-9224-a2256ee4f985	system	2026-10-08 16:59:45.331+00	\N	2026-10-08 16:59:45.331+00	\N	\N	1	INV-1063	01a11c74-a0be-7f47-beab-8600ed3193cb	01a11c74-a3af-7418-89f0-6412357a9731	2025-02-26	2025-04-01	418800.00	83760.00	502560.00	30
01a11c74-e562-709f-81e8-0b220e882452	system	2026-10-08 16:59:45.378+00	\N	2026-10-08 16:59:45.378+00	\N	\N	1	INV-1064	01a11c74-a0be-7f47-beab-8600ed3193cb	01a11c74-a3b0-7122-ac49-4b7b12f30887	2026-05-31	2026-06-16	1267200.00	253440.00	1520640.00	30
01a11c74-e597-7391-8d39-b63282fdcb64	system	2026-10-08 16:59:45.432+00	\N	2026-10-08 16:59:45.432+00	\N	\N	1	INV-1065	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	01a11c74-a3b0-7581-ac4d-869c951de7e8	2026-07-20	2026-08-05	4741448.40	948289.68	5689738.08	30
01a11c74-e5ff-7666-a665-587cd08df5b5	system	2026-10-08 16:59:45.537+00	\N	2026-10-08 16:59:45.537+00	\N	\N	1	INV-1066	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	01a11c74-a3b1-72f9-b824-aa82b5e59753	2026-10-10	2026-10-23	3541200.00	708240.00	4249440.00	40
01a11c74-e654-7bca-8d15-e9b6330bb0ce	system	2026-10-08 16:59:45.621+00	\N	2026-10-08 16:59:45.621+00	\N	\N	1	INV-1067	01a11c74-a0f0-7a76-afc1-0332e0e65590	01a11c74-a3b2-7774-8cec-087f70c8f671	2026-10-18	2026-10-28	4229220.00	845844.00	5075064.00	20
01a11c74-e6a1-7e51-ba1f-6a8f32e50cfa	system	2026-10-08 16:59:45.698+00	\N	2026-10-08 16:59:45.698+00	\N	\N	1	INV-1068	01a11c74-a0f0-7a76-afc1-0332e0e65590	01a11c74-a3b3-74d0-b94d-831f60f89aa4	2026-08-09	2026-08-24	2817000.00	563400.00	3380400.00	30
01a11c74-e6e1-7eed-8eac-df3f6a556dc9	system	2026-10-08 16:59:45.762+00	\N	2026-10-08 16:59:45.762+00	\N	\N	1	INV-1069	01a11c74-a0f0-7a76-afc1-0332e0e65590	01a11c74-a3b4-7ba9-8804-de6c86d78aa4	2026-01-06	2026-01-16	2604000.00	520800.00	3124800.00	30
01a11c74-e71c-791a-8895-dca405ac050d	system	2026-10-08 16:59:45.821+00	\N	2026-10-08 16:59:45.821+00	\N	\N	1	INV-1070	01a11c74-a0f0-7a76-afc1-0332e0e65590	01a11c74-a3b5-736c-9120-0766b27f9367	2026-06-22	2026-07-08	3479100.00	695820.00	4174920.00	30
01a11c74-e76e-78c4-97cb-dbecf87458c7	system	2026-10-08 16:59:45.904+00	\N	2026-10-08 16:59:45.904+00	\N	\N	1	INV-1071	01a11c74-a0f0-7a76-afc1-0332e0e65590	01a11c74-a3b6-70d9-ad48-f09f7a767a6c	2026-09-03	2026-10-01	4744800.00	948960.00	5693760.00	30
01a11c74-e7b5-7def-a38c-f45054d69cfe	system	2026-10-08 16:59:45.975+00	\N	2026-10-08 16:59:45.975+00	\N	\N	1	INV-1072	01a11c74-a107-7506-9b81-75b858244b15	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f	2026-07-06	2026-08-03	5394780.00	1078956.00	6473736.00	40
01a11c74-e801-72c8-aa0d-60c22d77e132	system	2026-10-08 16:59:46.05+00	\N	2026-10-08 16:59:46.05+00	\N	\N	1	INV-1073	01a11c74-a107-7506-9b81-75b858244b15	01a11c74-a3b7-78d4-9470-303134c9395a	2026-10-16	2026-11-05	3992400.00	798480.00	4790880.00	10
01a11c74-e834-78a7-9992-633eaf5a7daf	system	2026-10-08 16:59:46.101+00	\N	2026-10-08 16:59:46.101+00	\N	\N	1	INV-1074	01a11c74-a107-7506-9b81-75b858244b15	01a11c74-a3b7-7ecc-9476-1ff5cd305751	2026-09-22	2026-10-20	3223200.00	644640.00	3867840.00	20
01a11c74-e866-7991-add1-3222bbe14ef6	system	2026-10-08 16:59:46.151+00	\N	2026-10-08 16:59:46.151+00	\N	\N	1	INV-1075	01a11c74-a107-7506-9b81-75b858244b15	01a11c74-a3b8-74e9-8183-c07da79a01eb	2026-09-20	2026-10-18	4704660.00	940932.00	5645592.00	40
01a11c74-e8ab-704d-ae65-86e3bd6ac1f1	system	2026-10-08 16:59:46.219+00	\N	2026-10-08 16:59:46.219+00	\N	\N	1	INV-1076	01a11c74-a107-7506-9b81-75b858244b15	01a11c74-a3b9-7218-a929-14a2c89c11d7	2025-02-18	2025-03-09	3514800.00	702960.00	4217760.00	40
01a11c74-e8f8-7b70-8f95-e216f2e65521	system	2026-10-08 16:59:46.298+00	\N	2026-10-08 16:59:46.298+00	\N	\N	1	INV-1077	01a11c74-a107-7506-9b81-75b858244b15	01a11c74-a3b9-7cb0-a934-35107821fc92	2026-05-27	2026-06-09	5108640.00	1021728.00	6130368.00	40
01a11c74-e945-767a-a463-d3e356e14459	system	2026-10-08 16:59:46.374+00	\N	2026-10-08 16:59:46.374+00	\N	\N	1	INV-1078	01a11c74-a107-7506-9b81-75b858244b15	01a11c74-a3ba-7a35-acfe-fd41f4170e53	2026-09-03	2026-09-24	5427000.00	1085400.00	6512400.00	30
01a11c74-e987-75c2-962d-4ca053080610	system	2026-10-08 16:59:46.442+00	\N	2026-10-08 16:59:46.442+00	\N	\N	1	INV-1079	01a11c74-a11e-7639-9fdf-1699b47e1124	01a11c74-a3bd-76d4-80a5-48dd04a155e2	2026-09-13	2026-10-05	1986600.00	397320.00	2383920.00	30
01a11c74-e9c6-7ed4-8153-c6bd58cb1e19	system	2026-10-08 16:59:46.504+00	\N	2026-10-08 16:59:46.504+00	\N	\N	1	INV-1080	01a11c74-a139-74d9-b074-88a64f49a13f	01a11c74-a3be-744d-bc64-3f96bb960050	2026-08-09	2026-09-03	2666820.00	533364.00	3200184.00	30
01a11c74-ea11-7697-9000-82b6ada966d8	system	2026-10-08 16:59:46.578+00	\N	2026-10-08 16:59:46.578+00	\N	\N	1	INV-1081	01a11c74-a139-74d9-b074-88a64f49a13f	01a11c74-a3bf-7170-93a9-ed5de6f541ec	2026-08-27	2026-09-19	4723860.00	944772.00	5668632.00	30
01a11c74-ea58-7f9d-b8a3-627888724327	system	2026-10-08 16:59:46.65+00	\N	2026-10-08 16:59:46.65+00	\N	\N	1	INV-1082	01a11c74-a139-74d9-b074-88a64f49a13f	01a11c74-a3bf-7ecc-93b7-0af72cf5b308	2026-09-27	2026-10-22	2977200.00	595440.00	3572640.00	10
01a11c74-ea9b-754b-8ca6-ee73e4d052d7	system	2026-10-08 16:59:46.716+00	\N	2026-10-08 16:59:46.716+00	\N	\N	1	INV-1083	01a11c74-a139-74d9-b074-88a64f49a13f	01a11c74-a3c0-7639-96fb-72d3bc1b7408	2026-08-16	2026-09-01	4899120.00	979824.00	5878944.00	30
01a11c74-eae6-7ae1-9d13-ca4f2be4a7dd	system	2026-10-08 16:59:46.791+00	\N	2026-10-08 16:59:46.791+00	\N	\N	1	INV-1084	01a11c74-a139-74d9-b074-88a64f49a13f	01a11c74-a3c1-735c-a2b0-2737e09c0fb7	2026-10-13	2026-11-11	3736800.00	747360.00	4484160.00	40
01a11c74-eb39-77a5-9edc-a412e0d632fe	system	2026-10-08 16:59:46.875+00	\N	2026-10-08 16:59:46.875+00	\N	\N	1	INV-1085	01a11c74-a139-74d9-b074-88a64f49a13f	01a11c74-a3c2-7c41-b208-96ebf475406d	2026-08-27	2026-09-26	2007000.00	401400.00	2408400.00	30
01a11c74-eb7f-7d81-8d31-59ca2596c600	system	2026-10-08 16:59:46.945+00	\N	2026-10-08 16:59:46.945+00	\N	\N	1	INV-1086	01a11c74-a139-74d9-b074-88a64f49a13f	01a11c74-a3c3-7170-9f0a-1b0897957d02	2026-09-29	2026-10-27	4232940.00	846588.00	5079528.00	40
01a11c74-ebd2-71d2-97df-a95b7d65f8cf	system	2026-10-08 16:59:47.035+00	\N	2026-10-08 16:59:47.035+00	\N	\N	1	INV-1087	01a11c74-a14d-79f7-98a2-9e31e19c3c24	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d	2026-09-09	2026-10-07	2654588.00	530917.60	3185505.60	40
01a11c74-ec29-79c6-9d56-6e2675c820b1	system	2026-10-08 16:59:47.116+00	\N	2026-10-08 16:59:47.116+00	\N	\N	1	INV-1088	01a11c74-a14d-79f7-98a2-9e31e19c3c24	01a11c74-a3c4-770a-b6e6-ea696969a54e	2026-05-30	2026-06-15	4360440.00	872088.00	5232528.00	30
01a11c74-ec77-7a8f-b3fe-4ce903596547	system	2026-10-08 16:59:47.192+00	\N	2026-10-08 16:59:47.192+00	\N	\N	1	INV-1089	01a11c74-a14d-79f7-98a2-9e31e19c3c24	01a11c74-a3c5-7476-b9b5-c3d17ae5ef43	2026-10-10	2026-10-23	3767400.00	753480.00	4520880.00	20
01a11c74-ecb7-7f7c-9ce3-3ec2c609c3a9	system	2026-10-08 16:59:47.257+00	\N	2026-10-08 16:59:47.257+00	\N	\N	1	INV-1090	01a11c74-a14d-79f7-98a2-9e31e19c3c24	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea	2026-06-03	2026-06-14	5709720.00	1141944.00	6851664.00	40
01a11c74-ed01-73ca-bd90-bdd26b264e7e	system	2026-10-08 16:59:47.33+00	\N	2026-10-08 16:59:47.33+00	\N	\N	1	INV-1091	01a11c74-a14d-79f7-98a2-9e31e19c3c24	01a11c74-a3c6-7872-9160-d2a77a061c40	2026-07-05	2026-07-26	3628200.00	725640.00	4353840.00	30
01a11c74-ed39-72b4-a8de-f03c683a1455	system	2026-10-08 16:59:47.386+00	\N	2026-10-08 16:59:47.386+00	\N	\N	1	INV-1092	01a11c74-a14d-79f7-98a2-9e31e19c3c24	01a11c74-a3c7-7041-9b06-27a7356fd7de	2026-08-03	2026-08-29	5805720.00	1161144.00	6966864.00	30
01a11c74-ed80-728f-ab31-fb3e95f6da4c	system	2026-10-08 16:59:47.456+00	\N	2026-10-08 16:59:47.456+00	\N	\N	1	INV-1093	01a11c74-a163-7b85-a43c-74a51a5feb0c	01a11c74-a3c7-7db6-9b14-938674a75f2e	2026-10-18	2026-11-12	4991706.00	998341.20	5990047.20	10
01a11c74-edc0-7791-b507-e966c8df9c53	system	2026-10-08 16:59:47.521+00	\N	2026-10-08 16:59:47.521+00	\N	\N	1	INV-1094	01a11c74-a163-7b85-a43c-74a51a5feb0c	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8	2026-09-23	2026-10-17	5516400.00	1103280.00	6619680.00	20
01a11c74-ee03-7d91-8d6f-3661108476c1	system	2026-10-08 16:59:47.588+00	\N	2026-10-08 16:59:47.588+00	\N	\N	1	INV-1095	01a11c74-a163-7b85-a43c-74a51a5feb0c	01a11c74-a3c9-7981-9f83-7c0255e20a16	2026-06-05	2026-06-24	4819320.00	963864.00	5783184.00	30
01a11c74-ee54-7f2f-b889-caa36745b132	system	2026-10-08 16:59:47.67+00	\N	2026-10-08 16:59:47.67+00	\N	\N	1	INV-1096	01a11c74-a163-7b85-a43c-74a51a5feb0c	01a11c74-a3ca-7856-a822-9c9955870431	2026-09-04	2026-10-02	5670600.00	1134120.00	6804720.00	40
01a11c74-ef35-7553-ba95-64b9501d49d3	system	2026-10-08 16:59:47.897+00	\N	2026-10-08 16:59:47.897+00	\N	\N	1	INV-1097	01a11c74-a163-7b85-a43c-74a51a5feb0c	01a11c74-a3cc-71b2-ae4b-83033d08c06f	2026-09-27	2026-10-14	3294240.00	658848.00	3953088.00	20
01a11c74-eff0-7312-b926-953459a1bb59	system	2026-10-08 16:59:48.081+00	\N	2026-10-08 16:59:48.081+00	\N	\N	1	INV-1098	01a11c74-a163-7b85-a43c-74a51a5feb0c	01a11c74-a3cc-7e24-ae58-c4703de10a0b	2026-08-24	2026-09-17	3393000.00	678600.00	4071600.00	30
01a11c74-f060-7ec8-aff6-d04120674c5b	system	2026-10-08 16:59:48.194+00	\N	2026-10-08 16:59:48.194+00	\N	\N	1	INV-1099	01a11c74-a179-7347-a816-c242e83d8357	01a11c74-a3cd-7712-8bb3-aa750a14d446	2026-10-02	2026-10-22	4648200.00	929640.00	5577840.00	20
01a11c74-f0ae-74cc-b6fb-8ea1c6113d5d	system	2026-10-08 16:59:48.271+00	\N	2026-10-08 16:59:48.271+00	\N	\N	1	INV-1100	01a11c74-a179-7347-a816-c242e83d8357	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8	2026-08-13	2026-09-09	3338160.00	667632.00	4005792.00	40
01a11c74-f1e4-7e39-8baa-96d9942bf2a9	system	2026-10-08 16:59:48.582+00	\N	2026-10-08 16:59:48.582+00	\N	\N	1	INV-1101	01a11c74-a179-7347-a816-c242e83d8357	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f	2026-09-11	2026-09-23	2965200.00	593040.00	3558240.00	40
01a11c74-f299-7856-ba70-6bd7f86f0c50	system	2026-10-08 16:59:48.763+00	\N	2026-10-08 16:59:48.763+00	\N	\N	1	INV-1102	01a11c74-a179-7347-a816-c242e83d8357	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2	2026-07-11	2026-08-08	4221840.00	844368.00	5066208.00	30
01a11c74-f385-7747-8322-f771f915eb83	system	2026-10-08 16:59:48.999+00	\N	2026-10-08 16:59:48.999+00	\N	\N	1	INV-1103	01a11c74-a179-7347-a816-c242e83d8357	01a11c74-a3d1-7943-8ec7-99039099dbd5	2026-07-29	2026-08-10	4986000.00	997200.00	5983200.00	40
01a11c74-f44f-7e7e-aa2d-8cb28437ea56	system	2026-10-08 16:59:49.204+00	\N	2026-10-08 16:59:49.204+00	\N	\N	1	INV-1104	01a11c74-a193-76fd-94e9-0b29a9032f4a	01a11c74-a3d2-7fd2-9aaa-302305c57d4f	2026-07-06	2026-07-20	4310760.00	862152.00	5172912.00	30
01a11c74-f4d9-7d26-8304-cb8941ac734c	system	2026-10-08 16:59:49.339+00	\N	2026-10-08 16:59:49.339+00	\N	\N	1	INV-1105	01a11c74-a193-76fd-94e9-0b29a9032f4a	01a11c74-a3d3-7c28-b94c-2c1e7f1b7be8	2025-06-07	2025-06-15	1920600.00	384120.00	2304720.00	30
01a11c74-f523-7bdf-8703-8830970f2174	system	2026-10-08 16:59:49.413+00	\N	2026-10-08 16:59:49.413+00	\N	\N	1	INV-1106	01a11c74-a193-76fd-94e9-0b29a9032f4a	01a11c74-a3d4-7251-b0c5-83f0972956fc	2026-10-07	2026-11-06	2199000.00	439800.00	2638800.00	40
01a11c74-f564-73f7-adb4-3cf3db4448e5	system	2026-10-08 16:59:49.477+00	\N	2026-10-08 16:59:49.477+00	\N	\N	1	INV-1107	01a11c74-a193-76fd-94e9-0b29a9032f4a	01a11c74-a3d4-7770-b0ca-1525f6c4771e	2026-06-06	2026-06-24	4540800.00	908160.00	5448960.00	30
01a11c74-f5a9-7ec0-96b9-022ddf6a1709	system	2026-10-08 16:59:49.546+00	\N	2026-10-08 16:59:49.546+00	\N	\N	1	INV-1108	01a11c74-a193-76fd-94e9-0b29a9032f4a	01a11c74-a3d6-728b-a82d-6c10a052a694	2026-07-19	2026-08-06	3403200.00	680640.00	4083840.00	40
01a11c74-f5d9-719d-9122-f286ac5fe3df	system	2026-10-08 16:59:49.593+00	\N	2026-10-08 16:59:49.593+00	\N	\N	1	INV-1109	01a11c74-a193-76fd-94e9-0b29a9032f4a	01a11c74-a3d6-76ac-a831-f223f40b675c	2026-10-12	2026-11-06	2468362.00	493672.40	2962034.40	40
01a11c74-f619-7a31-a841-a84175ebc153	system	2026-10-08 16:59:49.658+00	\N	2026-10-08 16:59:49.658+00	\N	\N	1	INV-1110	01a11c74-a193-76fd-94e9-0b29a9032f4a	01a11c74-a3d7-7116-908d-90a358cd42af	2026-07-07	2026-07-22	1015584.00	203116.80	1218700.80	40
01a11c74-f64b-7eb0-8436-19d6271ccac4	system	2026-10-08 16:59:49.708+00	\N	2026-10-08 16:59:49.708+00	\N	\N	1	INV-1111	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	01a11c74-a3d7-7585-9091-f2d1ff99711a	2026-07-31	2026-08-18	5502600.00	1100520.00	6603120.00	40
01a11c74-f686-7f4b-bf50-468163db73fe	system	2026-10-08 16:59:49.768+00	\N	2026-10-08 16:59:49.768+00	\N	\N	1	INV-1112	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	01a11c74-a3d7-7d3f-9099-24ca55fceb99	2026-08-19	2026-09-06	3951420.00	790284.00	4741704.00	40
01a11c74-f6cd-7368-918b-fd6b167074fc	system	2026-10-08 16:59:49.837+00	\N	2026-10-08 16:59:49.837+00	\N	\N	1	INV-1113	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a	2025-12-10	2026-01-24	4969800.00	993960.00	5963760.00	40
01a11c74-f714-7f4f-b0e7-31c94c69fe08	system	2026-10-08 16:59:49.909+00	\N	2026-10-08 16:59:49.909+00	\N	\N	1	INV-1114	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09	2026-10-02	2026-10-24	4244940.00	848988.00	5093928.00	20
01a11c74-f788-72ed-a7b1-f96163f34f95	system	2026-10-08 16:59:50.025+00	\N	2026-10-08 16:59:50.025+00	\N	\N	1	INV-1115	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	01a11c74-a3da-725a-828f-50cc407e0f49	2026-06-14	2026-06-24	5685840.00	1137168.00	6823008.00	30
01a11c74-f7d8-765e-8d06-6cc6c1623faa	system	2026-10-08 16:59:50.105+00	\N	2026-10-08 16:59:50.105+00	\N	\N	1	INV-1116	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c	2026-09-23	2026-10-08	3654600.00	730920.00	4385520.00	40
01a11c74-f82b-71a9-ab17-fb65696e239b	system	2026-10-08 16:59:50.188+00	\N	2026-10-08 16:59:50.188+00	\N	\N	1	INV-1117	01a11c74-a1c6-74e5-90c9-0982c31c1520	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6	2026-04-13	2026-05-10	4947600.00	989520.00	5937120.00	30
01a11c74-f86f-73e7-a2cd-dba13479059e	system	2026-10-08 16:59:50.256+00	\N	2026-10-08 16:59:50.256+00	\N	\N	1	INV-1118	01a11c74-a1c6-74e5-90c9-0982c31c1520	01a11c74-a3de-7b3b-8776-180445299eb9	2026-08-10	2026-08-22	4750200.00	950040.00	5700240.00	40
01a11c74-f8b4-7e10-82cb-9d4522a43c6a	system	2026-10-08 16:59:50.325+00	\N	2026-10-08 16:59:50.325+00	\N	\N	1	INV-1119	01a11c74-a1c6-74e5-90c9-0982c31c1520	01a11c74-a3df-75f3-ab42-7024d6df69e4	2026-09-30	2026-10-25	4562400.00	912480.00	5474880.00	40
01a11c74-f8f6-7f53-b576-1f360fc85f7d	system	2026-10-08 16:59:50.391+00	\N	2026-10-08 16:59:50.391+00	\N	\N	1	INV-1120	01a11c74-a1c6-74e5-90c9-0982c31c1520	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e	2026-10-09	2026-11-07	4680000.00	936000.00	5616000.00	40
01a11c74-f933-7dd2-87be-5dc80bd9f8b8	system	2026-10-08 16:59:50.454+00	\N	2026-10-08 16:59:50.454+00	\N	\N	1	INV-1121	01a11c74-a1e6-72ed-986f-245eeed408fb	01a11c74-a3e0-7733-b812-60251472c289	2026-07-04	2026-07-18	3855060.00	771012.00	4626072.00	40
01a11c74-f979-7f12-af9c-2e996873237d	system	2026-10-08 16:59:50.522+00	\N	2026-10-08 16:59:50.522+00	\N	\N	1	INV-1122	01a11c74-a1e6-72ed-986f-245eeed408fb	01a11c74-a3e1-749b-8275-05c21f033b7e	2026-09-01	2026-09-18	3630600.00	726120.00	4356720.00	30
01a11c74-f9bd-75e7-a60d-7ce9722e8b36	system	2026-10-08 16:59:50.591+00	\N	2026-10-08 16:59:50.591+00	\N	\N	1	INV-1123	01a11c74-a1e6-72ed-986f-245eeed408fb	01a11c74-a3e1-7b89-827c-cf954a944950	2026-09-17	2026-10-02	2960400.00	592080.00	3552480.00	30
01a11c74-f9f5-7beb-aa08-243dc8485ab9	system	2026-10-08 16:59:50.646+00	\N	2026-10-08 16:59:50.646+00	\N	\N	1	INV-1124	01a11c74-a1e6-72ed-986f-245eeed408fb	01a11c74-a3e2-719d-bbe7-e21685a68abe	2026-06-14	2026-06-30	2447160.00	489432.00	2936592.00	40
01a11c74-fa3f-7683-91a4-fcac05437f9a	system	2026-10-08 16:59:50.72+00	\N	2026-10-08 16:59:50.72+00	\N	\N	1	INV-1125	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e2-7e39-bbf4-d684d8e41f13	2026-07-04	2026-07-20	5557260.00	1111452.00	6668712.00	30
01a11c74-fa83-7c97-abe9-ea2e034eabd6	system	2026-10-08 16:59:50.788+00	\N	2026-10-08 16:59:50.788+00	\N	\N	1	INV-1126	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6	2026-09-28	2026-10-23	4095000.00	819000.00	4914000.00	20
01a11c74-fabb-792f-80f9-393a6edb9208	system	2026-10-08 16:59:50.844+00	\N	2026-10-08 16:59:50.844+00	\N	\N	1	INV-1127	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e4-7360-9811-ed1d427758fc	2026-09-19	2026-10-17	2316037.00	463207.40	2779244.40	20
01a11c74-fb05-71e3-b915-6df4d879c0d8	system	2026-10-08 16:59:50.918+00	\N	2026-10-08 16:59:50.918+00	\N	\N	1	INV-1128	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e4-7fca-981e-b5212ef39590	2026-06-03	2026-06-30	2554200.00	510840.00	3065040.00	30
01a11c74-fb43-7533-9777-28d17fd78c52	system	2026-10-08 16:59:50.98+00	\N	2026-10-08 16:59:50.98+00	\N	\N	1	INV-1129	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e5-75ef-84ce-95cc9d93d957	2026-06-10	2026-06-30	1927740.00	385548.00	2313288.00	30
01a11c74-fb91-7c93-a9b3-79c9039df38f	system	2026-10-08 16:59:51.059+00	\N	2026-10-08 16:59:51.059+00	\N	\N	1	INV-1130	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e6-731e-905a-e375b21f14aa	2026-07-06	2026-07-29	3951000.00	790200.00	4741200.00	40
01a11c74-fbd4-7581-9d25-40857f4f0f0d	system	2026-10-08 16:59:51.125+00	\N	2026-10-08 16:59:51.125+00	\N	\N	1	INV-1131	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e6-7a39-9061-3e3f8410bc76	2026-07-22	2026-08-14	5708220.00	1141644.00	6849864.00	40
01a11c74-fc27-7f16-9bc2-cac001a2c962	system	2026-10-08 16:59:51.209+00	\N	2026-10-08 16:59:51.209+00	\N	\N	1	INV-1132	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	01a11c74-a3e7-774f-8799-2314c2bff2c1	2026-10-18	2026-11-03	4776793.00	955358.60	5732151.60	10
01a11c74-fc6e-728f-bd30-cd613b6e3d47	system	2026-10-08 16:59:51.279+00	\N	2026-10-08 16:59:51.279+00	\N	\N	1	INV-1133	01a11c74-a216-77ce-baef-4da7e1148c67	01a11c74-a3e8-7378-9f2b-70d45b208a42	2026-10-09	2026-10-31	4316400.00	863280.00	5179680.00	20
01a11c74-fcb2-7922-94a4-759853de900d	system	2026-10-08 16:59:51.347+00	\N	2026-10-08 16:59:51.347+00	\N	\N	1	INV-1134	01a11c74-a216-77ce-baef-4da7e1148c67	01a11c74-a3e8-7ff3-9f38-c3a1a0083135	2026-09-03	2026-09-19	4295100.00	859020.00	5154120.00	30
01a11c74-fcfb-76f9-b3d2-a9a7c01f5447	system	2026-10-08 16:59:51.42+00	\N	2026-10-08 16:59:51.42+00	\N	\N	1	INV-1135	01a11c74-a216-77ce-baef-4da7e1148c67	01a11c74-a3e9-7d06-8e27-8e006fbf1e6f	2026-07-31	2026-08-11	3834000.00	766800.00	4600800.00	40
01a11c74-fd3c-78a7-bbb1-34de3ee2362d	system	2026-10-08 16:59:51.485+00	\N	2026-10-08 16:59:51.485+00	\N	\N	1	INV-1136	01a11c74-a216-77ce-baef-4da7e1148c67	01a11c74-a3eb-7035-83e2-775fb47a89b9	2026-07-31	2026-08-29	1191600.00	238320.00	1429920.00	40
01a11c74-fd79-78fd-a157-9a6034111c5e	system	2026-10-08 16:59:51.546+00	\N	2026-10-08 16:59:51.546+00	\N	\N	1	INV-1137	01a11c74-a216-77ce-baef-4da7e1148c67	01a11c74-a3eb-746a-83e6-23a06172b74f	2026-09-10	2026-10-10	3149400.00	629880.00	3779280.00	20
01a11c74-fdc2-7645-8ca9-15a31e165567	system	2026-10-08 16:59:51.619+00	\N	2026-10-08 16:59:51.619+00	\N	\N	1	INV-1138	01a11c74-a216-77ce-baef-4da7e1148c67	01a11c74-a3eb-7b81-83ed-8ec21249eaf9	2026-07-09	2026-08-06	1580400.00	316080.00	1896480.00	30
01a11c74-fe02-7c18-8568-309ba5475ce6	system	2026-10-08 16:59:51.684+00	\N	2026-10-08 16:59:51.684+00	\N	\N	1	INV-1139	01a11c74-a230-7249-85d3-fd922929da03	01a11c74-a3ec-7676-b252-d450c14e7fdb	2026-08-21	2026-09-18	2965680.00	593136.00	3558816.00	30
01a11c74-fe49-7dbe-8f9b-3049692d384d	system	2026-10-08 16:59:51.754+00	\N	2026-10-08 16:59:51.754+00	\N	\N	1	INV-1140	01a11c74-a230-7249-85d3-fd922929da03	01a11c74-a3ed-73ef-8a08-5c75710ed9e8	2026-07-01	2026-07-18	2217600.00	443520.00	2661120.00	30
01a11c74-fe81-71db-9976-c5ffddaa4fed	system	2026-10-08 16:59:51.809+00	\N	2026-10-08 16:59:51.809+00	\N	\N	1	INV-1141	01a11c74-a230-7249-85d3-fd922929da03	01a11c74-a3ed-7b16-8a0f-0e5325f62c93	2026-06-30	2026-07-28	4541640.00	908328.00	5449968.00	40
\.


--
-- Data for Name: order_; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_ (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, number, client_id, date_, purchase_order, comment_, total, discount_value, discount_percent, status) FROM stdin;
01a11c74-a3b1-72f9-b824-aa82b5e59753	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	ORD-1090	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	2026-10-06	PO-1090	\N	3541200.00	\N	\N	30
01a11c74-a3b9-7218-a929-14a2c89c11d7	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	ORD-1102	01a11c74-a107-7506-9b81-75b858244b15	2025-02-16	PO-1102	\N	3514800.00	\N	\N	20
01a11c74-a385-7d9d-bf2e-03d2c27493b6	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	ORD-1016	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	2026-09-10	PO-1016	Ship in two batches.	4143360.00	\N	\N	10
01a11c74-a3b0-7122-ac49-4b7b12f30887	system	2026-10-08 16:59:28.832+00	\N	2026-10-08 16:59:28.832+00	\N	\N	1	ORD-1088	01a11c74-a0be-7f47-beab-8600ed3193cb	2026-05-27	PO-1088	\N	1267200.00	\N	\N	30
01a11c74-a3d5-7d85-ac03-d28896651b0e	system	2026-10-08 16:59:28.892+00	\N	2026-10-08 16:59:28.892+00	\N	\N	1	ORD-1146	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-05-18	PO-1146	\N	1880400.00	\N	\N	30
01a11c74-a3ea-72fd-a410-f4f74a624904	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	ORD-1179	01a11c74-a216-77ce-baef-4da7e1148c67	2026-10-12	PO-1179	\N	4367160.00	\N	\N	30
01a11c74-a387-7d3f-8613-ac5d86395f63	system	2026-10-08 16:59:28.75+00	\N	2026-10-08 16:59:28.75+00	\N	\N	1	ORD-1019	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	2026-09-02	PO-1019	Repeat order based on last year's contract.	2591400.00	\N	\N	20
01a11c74-a3d4-7251-b0c5-83f0972956fc	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	ORD-1143	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-10-04	PO-1143	Repeat order based on last year's contract.	2199000.00	\N	\N	20
01a11c74-a3b8-74e9-8183-c07da79a01eb	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	ORD-1101	01a11c74-a107-7506-9b81-75b858244b15	2026-09-19	PO-1101	\N	4704660.00	\N	\N	20
01a11c74-a3da-7e8f-829c-55f472e8857b	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	ORD-1155	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-05-21	PO-1155	Customer asked for bulk discount.	4587991.20	\N	22.00	40
01a11c74-a3e6-7a39-9061-3e3f8410bc76	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	ORD-1174	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-07-17	PO-1174	\N	5708220.00	\N	\N	10
01a11c74-a3b5-736c-9120-0766b27f9367	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	ORD-1096	01a11c74-a0f0-7a76-afc1-0332e0e65590	2026-06-19	PO-1096	\N	3479100.00	\N	\N	20
01a11c74-a3a3-7337-88eb-7a9bdc26ed7e	system	2026-10-08 16:59:28.805+00	\N	2026-10-08 16:59:28.805+00	\N	\N	1	ORD-1063	01a11c74-a04c-7424-a2b7-311cf2cfac67	2026-08-18	PO-1063	\N	3475200.00	\N	\N	30
01a11c74-a3b6-7c51-ad54-4fd4ba0a666f	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	ORD-1098	01a11c74-a107-7506-9b81-75b858244b15	2026-07-05	PO-1098	Include extended warranty.	5394780.00	\N	15.00	30
01a11c74-a3ed-7b16-8a0f-0e5325f62c93	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	ORD-1186	01a11c74-a230-7249-85d3-fd922929da03	2026-06-25	PO-1186	\N	4541640.00	\N	\N	40
01a11c74-a3cd-7712-8bb3-aa750a14d446	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	ORD-1132	01a11c74-a179-7347-a816-c242e83d8357	2026-09-27	PO-1132	Include extended warranty.	4648200.00	\N	\N	10
01a11c74-a380-704d-b5ae-c3dbddabdc3e	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	ORD-1009	01a11c74-9f31-77fb-a047-051fc4dbeb47	2025-06-19	PO-1009	\N	2811000.00	\N	\N	40
01a11c74-a377-7506-b064-832c07a347f8	system	2026-10-08 16:59:28.695+00	\N	2026-10-08 16:59:28.695+00	\N	\N	1	ORD-1000	01a11c74-9ef1-7106-93d3-8a9df5e4b223	2026-07-20	PO-1000	\N	6033960.00	\N	\N	30
01a11c74-a3d2-7302-9a9d-7866736bbffe	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	ORD-1139	01a11c74-a179-7347-a816-c242e83d8357	2026-03-21	PO-1139	\N	4243200.00	\N	\N	40
01a11c74-a389-711a-bcc8-db69eb5e3fb2	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	ORD-1022	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-08-02	PO-1022	\N	5427600.00	\N	\N	40
01a11c74-a3c7-7db6-9b14-938674a75f2e	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	ORD-1124	01a11c74-a163-7b85-a43c-74a51a5feb0c	2026-10-18	PO-1124	Custom branding needed.	4991706.00	\N	19.00	40
01a11c74-a3d6-728b-a82d-6c10a052a694	system	2026-10-08 16:59:28.893+00	\N	2026-10-08 16:59:28.893+00	\N	\N	1	ORD-1147	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-07-15	PO-1147	Customer asked for bulk discount.	3403200.00	\N	\N	10
01a11c74-a39b-796c-8971-a24400ac5f3e	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	ORD-1050	01a11c74-a012-7ab8-840c-0c26f7b71e06	2026-06-22	PO-1050	\N	2491980.00	\N	\N	10
01a11c74-a3eb-746a-83e6-23a06172b74f	system	2026-10-08 16:59:28.926+00	\N	2026-10-08 16:59:28.926+00	\N	\N	1	ORD-1181	01a11c74-a216-77ce-baef-4da7e1148c67	2026-09-07	PO-1181	Requires onsite installation.	3149400.00	\N	\N	40
01a11c74-a39d-7199-b474-3ce6603d9200	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	ORD-1052	01a11c74-a012-7ab8-840c-0c26f7b71e06	2026-10-01	PO-1052	\N	2521200.00	\N	\N	40
01a11c74-a3c6-7872-9160-d2a77a061c40	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	ORD-1122	01a11c74-a14d-79f7-98a2-9e31e19c3c24	2026-07-03	PO-1122	\N	3628200.00	\N	\N	20
01a11c74-a3a6-7c04-9bc4-e60273c4ffb3	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	ORD-1071	01a11c74-a08d-77eb-941f-009a8b83b02d	2026-06-02	PO-1071	\N	5664000.00	\N	\N	40
01a11c74-a385-712b-bf22-57b9a2ac61e9	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	ORD-1015	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	2026-09-09	PO-1015	\N	3129600.00	\N	\N	10
01a11c74-a37f-71a1-b2c1-06eaa2183b01	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	ORD-1008	01a11c74-9f31-77fb-a047-051fc4dbeb47	2026-08-08	PO-1008	\N	3079944.00	\N	3.00	30
01a11c74-a39a-713f-8aa8-b6878a8db42f	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	ORD-1048	01a11c74-a012-7ab8-840c-0c26f7b71e06	2026-09-13	PO-1048	\N	5333400.00	\N	\N	20
01a11c74-a3a7-7b99-a986-60e5ef048829	system	2026-10-08 16:59:28.815+00	\N	2026-10-08 16:59:28.815+00	\N	\N	1	ORD-1073	01a11c74-a08d-77eb-941f-009a8b83b02d	2026-08-22	PO-1073	Include extended warranty.	4014720.00	\N	\N	10
01a11c74-a3a6-706e-9bb8-e4e33b8a51e6	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	ORD-1070	01a11c74-a06f-7887-860c-5b72f3a1fc25	2024-11-20	PO-1070	\N	3127800.00	\N	\N	40
01a11c74-a39f-7a5a-9f51-fd013ec94401	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	ORD-1057	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-10-12	PO-1057	Requires onsite installation.	3648540.00	\N	\N	40
01a11c74-a384-77d2-8d17-e5d37a5448b3	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	ORD-1014	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	2026-09-30	PO-1014	\N	3898800.00	\N	\N	30
01a11c74-a3c0-7639-96fb-72d3bc1b7408	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	ORD-1113	01a11c74-a139-74d9-b074-88a64f49a13f	2026-08-12	PO-1113	\N	4899120.00	\N	\N	40
01a11c74-a3eb-7035-83e2-775fb47a89b9	system	2026-10-08 16:59:28.925+00	\N	2026-10-08 16:59:28.925+00	\N	\N	1	ORD-1180	01a11c74-a216-77ce-baef-4da7e1148c67	2026-07-29	PO-1180	Coordinate with procurement before invoicing.	1191600.00	\N	\N	30
01a11c74-a39d-75db-b478-0d78ed8e1ab0	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	ORD-1053	01a11c74-a012-7ab8-840c-0c26f7b71e06	2025-08-05	PO-1053	\N	3057600.00	\N	\N	30
01a11c74-a3dd-7c8f-87f1-91e0b13e61d6	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	ORD-1159	01a11c74-a1c6-74e5-90c9-0982c31c1520	2026-04-06	PO-1159	\N	4947600.00	\N	\N	40
01a11c74-a3da-725a-828f-50cc407e0f49	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	ORD-1154	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-06-10	PO-1154	Requires onsite installation.	5685840.00	\N	\N	20
01a11c74-a388-740c-b521-5cd2a55fda80	system	2026-10-08 16:59:28.753+00	\N	2026-10-08 16:59:28.753+00	\N	\N	1	ORD-1020	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	2025-09-22	PO-1020	Requires onsite installation.	748800.00	\N	\N	30
01a11c74-a395-7774-9b20-77c1504111be	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	ORD-1041	01a11c74-9ffa-784d-b037-4570b6b01a46	2026-09-14	PO-1041	\N	4054800.00	\N	\N	10
01a11c74-a3cc-71b2-ae4b-83033d08c06f	system	2026-10-08 16:59:28.876+00	\N	2026-10-08 16:59:28.876+00	\N	\N	1	ORD-1130	01a11c74-a163-7b85-a43c-74a51a5feb0c	2026-09-22	PO-1130	\N	3294240.00	\N	\N	40
01a11c74-a3a8-7cf9-9824-f0eceb12f935	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	ORD-1075	01a11c74-a08d-77eb-941f-009a8b83b02d	2026-09-27	PO-1075	Repeat order based on last year's contract.	3811320.00	\N	10.00	40
01a11c74-a3af-7418-89f0-6412357a9731	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	ORD-1086	01a11c74-a0be-7f47-beab-8600ed3193cb	2025-02-17	PO-1086	Customer asked for bulk discount.	418800.00	\N	\N	20
01a11c74-a38b-7645-971d-7660dc232eec	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	ORD-1025	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-08-28	PO-1025	Repeat order based on last year's contract.	3454200.00	\N	\N	10
01a11c74-a3b3-74d0-b94d-831f60f89aa4	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	ORD-1093	01a11c74-a0f0-7a76-afc1-0332e0e65590	2026-08-08	PO-1093	\N	2817000.00	\N	\N	40
01a11c74-a3ed-73ef-8a08-5c75710ed9e8	system	2026-10-08 16:59:28.93+00	\N	2026-10-08 16:59:28.93+00	\N	\N	1	ORD-1185	01a11c74-a230-7249-85d3-fd922929da03	2026-06-25	PO-1185	\N	2217600.00	\N	\N	40
01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	ORD-1134	01a11c74-a179-7347-a816-c242e83d8357	2026-10-05	PO-1134	\N	4548840.00	\N	\N	20
01a11c74-a39e-79d2-9d9b-8f14e0482d72	system	2026-10-08 16:59:28.797+00	\N	2026-10-08 16:59:28.797+00	\N	\N	1	ORD-1055	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-05-21	PO-1055	\N	1349166.00	\N	9.00	30
01a11c74-a387-710e-8607-ea156f0bc9f7	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	ORD-1018	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	2026-07-12	PO-1018	Urgent delivery requested.	3432600.00	\N	\N	20
01a11c74-a381-7c24-9054-e89ec26a9ace	system	2026-10-08 16:59:28.735+00	\N	2026-10-08 16:59:28.735+00	\N	\N	1	ORD-1011	01a11c74-9f31-77fb-a047-051fc4dbeb47	2026-09-10	PO-1011	Coordinate with procurement before invoicing.	5118900.00	\N	\N	40
01a11c74-a3df-75f3-ab42-7024d6df69e4	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	ORD-1162	01a11c74-a1c6-74e5-90c9-0982c31c1520	2026-09-29	PO-1162	Custom branding needed.	4562400.00	\N	\N	40
01a11c74-a38e-7560-9027-f597d13890d5	system	2026-10-08 16:59:28.771+00	\N	2026-10-08 16:59:28.771+00	\N	\N	1	ORD-1029	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-09-19	PO-1029	Urgent delivery requested.	2966400.00	\N	\N	40
01a11c74-a38f-7e24-ac7f-35367577a45d	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	ORD-1031	01a11c74-9fa6-7887-a91e-a2e7b77d6368	2026-05-26	PO-1031	Include extended warranty.	5203800.00	\N	\N	40
01a11c74-a3e0-7733-b812-60251472c289	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	ORD-1164	01a11c74-a1e6-72ed-986f-245eeed408fb	2026-06-28	PO-1164	Customer asked for bulk discount.	3855060.00	\N	\N	40
01a11c74-a3a9-77ae-8745-d7437b2873b0	system	2026-10-08 16:59:28.82+00	\N	2026-10-08 16:59:28.82+00	\N	\N	1	ORD-1076	01a11c74-a08d-77eb-941f-009a8b83b02d	2026-09-18	PO-1076	\N	3936360.00	\N	\N	40
01a11c74-a3ac-7a7e-ac24-02774fd58923	system	2026-10-08 16:59:28.826+00	\N	2026-10-08 16:59:28.826+00	\N	\N	1	ORD-1082	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2026-07-16	PO-1082	\N	6079800.00	\N	\N	20
01a11c74-a386-7c00-a181-870faca582b1	system	2026-10-08 16:59:28.746+00	\N	2026-10-08 16:59:28.746+00	\N	\N	1	ORD-1017	01a11c74-9f62-7d1e-9bcc-2ea46fe9eba6	2026-07-28	PO-1017	Repeat order based on last year's contract.	1009200.00	\N	\N	40
01a11c74-a3d3-7c28-b94c-2c1e7f1b7be8	system	2026-10-08 16:59:28.889+00	\N	2026-10-08 16:59:28.889+00	\N	\N	1	ORD-1142	01a11c74-a193-76fd-94e9-0b29a9032f4a	2025-05-29	PO-1142	\N	1920600.00	\N	\N	30
01a11c74-a3d6-76ac-a831-f223f40b675c	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	ORD-1148	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-10-08	PO-1148	\N	2468362.00	2460038.00	\N	20
01a11c74-a3bd-76d4-80a5-48dd04a155e2	system	2026-10-08 16:59:28.853+00	\N	2026-10-08 16:59:28.853+00	\N	\N	1	ORD-1108	01a11c74-a11e-7639-9fdf-1699b47e1124	2026-09-11	PO-1108	Ship in two batches.	1986600.00	\N	\N	40
01a11c74-a3b4-7ba9-8804-de6c86d78aa4	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	ORD-1095	01a11c74-a0f0-7a76-afc1-0332e0e65590	2025-12-29	PO-1095	\N	2604000.00	\N	\N	40
01a11c74-a3a7-75a1-a980-4f37200e8acf	system	2026-10-08 16:59:28.813+00	\N	2026-10-08 16:59:28.813+00	\N	\N	1	ORD-1072	01a11c74-a08d-77eb-941f-009a8b83b02d	2026-07-16	PO-1072	Repeat order based on last year's contract.	5338200.00	\N	\N	40
01a11c74-a3e2-7e39-bbf4-d684d8e41f13	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	ORD-1168	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-06-29	PO-1168	Custom branding needed.	5557260.00	\N	\N	40
01a11c74-a3de-7716-8772-5ede282ee468	system	2026-10-08 16:59:28.907+00	\N	2026-10-08 16:59:28.907+00	\N	\N	1	ORD-1160	01a11c74-a1c6-74e5-90c9-0982c31c1520	2026-08-24	PO-1160	\N	2578800.00	\N	\N	40
01a11c74-a37a-7716-95ba-97f16ff1ab2c	system	2026-10-08 16:59:28.707+00	\N	2026-10-08 16:59:28.707+00	\N	\N	1	ORD-1001	01a11c74-9ef1-7106-93d3-8a9df5e4b223	2026-09-03	PO-1001	\N	1177200.00	\N	\N	40
01a11c74-a38e-7f70-902d-20a266ce24a5	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	ORD-1030	01a11c74-9fa6-7887-a91e-a2e7b77d6368	2026-09-24	PO-1030	\N	4715280.00	\N	\N	30
01a11c74-a3b6-70d9-ad48-f09f7a767a6c	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	ORD-1097	01a11c74-a0f0-7a76-afc1-0332e0e65590	2026-08-29	PO-1097	\N	4744800.00	\N	\N	20
01a11c74-a3e8-7378-9f2b-70d45b208a42	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	ORD-1176	01a11c74-a216-77ce-baef-4da7e1148c67	2026-10-08	PO-1176	Include extended warranty.	4316400.00	\N	\N	40
01a11c74-a398-71ef-9a1b-d70c44311598	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	ORD-1045	01a11c74-9ffa-784d-b037-4570b6b01a46	2026-09-19	PO-1045	\N	4926600.00	\N	\N	40
01a11c74-a39c-76c4-8771-53f094abdd17	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	ORD-1051	01a11c74-a012-7ab8-840c-0c26f7b71e06	2026-07-18	PO-1051	Coordinate with procurement before invoicing.	4894392.00	\N	6.00	40
01a11c74-a3e7-774f-8799-2314c2bff2c1	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	ORD-1175	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-10-17	PO-1175	Ship in two batches.	4776793.00	366647.00	\N	40
01a11c74-a3eb-7fa5-83f1-8a82f5293e48	system	2026-10-08 16:59:28.927+00	\N	2026-10-08 16:59:28.927+00	\N	\N	1	ORD-1183	01a11c74-a216-77ce-baef-4da7e1148c67	2026-07-01	PO-1183	\N	5341800.00	\N	\N	20
01a11c74-a3c5-7b64-b9bc-26e4fbe61dea	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	ORD-1121	01a11c74-a14d-79f7-98a2-9e31e19c3c24	2026-05-31	PO-1121	\N	5709720.00	\N	\N	40
01a11c74-a3b0-7581-ac4d-869c951de7e8	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	ORD-1089	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	2026-07-15	PO-1089	\N	4741448.40	\N	22.00	40
01a11c74-a3a2-7a8f-86dd-9822875dc32d	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	ORD-1062	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-10-14	PO-1062	\N	5872200.00	\N	\N	20
01a11c74-a3dc-7839-9b8c-42e8d3af2c6c	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	ORD-1157	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-09-21	PO-1157	\N	3654600.00	\N	\N	30
01a11c74-a39e-7ef9-9da0-5219eda57ca3	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	ORD-1056	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-08-26	PO-1056	Customer asked for bulk discount.	3549600.00	\N	\N	40
01a11c74-a3e4-7360-9811-ed1d427758fc	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	ORD-1170	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-09-18	PO-1170	\N	2316037.00	1250123.00	\N	30
01a11c74-a3af-785e-89f4-2ec6bd48f977	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	ORD-1087	01a11c74-a0be-7f47-beab-8600ed3193cb	2026-06-06	PO-1087	Include extended warranty.	4159800.00	\N	\N	30
01a11c74-a3cd-7fae-8bbc-d2d4580d68f8	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	ORD-1133	01a11c74-a179-7347-a816-c242e83d8357	2026-08-08	PO-1133	\N	3338160.00	\N	\N	30
01a11c74-a394-7d68-8da6-5953b89a2adf	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	ORD-1040	01a11c74-9ffa-784d-b037-4570b6b01a46	2026-10-05	PO-1040	\N	4477800.00	\N	\N	40
01a11c74-a3ba-7a35-acfe-fd41f4170e53	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	ORD-1104	01a11c74-a107-7506-9b81-75b858244b15	2026-09-02	PO-1104	\N	5427000.00	\N	\N	40
01a11c74-a396-7547-a5f0-fb1bedac1975	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	ORD-1042	01a11c74-9ffa-784d-b037-4570b6b01a46	2026-09-16	PO-1042	\N	3849600.00	\N	\N	10
01a11c74-a3d2-7fd2-9aaa-302305c57d4f	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	ORD-1141	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-07-02	PO-1141	\N	4310760.00	\N	\N	20
01a11c74-a3b9-7cb0-a934-35107821fc92	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	ORD-1103	01a11c74-a107-7506-9b81-75b858244b15	2026-05-25	PO-1103	\N	5108640.00	\N	\N	40
01a11c74-a393-75db-975b-f75455af4ee4	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	ORD-1037	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	2026-06-04	PO-1037	Custom branding needed.	879600.00	\N	\N	20
01a11c74-a3e6-731e-905a-e375b21f14aa	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	ORD-1173	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-07-01	PO-1173	\N	3951000.00	\N	\N	40
01a11c74-a3bd-7c41-80aa-3b3b5c770ad0	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	ORD-1109	01a11c74-a11e-7639-9fdf-1699b47e1124	2026-10-09	PO-1109	Urgent delivery requested.	4840200.00	\N	\N	40
01a11c74-a38c-7760-ad1a-5aae8aed17a5	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	ORD-1027	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-10-05	PO-1027	\N	5023200.00	\N	\N	40
01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	ORD-1105	01a11c74-a107-7506-9b81-75b858244b15	2026-06-24	PO-1105	\N	2397122.00	1850398.00	\N	30
01a11c74-a3db-7b9d-b8a5-5f264b50536d	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	ORD-1156	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-04-29	PO-1156	\N	4440840.00	\N	\N	30
01a11c74-a3bb-7e66-8c14-c7fa5c2c060d	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	ORD-1106	01a11c74-a107-7506-9b81-75b858244b15	2026-07-10	PO-1106	\N	6812760.00	\N	\N	20
01a11c74-a3cb-74f5-97c0-59faa9c3aa22	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	ORD-1129	01a11c74-a163-7b85-a43c-74a51a5feb0c	2025-02-23	PO-1129	\N	3474240.00	\N	\N	10
01a11c74-a3ae-7bef-990d-5edd5f6f8f71	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	ORD-1085	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2026-07-21	PO-1085	\N	3649800.00	\N	\N	30
01a11c74-a382-7ae5-82e2-3ecfbf218ac0	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	ORD-1012	01a11c74-9f4a-72fd-bbed-cdadd537c3d0	2026-09-24	PO-1012	Customer asked for bulk discount.	3355800.00	\N	\N	40
01a11c74-a3b3-7e6a-b957-32692d29b951	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	ORD-1094	01a11c74-a0f0-7a76-afc1-0332e0e65590	2026-09-01	PO-1094	Customer asked for bulk discount.	3224340.00	\N	\N	40
01a11c74-a3a3-7958-88f1-a09723ea994e	system	2026-10-08 16:59:28.806+00	\N	2026-10-08 16:59:28.806+00	\N	\N	1	ORD-1064	01a11c74-a04c-7424-a2b7-311cf2cfac67	2024-12-28	PO-1064	Custom branding needed.	100800.00	\N	\N	40
01a11c74-a37c-729f-8c0f-be4230df3b0a	system	2026-10-08 16:59:28.719+00	\N	2026-10-08 16:59:28.719+00	\N	\N	1	ORD-1004	01a11c74-9f31-77fb-a047-051fc4dbeb47	2026-06-28	PO-1004	Coordinate with procurement before invoicing.	3203412.00	\N	18.00	30
01a11c74-a3b1-7d85-b82f-86153b47d162	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	ORD-1091	01a11c74-a0d6-7d2f-9560-f0f62699d2e2	2026-10-04	PO-1091	\N	5724000.00	\N	\N	40
01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	ORD-1152	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2025-12-06	PO-1152	\N	4969800.00	\N	\N	20
01a11c74-a3d7-7d3f-9099-24ca55fceb99	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	ORD-1151	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-08-17	PO-1151	Customer asked for bulk discount.	3951420.00	\N	\N	30
01a11c74-a3d7-7585-9091-f2d1ff99711a	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	ORD-1150	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-07-28	PO-1150	\N	5502600.00	\N	\N	30
01a11c74-a3e9-7d06-8e27-8e006fbf1e6f	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	ORD-1178	01a11c74-a216-77ce-baef-4da7e1148c67	2026-07-26	PO-1178	\N	3834000.00	\N	\N	20
01a11c74-a3c5-7476-b9b5-c3d17ae5ef43	system	2026-10-08 16:59:28.865+00	\N	2026-10-08 16:59:28.865+00	\N	\N	1	ORD-1120	01a11c74-a14d-79f7-98a2-9e31e19c3c24	2026-10-05	PO-1120	\N	3767400.00	\N	\N	40
01a11c74-a3d4-7770-b0ca-1525f6c4771e	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	ORD-1144	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-06-04	PO-1144	Customer asked for bulk discount.	4540800.00	\N	\N	30
01a11c74-a3be-744d-bc64-3f96bb960050	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	ORD-1110	01a11c74-a139-74d9-b074-88a64f49a13f	2026-08-06	PO-1110	Urgent delivery requested.	2666820.00	\N	\N	40
01a11c74-a3ae-708f-9901-f8b0f77346fd	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	ORD-1084	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2026-10-16	PO-1084	\N	5371200.00	\N	\N	40
01a11c74-a3b2-7774-8cec-087f70c8f671	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	ORD-1092	01a11c74-a0f0-7a76-afc1-0332e0e65590	2026-10-15	PO-1092	\N	4229220.00	\N	\N	40
01a11c74-a3dd-73b6-87e8-35871452edfb	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	ORD-1158	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-09-08	PO-1158	\N	3817800.00	\N	\N	30
01a11c74-a392-7b02-bad3-79fdf0bc7f20	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	ORD-1036	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	2026-09-28	PO-1036	\N	6174000.00	\N	\N	30
01a11c74-a3c8-7866-95d6-aa66b2ddf1e8	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	ORD-1125	01a11c74-a163-7b85-a43c-74a51a5feb0c	2026-09-22	PO-1125	\N	5516400.00	\N	\N	40
01a11c74-a3ca-7856-a822-9c9955870431	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	ORD-1128	01a11c74-a163-7b85-a43c-74a51a5feb0c	2026-09-03	PO-1128	\N	5670600.00	\N	\N	40
01a11c74-a3e2-719d-bbe7-e21685a68abe	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	ORD-1167	01a11c74-a1e6-72ed-986f-245eeed408fb	2026-06-10	PO-1167	Custom branding needed.	2447160.00	\N	\N	40
01a11c74-a397-76bc-b281-f8172f1b7071	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	ORD-1044	01a11c74-9ffa-784d-b037-4570b6b01a46	2026-08-31	PO-1044	\N	3757800.00	\N	\N	20
01a11c74-a390-782d-a8d6-aa6e731763d0	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	ORD-1032	01a11c74-9fa6-7887-a91e-a2e7b77d6368	2026-08-29	PO-1032	Include extended warranty.	4304400.00	\N	\N	20
01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	ORD-1136	01a11c74-a179-7347-a816-c242e83d8357	2026-09-08	PO-1136	Include extended warranty.	2965200.00	\N	\N	20
01a11c74-a3e1-7b89-827c-cf954a944950	system	2026-10-08 16:59:28.912+00	\N	2026-10-08 16:59:28.912+00	\N	\N	1	ORD-1166	01a11c74-a1e6-72ed-986f-245eeed408fb	2026-09-15	PO-1166	\N	2960400.00	\N	\N	10
01a11c74-a388-7845-b524-b38cfc6cdc67	system	2026-10-08 16:59:28.755+00	\N	2026-10-08 16:59:28.755+00	\N	\N	1	ORD-1021	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-07-19	PO-1021	Custom branding needed.	2889000.00	\N	\N	20
01a11c74-a3bf-7170-93a9-ed5de6f541ec	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	ORD-1111	01a11c74-a139-74d9-b074-88a64f49a13f	2026-08-25	PO-1111	Customer asked for bulk discount.	4723860.00	\N	\N	30
01a11c74-a3c2-7c41-b208-96ebf475406d	system	2026-10-08 16:59:28.861+00	\N	2026-10-08 16:59:28.861+00	\N	\N	1	ORD-1116	01a11c74-a139-74d9-b074-88a64f49a13f	2026-08-24	PO-1116	\N	2007000.00	\N	\N	30
01a11c74-a391-7276-90e7-5e2c36a16736	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	ORD-1033	01a11c74-9fa6-7887-a91e-a2e7b77d6368	2026-09-24	PO-1033	\N	2900720.00	1542880.00	\N	40
01a11c74-a3d1-7943-8ec7-99039099dbd5	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	ORD-1138	01a11c74-a179-7347-a816-c242e83d8357	2026-07-27	PO-1138	\N	4986000.00	\N	\N	40
01a11c74-a3de-7b3b-8776-180445299eb9	system	2026-10-08 16:59:28.907+00	\N	2026-10-08 16:59:28.907+00	\N	\N	1	ORD-1161	01a11c74-a1c6-74e5-90c9-0982c31c1520	2026-08-04	PO-1161	\N	4750200.00	\N	\N	40
01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	ORD-1118	01a11c74-a14d-79f7-98a2-9e31e19c3c24	2026-09-05	PO-1118	\N	2654588.00	829612.00	\N	20
01a11c74-a394-792f-8da3-6724ad9fec7e	system	2026-10-08 16:59:28.782+00	\N	2026-10-08 16:59:28.782+00	\N	\N	1	ORD-1039	01a11c74-9ffa-784d-b037-4570b6b01a46	2025-01-20	PO-1039	\N	249600.00	\N	\N	10
01a11c74-a3b7-78d4-9470-303134c9395a	system	2026-10-08 16:59:28.843+00	\N	2026-10-08 16:59:28.843+00	\N	\N	1	ORD-1099	01a11c74-a107-7506-9b81-75b858244b15	2026-10-11	PO-1099	\N	3992400.00	\N	\N	30
01a11c74-a398-7f8d-9a29-43e0c32202b7	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	ORD-1046	01a11c74-9ffa-784d-b037-4570b6b01a46	2026-06-27	PO-1046	Coordinate with procurement before invoicing.	4009260.00	\N	\N	30
01a11c74-a3a0-7c9f-8dd8-928b9728f447	system	2026-10-08 16:59:28.8+00	\N	2026-10-08 16:59:28.8+00	\N	\N	1	ORD-1059	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-03-06	PO-1059	Repeat order based on last year's contract.	4617000.00	\N	\N	40
01a11c74-a3a4-7e3d-aaff-54abedce29dc	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	ORD-1067	01a11c74-a06f-7887-860c-5b72f3a1fc25	2026-08-14	PO-1067	Repeat order based on last year's contract.	3887400.00	\N	\N	40
01a11c74-a3c4-770a-b6e6-ea696969a54e	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	ORD-1119	01a11c74-a14d-79f7-98a2-9e31e19c3c24	2026-05-26	PO-1119	Coordinate with procurement before invoicing.	4360440.00	\N	\N	40
01a11c74-a38a-7af5-baf7-f79ef6b110c8	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	ORD-1024	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-09-22	PO-1024	\N	5404800.00	\N	\N	40
01a11c74-a3a5-7b4f-a73d-b49ad274a3ef	system	2026-10-08 16:59:28.81+00	\N	2026-10-08 16:59:28.81+00	\N	\N	1	ORD-1069	01a11c74-a06f-7887-860c-5b72f3a1fc25	2026-08-20	PO-1069	Customer asked for bulk discount.	2362338.00	\N	1.00	40
01a11c74-a3aa-742d-a0c5-b786d0f28c06	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	ORD-1077	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2026-05-13	PO-1077	Include extended warranty.	3938400.00	\N	\N	40
01a11c74-a3a1-745e-adb5-0732387ef335	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	ORD-1060	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-09-09	PO-1060	\N	5235600.00	\N	\N	40
01a11c74-a3a1-7e35-adbf-a7a5e41a98b9	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	ORD-1061	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-08-21	PO-1061	Coordinate with procurement before invoicing.	3150840.00	\N	\N	20
01a11c74-a3a4-70e5-aaf1-a679b8ab1953	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	ORD-1066	01a11c74-a04c-7424-a2b7-311cf2cfac67	2026-07-05	PO-1066	Customer asked for bulk discount.	3355020.00	\N	\N	10
01a11c74-a3cc-7e24-ae58-c4703de10a0b	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	ORD-1131	01a11c74-a163-7b85-a43c-74a51a5feb0c	2026-08-19	PO-1131	Ship in two batches.	3393000.00	\N	\N	10
01a11c74-a3e5-75ef-84ce-95cc9d93d957	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	ORD-1172	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-06-05	PO-1172	Coordinate with procurement before invoicing.	1927740.00	\N	\N	40
01a11c74-a3c3-7170-9f0a-1b0897957d02	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	ORD-1117	01a11c74-a139-74d9-b074-88a64f49a13f	2026-09-24	PO-1117	Custom branding needed.	4232940.00	\N	\N	30
01a11c74-a3df-7f74-ab4c-91fe7dcdae0e	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	ORD-1163	01a11c74-a1c6-74e5-90c9-0982c31c1520	2026-10-05	PO-1163	Repeat order based on last year's contract.	4680000.00	\N	\N	20
01a11c74-a399-7ce1-8bba-01f68d93ee34	system	2026-10-08 16:59:28.79+00	\N	2026-10-08 16:59:28.79+00	\N	\N	1	ORD-1047	01a11c74-a012-7ab8-840c-0c26f7b71e06	2026-09-14	PO-1047	Urgent delivery requested.	2622000.00	\N	\N	20
01a11c74-a391-7bc6-90ef-688d40055423	system	2026-10-08 16:59:28.776+00	\N	2026-10-08 16:59:28.776+00	\N	\N	1	ORD-1034	01a11c74-9fa6-7887-a91e-a2e7b77d6368	2025-04-17	PO-1034	Customer asked for bulk discount.	705600.00	\N	\N	10
01a11c74-a3ac-7649-ac20-171ef61413cc	system	2026-10-08 16:59:28.826+00	\N	2026-10-08 16:59:28.826+00	\N	\N	1	ORD-1081	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2025-10-21	PO-1081	Requires onsite installation.	1224000.00	\N	\N	10
01a11c74-a3d9-7506-a2a0-d3b8f1f40c09	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	ORD-1153	01a11c74-a1ac-74c8-b2a9-08d0dc87345c	2026-09-29	PO-1153	\N	4244940.00	\N	\N	30
01a11c74-a3a5-7533-a737-e6885babfb29	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	ORD-1068	01a11c74-a06f-7887-860c-5b72f3a1fc25	2026-10-11	PO-1068	Coordinate with procurement before invoicing.	5151600.00	\N	\N	40
01a11c74-a37c-7c5a-8c17-d59251ec41ef	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	ORD-1005	01a11c74-9f31-77fb-a047-051fc4dbeb47	2026-09-28	PO-1005	\N	4863780.00	\N	\N	10
01a11c74-a37d-7c18-8ddf-5afd04995fab	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	ORD-1006	01a11c74-9f31-77fb-a047-051fc4dbeb47	2026-09-03	PO-1006	Requires onsite installation.	4296600.00	\N	\N	40
01a11c74-a397-722d-b27d-3a949ae4157a	system	2026-10-08 16:59:28.786+00	\N	2026-10-08 16:59:28.786+00	\N	\N	1	ORD-1043	01a11c74-9ffa-784d-b037-4570b6b01a46	2026-09-12	PO-1043	\N	1844400.00	\N	\N	10
01a11c74-a3d5-7316-abf8-4485c9de6aac	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	ORD-1145	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-10-05	PO-1145	\N	6378000.00	\N	\N	40
01a11c74-a3e4-7fca-981e-b5212ef39590	system	2026-10-08 16:59:28.917+00	\N	2026-10-08 16:59:28.917+00	\N	\N	1	ORD-1171	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-05-30	PO-1171	\N	2554200.00	\N	\N	20
01a11c74-a3a8-78ac-9820-3debe736b3f0	system	2026-10-08 16:59:28.817+00	\N	2026-10-08 16:59:28.817+00	\N	\N	1	ORD-1074	01a11c74-a08d-77eb-941f-009a8b83b02d	2026-09-30	PO-1074	\N	3110400.00	\N	\N	10
01a11c74-a3a3-7c9f-88f4-ea5945b1ad19	system	2026-10-08 16:59:28.806+00	\N	2026-10-08 16:59:28.806+00	\N	\N	1	ORD-1065	01a11c74-a04c-7424-a2b7-311cf2cfac67	2026-09-09	PO-1065	Urgent delivery requested.	1920000.00	\N	\N	20
01a11c74-a3e1-749b-8275-05c21f033b7e	system	2026-10-08 16:59:28.911+00	\N	2026-10-08 16:59:28.911+00	\N	\N	1	ORD-1165	01a11c74-a1e6-72ed-986f-245eeed408fb	2026-08-29	PO-1165	\N	3630600.00	\N	\N	20
01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4	system	2026-10-08 16:59:28.825+00	\N	2026-10-08 16:59:28.825+00	\N	\N	1	ORD-1080	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2026-09-25	PO-1080	\N	2385600.00	\N	\N	20
01a11c74-a3a0-778d-8dd3-477418e64b37	system	2026-10-08 16:59:28.8+00	\N	2026-10-08 16:59:28.8+00	\N	\N	1	ORD-1058	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-09-26	PO-1058	\N	3204000.00	\N	\N	40
01a11c74-a3aa-7f9d-a0d1-990e56e7fe1d	system	2026-10-08 16:59:28.823+00	\N	2026-10-08 16:59:28.823+00	\N	\N	1	ORD-1078	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2025-08-07	PO-1078	\N	301900.00	260900.00	\N	40
01a11c74-a37b-7b85-a9b6-dd9aeed6bf04	system	2026-10-08 16:59:28.718+00	\N	2026-10-08 16:59:28.718+00	\N	\N	1	ORD-1003	01a11c74-9ef1-7106-93d3-8a9df5e4b223	2026-08-22	PO-1003	\N	2663400.00	\N	\N	20
01a11c74-a393-7af9-975f-0ebf94c97c2a	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	ORD-1038	01a11c74-9fd3-72c4-bc60-86e0edb84bf4	2026-09-24	PO-1038	\N	4105080.00	\N	\N	40
01a11c74-a3c1-735c-a2b0-2737e09c0fb7	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	ORD-1114	01a11c74-a139-74d9-b074-88a64f49a13f	2026-10-10	PO-1114	\N	3736800.00	\N	\N	20
01a11c74-a3bc-7c00-85c9-45a7f12b7bdb	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	ORD-1107	01a11c74-a11e-7639-9fdf-1699b47e1124	2026-07-28	PO-1107	Ship in two batches.	6393000.00	\N	\N	30
01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	ORD-1169	01a11c74-a1ff-7785-9788-e74ef0b4c9c4	2026-09-26	PO-1169	Requires onsite installation.	4095000.00	\N	\N	20
01a11c74-a383-78e1-a983-80884ce4b713	system	2026-10-08 16:59:28.738+00	\N	2026-10-08 16:59:28.738+00	\N	\N	1	ORD-1013	01a11c74-9f4a-72fd-bbed-cdadd537c3d0	2026-10-08	PO-1013	Custom branding needed.	4440600.00	\N	\N	40
01a11c74-a3d0-7bdb-ba44-bf98ffd271a2	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	ORD-1137	01a11c74-a179-7347-a816-c242e83d8357	2026-07-08	PO-1137	\N	4221840.00	\N	\N	40
01a11c74-a3b7-7ecc-9476-1ff5cd305751	system	2026-10-08 16:59:28.844+00	\N	2026-10-08 16:59:28.844+00	\N	\N	1	ORD-1100	01a11c74-a107-7506-9b81-75b858244b15	2026-09-21	PO-1100	Custom branding needed.	3223200.00	\N	\N	30
01a11c74-a3c9-71fb-9f7f-80645a84840d	system	2026-10-08 16:59:28.872+00	\N	2026-10-08 16:59:28.872+00	\N	\N	1	ORD-1126	01a11c74-a163-7b85-a43c-74a51a5feb0c	2026-08-06	PO-1126	\N	1165224.00	\N	6.00	30
01a11c74-a3ad-7381-bf09-b5ff004181b2	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	ORD-1083	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2025-09-18	PO-1083	\N	3469860.00	\N	\N	20
01a11c74-a3c9-7981-9f83-7c0255e20a16	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	ORD-1127	01a11c74-a163-7b85-a43c-74a51a5feb0c	2026-05-30	PO-1127	\N	4819320.00	\N	\N	30
01a11c74-a3eb-7b81-83ed-8ec21249eaf9	system	2026-10-08 16:59:28.927+00	\N	2026-10-08 16:59:28.927+00	\N	\N	1	ORD-1182	01a11c74-a216-77ce-baef-4da7e1148c67	2026-07-06	PO-1182	\N	1580400.00	\N	\N	30
01a11c74-a3c7-7041-9b06-27a7356fd7de	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	ORD-1123	01a11c74-a14d-79f7-98a2-9e31e19c3c24	2026-07-29	PO-1123	Requires onsite installation.	5805720.00	\N	\N	40
01a11c74-a38c-717c-ad15-08b5568dd61e	system	2026-10-08 16:59:28.764+00	\N	2026-10-08 16:59:28.764+00	\N	\N	1	ORD-1026	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-07-04	PO-1026	Urgent delivery requested.	1911000.00	\N	\N	40
01a11c74-a37e-75f7-ba20-8e7877089db2	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	ORD-1007	01a11c74-9f31-77fb-a047-051fc4dbeb47	2026-06-01	PO-1007	\N	3249000.00	\N	\N	10
01a11c74-a3cf-7851-ab27-73c48d538682	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	ORD-1135	01a11c74-a179-7347-a816-c242e83d8357	2026-08-28	PO-1135	\N	3751200.00	\N	\N	20
01a11c74-a3d2-7b9d-9aa6-5009e7e69627	system	2026-10-08 16:59:28.887+00	\N	2026-10-08 16:59:28.887+00	\N	\N	1	ORD-1140	01a11c74-a179-7347-a816-c242e83d8357	2025-01-19	PO-1140	Coordinate with procurement before invoicing.	984000.00	\N	\N	30
01a11c74-a38d-7297-891b-00b18133b34f	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	ORD-1028	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-04-29	PO-1028	\N	3772620.00	\N	\N	20
01a11c74-a3d7-7116-908d-90a358cd42af	system	2026-10-08 16:59:28.895+00	\N	2026-10-08 16:59:28.895+00	\N	\N	1	ORD-1149	01a11c74-a193-76fd-94e9-0b29a9032f4a	2026-07-02	PO-1149	Urgent delivery requested.	1015584.00	\N	29.00	30
01a11c74-a3ab-74ac-b122-80ef179c0577	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	ORD-1079	01a11c74-a0aa-7bef-b23d-f90abd65e0a9	2026-08-12	PO-1079	Customer asked for bulk discount.	3343200.00	\N	\N	40
01a11c74-a381-70f9-904a-728222c44349	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	ORD-1010	01a11c74-9f31-77fb-a047-051fc4dbeb47	2026-09-27	PO-1010	\N	4388400.00	\N	\N	20
01a11c74-a39a-7d99-8ab5-055fb154d68c	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	ORD-1049	01a11c74-a012-7ab8-840c-0c26f7b71e06	2026-07-05	PO-1049	\N	2704558.00	1623242.00	\N	40
01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	ORD-1115	01a11c74-a139-74d9-b074-88a64f49a13f	2026-09-10	PO-1115	\N	2800200.00	\N	\N	10
01a11c74-a39e-7041-9d91-50050e450433	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	ORD-1054	01a11c74-a02d-7f47-aaef-74c827bc3bc4	2026-07-28	PO-1054	Custom branding needed.	5104800.00	\N	\N	10
01a11c74-a391-7f2b-90f1-3f7c686ee68e	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	ORD-1035	01a11c74-9fa6-7887-a91e-a2e7b77d6368	2025-06-17	PO-1035	\N	4710600.00	\N	\N	40
01a11c74-a3bf-7ecc-93b7-0af72cf5b308	system	2026-10-08 16:59:28.857+00	\N	2026-10-08 16:59:28.857+00	\N	\N	1	ORD-1112	01a11c74-a139-74d9-b074-88a64f49a13f	2026-09-25	PO-1112	\N	2977200.00	\N	\N	40
01a11c74-a3e8-7ff3-9f38-c3a1a0083135	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	ORD-1177	01a11c74-a216-77ce-baef-4da7e1148c67	2026-09-01	PO-1177	\N	4295100.00	\N	\N	10
01a11c74-a3ec-7676-b252-d450c14e7fdb	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	ORD-1184	01a11c74-a230-7249-85d3-fd922929da03	2026-08-20	PO-1184	\N	2965680.00	\N	\N	40
01a11c74-a37a-7cc0-95be-9c866039a521	system	2026-10-08 16:59:28.712+00	\N	2026-10-08 16:59:28.712+00	\N	\N	1	ORD-1002	01a11c74-9ef1-7106-93d3-8a9df5e4b223	2026-06-21	PO-1002	\N	2745288.00	\N	22.00	10
01a11c74-a389-7eb8-bcd5-97bdc1af96fb	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	ORD-1023	01a11c74-9f7f-7235-bac7-fca857bd64c8	2026-07-05	PO-1023	\N	2240732.00	1317868.00	\N	30
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_item (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, category_item_id, quantity, discount, net_price, gross_price, vat, order_id) FROM stdin;
01a11c74-a3e0-71ce-b80c-4e5557fc82b3	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e
01a11c74-a3ec-7e5a-b25a-b1509e9ef8f9	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3d4-7578-b0c8-79a0793fa4ca	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3d4-7251-b0c5-83f0972956fc
01a11c74-a3e5-7322-84cb-ea398b7d83eb	system	2026-10-08 16:59:28.917+00	\N	2026-10-08 16:59:28.917+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3e4-7fca-981e-b5212ef39590
01a11c74-a3cd-7191-8bad-846c584f5879	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a3cc-75df-ae4f-1544887abdaf	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a38a-7c1c-baf8-a2d831bed98c	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a392-716c-baca-c8482dee9e7a	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3e8-7b3f-9f33-4ae3a27a23b2	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3eb-78c8-83ea-da3d6c85c4fe	system	2026-10-08 16:59:28.926+00	\N	2026-10-08 16:59:28.926+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3eb-746a-83e6-23a06172b74f
01a11c74-a3aa-71fb-a0c3-372c1d267fa3	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	10.00	\N	5000.00	6000.00	1000.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3e7-7e20-87a0-01f206885789	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3ec-7589-b251-6c2f87925864	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	12.00	\N	60000.00	72000.00	12000.00	01a11c74-a3eb-7fa5-83f1-8a82f5293e48
01a11c74-a3bd-7b26-80a9-d7fa71f5773d	system	2026-10-08 16:59:28.853+00	\N	2026-10-08 16:59:28.853+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3bd-76d4-80a5-48dd04a155e2
01a11c74-a394-7f9d-8da8-9b45dc15c6cf	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a394-7d68-8da6-5953b89a2adf
01a11c74-a3e3-7e08-a92c-6e76e130548b	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6
01a11c74-a3ad-775c-bf0d-8124198c066d	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a381-771e-9050-e2460ee5a134	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a399-71b2-8bae-7b0f936d3224	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3e8-7893-9f30-e35a18988d38	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3d8-72fd-a099-2ef2ad70bf12	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a38a-762d-baf3-87eb8aefdc39	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	2.00	\N	12000.00	14400.00	2400.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a37b-73f7-a9b0-8da3f350347d	system	2026-10-08 16:59:28.713+00	\N	2026-10-08 16:59:28.713+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3ce-7f0e-87f7-5f5cd0203147	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3af-7c66-89f8-7fe95fa6940d	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a3d1-7568-8ec3-f9dde162edf6	system	2026-10-08 16:59:28.884+00	\N	2026-10-08 16:59:28.884+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	3.00	\N	3000.00	3600.00	600.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3a2-7791-86da-710bf0061807	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3b8-7116-817f-ff260ab094bd	system	2026-10-08 16:59:28.844+00	\N	2026-10-08 16:59:28.844+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3b7-7ecc-9476-1ff5cd305751
01a11c74-a3dc-7f2f-9b93-ff500039361d	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a395-7178-9b1c-301d6dbfb2cd	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a394-7d68-8da6-5953b89a2adf
01a11c74-a3be-7768-bc67-6dff6c248fb4	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a38c-7c18-ad1f-42e0b272159e	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3e4-7ecc-981d-ee0e98f3a105	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	11.00	\N	3300.00	3960.00	660.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a3b0-7991-ac51-242d40bddb40	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3aa-7560-a0c6-e6f4aac2c7b0	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3b9-7639-a92d-afb2a63eaf1a	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3bd-74bc-80a3-0d4f925311af	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3c2-7b12-b207-5a624679fee2	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	10.00	\N	1500.00	1800.00	300.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3cb-7eb4-97ca-ad6e56b9f0f6	system	2026-10-08 16:59:28.876+00	\N	2026-10-08 16:59:28.876+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3b3-7399-b94c-4b2d2922a710	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	3.00	\N	450.00	540.00	90.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3d5-7fc6-ac05-c4a0f45c501f	system	2026-10-08 16:59:28.892+00	\N	2026-10-08 16:59:28.892+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3d5-7d85-ac03-d28896651b0e
01a11c74-a3e7-7efd-87a1-936fa359b8af	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a37f-7bf3-b2ca-aca88d2efea2	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3c7-760c-9b0c-a6d5a37fcad3	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	10.00	\N	50000.00	60000.00	10000.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a38b-7778-971e-b2f427e4a145	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a3e6-7e49-9065-b2e6ae0b473a	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3a8-7bb6-9823-adbc71f51fd1	system	2026-10-08 16:59:28.817+00	\N	2026-10-08 16:59:28.817+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a8-78ac-9820-3debe736b3f0
01a11c74-a38f-7f70-ac80-1a8f6d3ad877	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a399-7e24-8bbb-25e73fd9b95d	system	2026-10-08 16:59:28.79+00	\N	2026-10-08 16:59:28.79+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	12.00	\N	144000.00	172800.00	28800.00	01a11c74-a399-7ce1-8bba-01f68d93ee34
01a11c74-a3c5-734b-b9b4-7450adc6e71d	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	6.00	\N	900.00	1080.00	180.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3d1-72ac-8ec0-c5fde205bda1	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3de-753b-8770-b2359e959f23	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3e9-76b0-8e20-d66bade9de41	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3a3-7eb0-88f6-0cdc8cd293d6	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3a3-7c9f-88f4-ea5945b1ad19
01a11c74-a3e5-7239-84ca-604685df07ef	system	2026-10-08 16:59:28.917+00	\N	2026-10-08 16:59:28.917+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3e4-7fca-981e-b5212ef39590
01a11c74-a3de-7f85-877a-625040f30f8a	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a3ee-73d7-9f28-22eb6ed37cbb	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3cd-75f7-8bb2-a6f292da1dde	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a3b5-7dd7-912b-87138d17e8f7	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a37c-7014-8c0e-5924c8ccfe82	system	2026-10-08 16:59:28.718+00	\N	2026-10-08 16:59:28.718+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a37b-7b85-a9b6-dd9aeed6bf04
01a11c74-a3b9-7004-a927-1d1e470801f8	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	11.00	\N	3300.00	3960.00	660.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3d8-74c0-a09b-b9ece231dd8f	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3b8-7e39-818d-74f01d5ae8c7	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3eb-7618-83e7-c958af6e5988	system	2026-10-08 16:59:28.926+00	\N	2026-10-08 16:59:28.926+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3eb-746a-83e6-23a06172b74f
01a11c74-a3db-7ed4-b8a8-16951149536d	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3dd-70f1-87e5-4ed94bfa0c90	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a3c3-758d-9f0e-eee39837207c	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	2.00	\N	15000.00	18000.00	3000.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3e4-7789-9815-58f666db6df9	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a3e1-70c0-8271-efb6e584dcbc	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3a0-7b6c-8dd7-303365d6a8c8	system	2026-10-08 16:59:28.8+00	\N	2026-10-08 16:59:28.8+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3a0-778d-8dd3-477418e64b37
01a11c74-a381-7364-904c-fe2cc34637cb	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a3ae-7ac4-990c-734a4dd066e0	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	3.00	\N	1500.00	1800.00	300.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a383-740c-a97f-359043508924	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3de-7a41-8775-560010fd45b5	system	2026-10-08 16:59:28.907+00	\N	2026-10-08 16:59:28.907+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3de-7716-8772-5ede282ee468
01a11c74-a39b-772f-896f-aa573df98d78	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a3c4-793b-b6e8-cb6c231e35fb	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a387-73f3-860a-a972f0b92347	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a396-7c1c-a5f7-aa33d38c0556	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	2.00	\N	16000.00	19200.00	3200.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3a4-7b1a-aafc-a070f6e8808a	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a399-754b-8bb2-12d987f9615d	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3c0-7431-96f9-01e1baed159d	system	2026-10-08 16:59:28.857+00	\N	2026-10-08 16:59:28.857+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3bf-7ecc-93b7-0af72cf5b308
01a11c74-a389-72b8-bcc9-5d8e791179e8	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3b1-7a8f-b82c-045dbe1b9c01	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3ce-7d4b-87f5-a2af446d7eba	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3d0-71b6-ba3a-f061f63a6521	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3e3-70bc-a91e-f6bce60c18ac	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3d4-7c9b-b0cf-5da1a0821176	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a3df-7760-ab43-2a121dddaa75	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a3d9-7922-a2a4-3c66ee6b9011	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3ea-746a-a411-2fd7ab38be6f	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a3bd-712b-809f-875969fec167	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3a9-7ab4-8748-fde5d998fb67	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3d6-7ba5-a836-601c79546e4e	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3a1-7851-adb9-01a5680d64d4	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a3d9-7231-a29d-e4008eb8b0ea	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3b6-7dba-ad55-500c325ce94f	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a385-78a3-bf2a-bdd641b0059f	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a37a-7fdb-95c1-084cae7a3d7c	system	2026-10-08 16:59:28.713+00	\N	2026-10-08 16:59:28.713+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3e6-785e-905f-889a762590d3	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3e6-731e-905a-e375b21f14aa
01a11c74-a3b6-7789-ad4f-7af7bac0e213	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3e4-769f-9814-0f0d2833dd19	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a3bd-73d7-80a2-da7a169e8f85	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3ad-7a08-bf10-1c3267f338b6	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a39a-7b60-8ab3-2ae679ec58c9	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3ad-703d-bf06-921034e2954b	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a3a0-7999-8dd5-da5f6508da51	system	2026-10-08 16:59:28.8+00	\N	2026-10-08 16:59:28.8+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	12.00	\N	48000.00	57600.00	9600.00	01a11c74-a3a0-778d-8dd3-477418e64b37
01a11c74-a3e3-7fc6-a92e-b5eda4fa979e	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6
01a11c74-a394-7eb4-8da7-c743b5fe49ad	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a394-7d68-8da6-5953b89a2adf
01a11c74-a3a9-71f7-873f-f7c241f95419	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a384-74bc-8d15-56b189ed0b42	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	3.00	\N	7500.00	9000.00	1500.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a3bc-72a3-85bf-b62708906824	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	12.00	\N	90000.00	108000.00	18000.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3c8-7024-95cd-5184a5c54f5a	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a394-754b-8da0-cf9ff5aea8af	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a389-7ba9-bcd3-2578cb22a6c1	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a397-7b95-b286-b5d55a209760	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3cf-7618-ab25-101b6449458a	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3b2-7e2d-8cf3-465f2e46507c	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3db-77fb-b8a2-46279cc75bb0	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3b1-78bc-b82a-3b3f13d907c0	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3c5-706e-b9b1-ac7f4367d2ae	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3cd-7dbe-8bba-11f6f44c7b31	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
01a11c74-a3b7-7404-946b-e4c074a2544d	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a393-7ef5-9763-2a9a23280efa	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a38a-7ec4-bafb-0dd15db2d756	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a3a5-7839-a73a-9999e2142745	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a5-7533-a737-e6885babfb29
01a11c74-a3a4-72f9-aaf3-a46952897783	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a398-731a-9a1c-8f7eaf11aa0f	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3e3-7ee9-a92d-286746daff90	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6
01a11c74-a3ac-707e-ac1a-d26fda175fa5	system	2026-10-08 16:59:28.825+00	\N	2026-10-08 16:59:28.825+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4
01a11c74-a38f-7926-ac7b-d3d90368b12b	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a396-7122-a5ec-0dc60b7d10c8	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a37d-74c8-8dd9-3fff32c15f9f	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3d3-7f78-b94f-96e4ac541a42	system	2026-10-08 16:59:28.889+00	\N	2026-10-08 16:59:28.889+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3d3-7c28-b94c-2c1e7f1b7be8
01a11c74-a386-7ee9-a184-e679665a2a34	system	2026-10-08 16:59:28.746+00	\N	2026-10-08 16:59:28.746+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a386-7c00-a181-870faca582b1
01a11c74-a39f-7b85-9f52-24e0d93d17ef	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3c5-7a45-b9bb-e36d47df039e	system	2026-10-08 16:59:28.865+00	\N	2026-10-08 16:59:28.865+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3c5-7476-b9b5-c3d17ae5ef43
01a11c74-a3e9-75d2-8e1f-4d34106b18f9	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3da-7147-828e-af6e039c1c5d	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	9.00	\N	1350.00	1620.00	270.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3a2-72fd-86d5-037f8a73b03a	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3d7-73a1-908f-1840eeeda026	system	2026-10-08 16:59:28.895+00	\N	2026-10-08 16:59:28.895+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3d7-7116-908d-90a358cd42af
01a11c74-a387-7f43-8615-ab03e24068f3	system	2026-10-08 16:59:28.75+00	\N	2026-10-08 16:59:28.75+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a387-7d3f-8613-ac5d86395f63
01a11c74-a3be-715c-bc61-83c980cfeaf1	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3bd-7c41-80aa-3b3b5c770ad0
01a11c74-a3aa-7d7c-a0cf-999a2fa94f57	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3d6-7808-a832-757886010bee	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3de-728f-876d-6d5b49a4fb95	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	10.00	\N	50000.00	60000.00	10000.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3b3-72ac-b94b-06c3eaa3427d	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3a5-7a1c-a73c-e68b720b3ac8	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a3a5-7533-a737-e6885babfb29
01a11c74-a3e4-7a45-9818-1e53f1b626d4	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a3b7-7a1c-9471-da85f7d56b38	system	2026-10-08 16:59:28.843+00	\N	2026-10-08 16:59:28.843+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3b7-78d4-9470-303134c9395a
01a11c74-a3e4-726a-9810-d52dfd09dc1e	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6
01a11c74-a3c8-73ba-95d1-580cb4182490	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a3c4-750e-b6e4-b51a90ba2351	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d
01a11c74-a3c3-7bdf-9f15-16ea1c365ace	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3cb-7bf3-97c7-beb6492597ae	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a390-714f-a8d0-3ce26546968b	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a385-7b68-bf2d-3d76ed65f125	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3b6-72f9-ad4a-154d0ef84868	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a390-705e-a8cf-cc04ea1e36e8	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a3a9-72dd-8740-c1845e48f901	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3c9-7f95-9f88-5a50ee5100d2	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3dc-7399-9b87-c5dfd8df79cc	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	11.00	\N	66000.00	79200.00	13200.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3a3-747e-88ec-ade8f63445e2	system	2026-10-08 16:59:28.805+00	\N	2026-10-08 16:59:28.805+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3a3-7337-88eb-7a9bdc26ed7e
01a11c74-a3d5-7476-abf9-43af6fb9119b	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a3c6-758d-915d-183b00ee2f6b	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a396-793f-a5f4-0e9894691272	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3a2-7d78-86e0-938772da6627	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a3a2-7e62-86e1-723c930d9cd4	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a39f-7d4b-9f54-733088e11e4c	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3c6-7200-9159-4d99d63e5d92	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3b2-79a5-8cee-80b4184e5cad	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3c2-7e72-b20a-596d9f412990	system	2026-10-08 16:59:28.861+00	\N	2026-10-08 16:59:28.861+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c2-7c41-b208-96ebf475406d
01a11c74-a3df-706e-ab3c-33cb0ffea52b	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a38b-7083-9718-c009aa746c20	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a3a1-731a-adb4-670c79d47565	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3a0-7c9f-8dd8-928b9728f447
01a11c74-a3a9-7c83-874a-d556b6df7c2c	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3df-7926-ab45-8d73e71a4686	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a3a6-7ac8-9bc3-3601c7b97f41	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3b1-79a1-b82b-fabf21aefab8	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3e4-7c18-981a-de36726c980c	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a396-7856-a5f3-641a0c4aedd8	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3e1-7a8f-827b-22fc611e8e70	system	2026-10-08 16:59:28.911+00	\N	2026-10-08 16:59:28.911+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3e1-749b-8275-05c21f033b7e
01a11c74-a38f-72ac-ac74-81b0714cba6a	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a387-75ba-860c-65e21ca6d646	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	3.00	\N	45000.00	54000.00	9000.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3b4-7a7a-8803-d6c33a544487	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	9.00	\N	1350.00	1620.00	270.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a382-7789-82e0-3e67cf5399fa	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3c0-7249-96f7-2fb9e2e90f4d	system	2026-10-08 16:59:28.857+00	\N	2026-10-08 16:59:28.857+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a3bf-7ecc-93b7-0af72cf5b308
01a11c74-a386-7726-a17d-9e5cd6d0ab52	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3c2-70e5-b1fc-659b8b49b00f	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a37d-76cc-8ddb-3db73c0ddd58	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	10.00	\N	10000.00	12000.00	2000.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3e8-7ef9-9f37-0ba526f67023	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a380-7cf5-b5b9-150433b43186	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a3de-745e-876f-b3fcbb368681	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3d6-74c8-a82f-bfa9e0bf8907	system	2026-10-08 16:59:28.893+00	\N	2026-10-08 16:59:28.893+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3d6-728b-a82d-6c10a052a694
01a11c74-a38d-74a7-891d-8457178ce0e1	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3d5-79ca-abff-b384363edf2d	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a3a0-739d-8dcf-8c0254fb4fbd	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a37d-72c8-8dd7-324d4c813afc	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a39c-7d9d-8778-f187a8d9be0c	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a389-7820-bccf-7d7f97badf21	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3ed-793b-8a0d-7a385dbf6821	system	2026-10-08 16:59:28.93+00	\N	2026-10-08 16:59:28.93+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	3.00	\N	45000.00	54000.00	9000.00	01a11c74-a3ed-73ef-8a08-5c75710ed9e8
01a11c74-a3d2-78c0-9aa3-f49be4e81395	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a3dc-718d-9b85-79d871718a3a	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3ba-772b-acfb-d0312be0df61	system	2026-10-08 16:59:28.848+00	\N	2026-10-08 16:59:28.848+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3ab-75df-b123-6a188f100fce	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a3cb-720c-97bd-29f0d2b8027b	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a394-7466-8d9f-a59ed1869d5a	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3aa-79df-a0cb-690f6e594593	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3e5-7cbc-84d5-dc5bc629d25b	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3bd-7210-80a0-36d490c90deb	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a394-70b8-8d9b-4c54ee8ac2f1	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3af-7564-89f1-c1ac233615dd	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3af-7418-89f0-6412357a9731
01a11c74-a3dc-7c76-9b90-96aa8fa7d9e7	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a393-7c45-9760-020da4cc64aa	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3aa-7810-a0c9-fac53a9fced5	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a386-7e04-a183-cee477b87283	system	2026-10-08 16:59:28.746+00	\N	2026-10-08 16:59:28.746+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a386-7c00-a181-870faca582b1
01a11c74-a38e-7014-9025-6984a0d6d4e3	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	2.00	\N	600.00	720.00	120.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a399-7f12-8bbc-28da1084832a	system	2026-10-08 16:59:28.79+00	\N	2026-10-08 16:59:28.79+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	2.00	\N	8000.00	9600.00	1600.00	01a11c74-a399-7ce1-8bba-01f68d93ee34
01a11c74-a3d4-7662-b0c9-d22692235bab	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3d4-7251-b0c5-83f0972956fc
01a11c74-a3ba-7fe3-ad03-3f18503c258e	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a3ba-7a35-acfe-fd41f4170e53
01a11c74-a3a5-7f3f-a741-875b58deda4d	system	2026-10-08 16:59:28.81+00	\N	2026-10-08 16:59:28.81+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3a5-7b4f-a73d-b49ad274a3ef
01a11c74-a3c5-7d8d-b9be-6381fd110594	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3d4-7493-b0c7-c93ae034a94a	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3d4-7251-b0c5-83f0972956fc
01a11c74-a3de-795c-8774-4418f499fafa	system	2026-10-08 16:59:28.907+00	\N	2026-10-08 16:59:28.907+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3de-7716-8772-5ede282ee468
01a11c74-a39d-78c4-b47b-bd0819b7f63d	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3b1-7eed-b830-70216abb87a3	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a39f-783d-9f4f-149a3c997226	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3e1-71a9-8272-1aac652df03d	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a384-7c0c-8d1b-58ed2d79c779	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a384-77d2-8d17-e5d37a5448b3
01a11c74-a3bf-7737-93af-fdd33ff02ab9	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	12.00	\N	60000.00	72000.00	12000.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a39f-7e31-9f55-64de6795adef	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3ea-7049-a40d-a794e3407551	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3e9-7d06-8e27-8e006fbf1e6f
01a11c74-a3e2-7306-bbe8-70653db10776	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3e2-7fce-bbf5-e622a6c9a09a	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3bd-7a3d-80a8-0b7f27f7ce17	system	2026-10-08 16:59:28.853+00	\N	2026-10-08 16:59:28.853+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3bd-76d4-80a5-48dd04a155e2
01a11c74-a398-78d9-9a22-a3c356571aae	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3db-70e5-b89a-ff90913edb20	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3a7-71ba-a97c-9b668d563dcd	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a39e-7506-9d96-3448b4b617c3	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a3b4-717c-87f9-f5688540be3b	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a3e4-786e-9816-e022177c01a2	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a3cb-7dca-97c9-5829a9efd6b0	system	2026-10-08 16:59:28.876+00	\N	2026-10-08 16:59:28.876+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a38e-713b-9026-699a8e0ea47a	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	9.00	\N	1350.00	1620.00	270.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3da-706a-828d-50a8c0b506b5	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	11.00	\N	3300.00	3960.00	660.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3b6-76b0-ad4e-223ad0ff6506	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3d5-7204-abf7-f0af601eac8b	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a380-7662-b5b4-52d56a2da4c0	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a3b9-78dd-a930-e0fd03a8ca59	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3ce-783d-87f0-36c0e652c9ff	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3af-7995-89f5-45d68f66c01e	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a3e9-7e8b-8e28-877ab517e749	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3e9-7d06-8e27-8e006fbf1e6f
01a11c74-a3eb-7cf5-83ee-2c53e0594b7c	system	2026-10-08 16:59:28.927+00	\N	2026-10-08 16:59:28.927+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3eb-7b81-83ed-8ec21249eaf9
01a11c74-a3be-7a20-bc6a-7a278024c526	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3d3-7a04-b94a-1c30c8f15fe7	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a381-7d4b-9055-f519723df775	system	2026-10-08 16:59:28.735+00	\N	2026-10-08 16:59:28.735+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3e0-7e08-b819-9fee1a9f9b32	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3e9-7883-8e22-05eca2ba962d	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3ec-73c2-b24f-814bafdfb634	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3eb-7fa5-83f1-8a82f5293e48
01a11c74-a3ed-7e45-8a12-acdd85df52aa	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a37a-7856-95bb-e81fa9d03308	system	2026-10-08 16:59:28.707+00	\N	2026-10-08 16:59:28.707+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a37a-7716-95ba-97f16ff1ab2c
01a11c74-a3bb-79a5-8c0f-053226ea8133	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3eb-77eb-83e9-7513f9ea948e	system	2026-10-08 16:59:28.926+00	\N	2026-10-08 16:59:28.926+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3eb-746a-83e6-23a06172b74f
01a11c74-a3b9-7b85-a933-a0be098e014a	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3b6-786e-ad50-252c22a00d7a	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3b6-75c2-ad4d-fffecfbad213	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3bc-7e39-85cb-fdc95e8e5595	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3ea-772f-a414-5fb6ae80510a	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a399-7635-8bb3-c9ff2bea404e	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3c5-76b8-b9b7-d9367b91c4f9	system	2026-10-08 16:59:28.865+00	\N	2026-10-08 16:59:28.865+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c5-7476-b9b5-c3d17ae5ef43
01a11c74-a3ac-7439-ac1e-2e7c1c4f9e6e	system	2026-10-08 16:59:28.825+00	\N	2026-10-08 16:59:28.825+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4
01a11c74-a3eb-7a8f-83ec-33a996efc637	system	2026-10-08 16:59:28.926+00	\N	2026-10-08 16:59:28.926+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3eb-746a-83e6-23a06172b74f
01a11c74-a3d1-7d47-8ecb-4a6c46313e11	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a399-7b9d-8bb9-5e55fffc28f2	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	3.00	\N	450.00	540.00	90.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a37c-7f81-8c1a-9518bebb946f	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	11.00	\N	99000.00	118800.00	19800.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3ba-738d-acf7-f3d04a2acdc6	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3a4-794f-aafa-2b306f8d20cd	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a37d-7f5c-8de2-9697ee87d7ee	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a37d-7c18-8ddf-5afd04995fab
01a11c74-a3c6-79be-9161-932aefec0597	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a3c6-7872-9160-d2a77a061c40
01a11c74-a3d2-7a8f-9aa5-10f086bebcc8	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a38f-7747-ac79-5006256b239e	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a3d3-712b-b940-27c760d82587	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3a2-704d-86d2-fd0990982549	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a39f-7018-9f46-77684fc4f249	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3d9-7062-a29b-084b384e6714	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3df-740c-ab40-53f51da452f3	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a3ad-7676-bf0c-a4930493a98b	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3c8-79be-95d7-505f6ce008a4	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a3d7-7004-908c-3f8e3a33d1e5	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	3.00	\N	3000.00	3600.00	600.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a37d-7d2f-8de0-e01c8d9b406e	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a37d-7c18-8ddf-5afd04995fab
01a11c74-a3b7-7dae-9475-6f275fa0c047	system	2026-10-08 16:59:28.843+00	\N	2026-10-08 16:59:28.843+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3b7-78d4-9470-303134c9395a
01a11c74-a3eb-7702-83e8-469da1598ee0	system	2026-10-08 16:59:28.926+00	\N	2026-10-08 16:59:28.926+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3eb-746a-83e6-23a06172b74f
01a11c74-a392-7f3b-bad7-8b1e058c764c	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a3b2-7b70-8cf0-312b27d5b71c	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3bb-7b68-8c11-dc72d0b97d3d	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	4.00	\N	2000.00	2400.00	400.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a397-70ac-b27c-ae1bf22503f5	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a39f-774f-9f4e-74599839129e	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	12.00	\N	30000.00	36000.00	6000.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3bd-75a9-80a4-2d14e14ca5a4	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3ce-7add-87f3-fa779821431b	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	11.00	\N	3300.00	3960.00	660.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3dd-7014-87e4-07380b113144	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a3e2-7d26-bbf3-6168be7515f7	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	6.00	\N	1800.00	2160.00	360.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3be-7599-bc65-6a1569a3f903	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3ac-7164-ac1b-b8f3d52555f0	system	2026-10-08 16:59:28.825+00	\N	2026-10-08 16:59:28.825+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4
01a11c74-a3e6-7778-905e-265203f3978a	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3e6-731e-905a-e375b21f14aa
01a11c74-a37b-72d9-a9af-dd910b8e8400	system	2026-10-08 16:59:28.713+00	\N	2026-10-08 16:59:28.713+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3c4-7851-b6e7-4ab8f8f01e14	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3b4-7991-8802-4ebc65a2b600	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	11.00	\N	3300.00	3960.00	660.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a37c-7e76-8c19-067237d203f5	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3c1-7d81-a2bb-e3d953d0e090	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	11.00	\N	5500.00	6600.00	1100.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a380-7ac8-b5b7-98e56be5232e	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a388-7028-b51e-455f44b47e2e	system	2026-10-08 16:59:28.75+00	\N	2026-10-08 16:59:28.75+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a387-7d3f-8613-ac5d86395f63
01a11c74-a395-708f-9b1b-497c5721d4b6	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a394-7d68-8da6-5953b89a2adf
01a11c74-a3a1-7ced-adbe-8b95d94d0463	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a3a7-76d0-a981-9720b1d47a0f	system	2026-10-08 16:59:28.813+00	\N	2026-10-08 16:59:28.813+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a7-75a1-a980-4f37200e8acf
01a11c74-a3ae-7f4b-9910-b98fc5281b1f	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3ae-7bef-990d-5edd5f6f8f71
01a11c74-a3db-7fc6-b8a9-6928e8fce15e	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3e2-7789-bbed-11ab03aedb78	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a384-7b1a-8d1a-17fc192342f5	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a384-77d2-8d17-e5d37a5448b3
01a11c74-a3a6-77f3-9bc0-84b79b7ea24e	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	3.00	\N	18000.00	21600.00	3600.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a37e-728f-ba1e-558f4b8d1d27	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a37d-7c18-8ddf-5afd04995fab
01a11c74-a3ec-7f43-b25b-1cf7399d43da	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	3.00	\N	7500.00	9000.00	1500.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3ea-7564-a412-47839d076ec8	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a392-752f-bace-f15f0f5b54d5	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3b2-71ba-8ce6-41ae7a9031cf	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a3b6-720c-ad49-6f7134bb6436	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3ce-73a5-87eb-1e8ffad84a9c	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a397-7f6c-b28a-1ef5a70913bc	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3cd-7ce1-8bb9-a46577d4256e	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
01a11c74-a3c4-7256-b6e1-5060101da3ec	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d
01a11c74-a3ec-79ca-b255-6ae70689bf1c	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3b4-750a-87fd-0aad123eb137	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a3b3-78cc-b951-67a109391c12	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a3a8-7693-981e-075666fa2684	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	2.00	\N	600.00	720.00	120.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a3b9-7e14-a935-e3b96aa22b60	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a397-7aac-b285-09a337e151d5	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	12.00	\N	90000.00	108000.00	18000.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3d1-70e1-8ebe-a0e56573f078	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3b8-7031-817e-e99e99285fd9	system	2026-10-08 16:59:28.844+00	\N	2026-10-08 16:59:28.844+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3b7-7ecc-9476-1ff5cd305751
01a11c74-a3b4-76e1-87ff-c6e17012bfa5	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a3a8-72fd-981a-d0ea92647e7a	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a3c8-7b95-95d9-f4fd1ff673fc	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	11.00	\N	99000.00	118800.00	19800.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a3b8-7733-8185-0150da8016e2	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3a0-71ce-8dcd-3e0696bef500	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a39e-76d4-9d98-aecd38850ad2	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a3c3-7768-9f10-06420b1168a7	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3a1-7f68-adc0-5a61b2d7e893	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3a7-789b-a983-18460d9501ee	system	2026-10-08 16:59:28.814+00	\N	2026-10-08 16:59:28.814+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3a7-75a1-a980-4f37200e8acf
01a11c74-a3c0-7cd4-9702-6bc2f1c18aea	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a3b8-7d5c-818c-2c3a8cd470a0	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3b9-7a97-a932-8c283ff7e5fb	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3dc-7649-9b8a-b72e0208bd10	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a37a-7368-95b9-c3baf64a2efc	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	12.00	\N	1800.00	2160.00	360.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a37e-7906-ba23-b40ed2b8cb6e	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a380-7753-b5b5-0474ca053f69	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a38d-758d-891e-500455da4d76	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3ee-74b4-9f29-b96e1359ea39	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3c9-734b-9f80-016f9d439f5b	system	2026-10-08 16:59:28.872+00	\N	2026-10-08 16:59:28.872+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3c9-71fb-9f7f-80645a84840d
01a11c74-a3d5-7c6e-ac02-339702c678c5	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	3.00	\N	3000.00	3600.00	600.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a383-7fdb-a987-6d759af0aef9	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a382-710a-82d9-0f5a8659e4d2	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3cc-7d06-ae57-733da7addbe9	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	2.00	\N	600.00	720.00	120.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a38f-7574-ac77-7d438a0bea34	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a37d-79be-8dde-d362136e60df	system	2026-10-08 16:59:28.722+00	\N	2026-10-08 16:59:28.722+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	7.00	\N	1050.00	1260.00	210.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3ce-79fb-87f2-6f16b4fc230f	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	3.00	\N	1500.00	1800.00	300.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a397-736c-b27e-9f1fb0c5cf13	system	2026-10-08 16:59:28.786+00	\N	2026-10-08 16:59:28.786+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a397-722d-b27d-3a949ae4157a
01a11c74-a3b3-7c5a-b955-de82aa64eb83	system	2026-10-08 16:59:28.838+00	\N	2026-10-08 16:59:28.838+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a390-79ae-a8d7-035ca7ca3631	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a39e-7160-9d92-0ba47c2cfb28	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a38a-78d0-baf6-e60a434aa320	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	11.00	\N	5500.00	6600.00	1100.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a3bf-7bb6-93b4-945701a5ef39	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3c4-7051-b6df-e073fdb55aa5	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d
01a11c74-a3bc-7641-85c3-c3592c6954a4	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3a8-7ad0-9822-2cd44d844bcb	system	2026-10-08 16:59:28.817+00	\N	2026-10-08 16:59:28.817+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a8-78ac-9820-3debe736b3f0
01a11c74-a3be-784d-bc68-da73cf081421	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a396-7deb-a5f9-ab021a284db5	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a38f-7afd-ac7d-2dbda5b54588	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a3ac-7c9f-ac26-6bf92d9a0704	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a3ac-7333-ac1d-40f119c50a4b	system	2026-10-08 16:59:28.825+00	\N	2026-10-08 16:59:28.825+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4
01a11c74-a37b-7912-a9b5-63ae55ebbd84	system	2026-10-08 16:59:28.714+00	\N	2026-10-08 16:59:28.714+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3b3-761c-b94e-9aad36029522	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a3ba-7cd9-ad00-3edffb5d1e01	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3ba-7a35-acfe-fd41f4170e53
01a11c74-a38b-7249-971a-abf9453cde89	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a3c1-7824-a2b5-71c7b856f6df	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3c0-7bf3-9701-dd2ae103f9ad	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a385-77c2-bf29-744bc90c5c16	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a391-7600-90ea-e5b5d60618dd	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a391-7276-90e7-5e2c36a16736
01a11c74-a3ad-7ca7-bf13-15af9ea717d1	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3e8-75d2-9f2d-a07bb166520e	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3e4-7b2f-9819-8834e4162288	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a3e6-7d60-9064-b776697030cf	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3d6-7ac4-a835-fe05fc56b08f	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3ea-7649-a413-36056839de96	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a3d4-7143-b0c4-0ccb51911638	system	2026-10-08 16:59:28.889+00	\N	2026-10-08 16:59:28.889+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3d3-7c28-b94c-2c1e7f1b7be8
01a11c74-a3b7-705e-9467-6ab58c92907e	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a3dc-70a7-9b84-56c7d8c80296	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3ad-711e-bf07-5ec6ecc54f8b	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a3d8-786a-a09f-5cf00db8fc7d	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3c2-7f58-b20b-f6075609dd9f	system	2026-10-08 16:59:28.861+00	\N	2026-10-08 16:59:28.861+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3c2-7c41-b208-96ebf475406d
01a11c74-a39d-705a-b473-17e77ba9a9f7	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a3ca-76e1-a821-80329f2c2b49	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	4.00	\N	600.00	720.00	120.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a381-7451-904d-f0da7e94d786	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a38d-73c6-891c-5b49049ef6da	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a37a-7ddf-95bf-9585c6eb6a2d	system	2026-10-08 16:59:28.712+00	\N	2026-10-08 16:59:28.712+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a383-76c0-a982-7cf1bf6d0f6c	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	10.00	\N	1500.00	1800.00	300.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3c0-7a31-96ff-6384397f0f07	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a3ea-712b-a40e-96ade8f19f67	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	12.00	\N	90000.00	108000.00	18000.00	01a11c74-a3e9-7d06-8e27-8e006fbf1e6f
01a11c74-a3b5-7683-9123-ad6019a83531	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a37e-705e-ba1c-fe4f4dbfcc39	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a37d-7c18-8ddf-5afd04995fab
01a11c74-a39c-7a04-8774-5154d0a49d61	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a3ca-7e7a-a828-8fedea922d0a	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a382-74d4-82dd-07dbc2631ad2	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a39c-72b4-876d-a6a404cdcc89	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a388-71eb-b520-50ceddc590e7	system	2026-10-08 16:59:28.75+00	\N	2026-10-08 16:59:28.75+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a387-7d3f-8613-ac5d86395f63
01a11c74-a399-7378-8bb0-81b3675ea9f4	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3dd-7dfb-87f2-7c5f81533b4c	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3a1-766e-adb7-3200af0483b4	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a3a1-793b-adba-01c160fb5ec7	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a3a2-74dd-86d7-0d5b83184d8f	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a39a-7c4d-8ab4-79e4db52c938	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3cc-731a-ae4c-bec9b2e79977	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a3c7-7368-9b09-aab391e76133	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3cd-735c-8baf-c2cfc62f0586	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a3d6-79db-a834-7888ac283326	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3a1-7235-adb3-6ebfdddbbd6a	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a3a0-7c9f-8dd8-928b9728f447
01a11c74-a39b-753f-896d-86e557e9e337	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	12.00	\N	72000.00	86400.00	14400.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a3db-79ce-b8a4-47952fd37b54	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3c9-7516-9f82-af072bf67a91	system	2026-10-08 16:59:28.872+00	\N	2026-10-08 16:59:28.872+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3c9-71fb-9f7f-80645a84840d
01a11c74-a3c5-75ce-b9b6-395562370f27	system	2026-10-08 16:59:28.865+00	\N	2026-10-08 16:59:28.865+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3c5-7476-b9b5-c3d17ae5ef43
01a11c74-a379-7a04-b787-7858d7601644	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a3cf-71a9-ab20-8283c0648d49	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3a7-7472-a97f-9db0e31b88b7	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a3bf-7045-93a8-51d3ffe04c11	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	9.00	\N	1350.00	1620.00	270.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3bd-7953-80a7-d96c13059cca	system	2026-10-08 16:59:28.853+00	\N	2026-10-08 16:59:28.853+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3bd-76d4-80a5-48dd04a155e2
01a11c74-a383-7160-a97c-5a44a6926735	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3ca-707a-a81a-e702ff954796	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a38b-7d9d-9725-b3d4778e5605	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a37f-75d7-b2c5-b4cfe7abc012	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a388-7b64-b527-5fe4e2da825d	system	2026-10-08 16:59:28.755+00	\N	2026-10-08 16:59:28.755+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a388-7845-b524-b38cfc6cdc67
01a11c74-a3ba-7efd-ad02-35439e8c6c9e	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3ba-7a35-acfe-fd41f4170e53
01a11c74-a397-747a-b27f-34f0fb15f3c1	system	2026-10-08 16:59:28.786+00	\N	2026-10-08 16:59:28.786+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a397-722d-b27d-3a949ae4157a
01a11c74-a37c-77f7-8c14-fdedadbe0535	system	2026-10-08 16:59:28.719+00	\N	2026-10-08 16:59:28.719+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a37c-729f-8c0f-be4230df3b0a
01a11c74-a384-71df-8d12-a314fe76bb84	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	10.00	\N	50000.00	60000.00	10000.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a3dd-71db-87e6-4f0472f0526b	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a386-7808-a17e-e72a60823440	system	2026-10-08 16:59:28.745+00	\N	2026-10-08 16:59:28.745+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a39a-7431-8aab-18a20c2c272a	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3d6-70a7-a82b-84df3f8f4d3e	system	2026-10-08 16:59:28.892+00	\N	2026-10-08 16:59:28.892+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d5-7d85-ac03-d28896651b0e
01a11c74-a3d2-71eb-9a9c-e0522ae5a0ad	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a3ca-7f58-a829-b788133ea65f	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a386-79ce-a180-a17653c1ff1a	system	2026-10-08 16:59:28.745+00	\N	2026-10-08 16:59:28.745+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	8.00	\N	1200.00	1440.00	240.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3b8-7ab8-8189-fcac241d8987	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3cc-77ae-ae51-aa7c604bc3dd	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a3e2-70a3-bbe6-ec052b324045	system	2026-10-08 16:59:28.912+00	\N	2026-10-08 16:59:28.912+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e1-7b89-827c-cf954a944950
01a11c74-a38c-72a7-ad16-8370c085cdc8	system	2026-10-08 16:59:28.764+00	\N	2026-10-08 16:59:28.764+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a38c-717c-ad15-08b5568dd61e
01a11c74-a3de-787a-8773-aa571dc937f4	system	2026-10-08 16:59:28.907+00	\N	2026-10-08 16:59:28.907+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a3de-7716-8772-5ede282ee468
01a11c74-a393-7200-9758-5cc199b81dd9	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a3b6-7a41-ad52-8da5d6b7202c	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3d5-780c-abfd-baa669281736	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a3a4-7866-aaf9-c1976de337b2	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a39b-781c-8970-f66138caa0fc	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a39b-761c-896e-7add61ca7792	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a379-7f4b-b78c-5c529a8b7365	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a380-738d-b5b1-5dbe44adfc72	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a3e4-7960-9817-0af288979e14	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a389-765e-bccd-8c87b4bd9ffc	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3ed-7112-8a05-c6db16b4f4dd	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a388-7d5c-b529-4737a6c8373e	system	2026-10-08 16:59:28.755+00	\N	2026-10-08 16:59:28.755+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a388-7845-b524-b38cfc6cdc67
01a11c74-a3d4-7062-b0c3-d604a8c51da8	system	2026-10-08 16:59:28.889+00	\N	2026-10-08 16:59:28.889+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3d3-7c28-b94c-2c1e7f1b7be8
01a11c74-a3c3-72d4-9f0b-88e5cd30d4ea	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	2.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3d2-7628-9aa0-a0bc5c41462f	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a3c2-72b8-b1fe-4dc862f90efd	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a387-785e-860f-3bb7fb267ba4	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3a8-75ae-981d-3c3089f3b636	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a392-7c76-bad4-6eacfc3e52ac	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a379-7c31-b789-225a084eff74	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a3a2-786e-86db-e4d0b7a1c90f	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	4.00	\N	2000.00	2400.00	400.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a37b-7810-a9b4-12bd10777217	system	2026-10-08 16:59:28.714+00	\N	2026-10-08 16:59:28.714+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	10.00	\N	5000.00	6000.00	1000.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a380-7199-b5af-60aca5e85e2a	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	2.00	\N	24000.00	28800.00	4800.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a37b-7e04-a9b8-4edb4cf0b2b3	system	2026-10-08 16:59:28.718+00	\N	2026-10-08 16:59:28.718+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a37b-7b85-a9b6-dd9aeed6bf04
01a11c74-a399-7ffb-8bbd-666047b5ed2f	system	2026-10-08 16:59:28.79+00	\N	2026-10-08 16:59:28.79+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a399-7ce1-8bba-01f68d93ee34
01a11c74-a3d8-759d-a09c-c30e4a7559f8	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3db-762d-b8a0-d5e3d2948efe	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	11.00	\N	66000.00	79200.00	13200.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3a9-78dd-8746-fc1536b5c9a2	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3d8-7218-a098-72a6d53a6fd0	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3d9-766e-a2a1-e1d5fdfe3e48	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a38a-77ef-baf5-392ef148cbd9	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a3c6-72e9-915a-f5c2f3b838b7	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3ad-7ae5-bf11-6e7b6bb5aff0	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3a3-7031-88e8-65c1b4f1149e	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a3a4-75be-aaf6-2a807119a89a	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3b3-7d47-b956-f93f49c0d23e	system	2026-10-08 16:59:28.838+00	\N	2026-10-08 16:59:28.838+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a3e5-74f1-84cd-f11494a52ef0	system	2026-10-08 16:59:28.917+00	\N	2026-10-08 16:59:28.917+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3e4-7fca-981e-b5212ef39590
01a11c74-a3b7-7afd-9472-270821041191	system	2026-10-08 16:59:28.843+00	\N	2026-10-08 16:59:28.843+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b7-78d4-9470-303134c9395a
01a11c74-a3cc-7f91-ae59-c4fe4b86da19	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a37a-7a5e-95bd-2f0b84e77e78	system	2026-10-08 16:59:28.707+00	\N	2026-10-08 16:59:28.707+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a37a-7716-95ba-97f16ff1ab2c
01a11c74-a39c-7cb4-8777-82a92c3131da	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a3df-7bca-ab48-ea7603091a69	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a38b-7428-971c-ea117ff94198	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a3ed-72f1-8a07-7fbf6bfdfda8	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	4.00	\N	600.00	720.00	120.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3e3-76ed-a925-d143e95fb606	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3d5-7ab4-ac00-3b522c3f2498	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	12.00	\N	72000.00	86400.00	14400.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a3d1-764d-8ec4-34ad193d5d04	system	2026-10-08 16:59:28.884+00	\N	2026-10-08 16:59:28.884+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3e6-75ae-905c-6435941a562a	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3e6-731e-905a-e375b21f14aa
01a11c74-a3d8-7687-a09d-abc347f257a3	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a384-70c8-8d11-90922e4b25f5	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a3a6-753f-9bbd-a1ae78b410a3	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3a4-7f7c-ab00-0adb0944fe1a	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3a4-7e3d-aaff-54abedce29dc
01a11c74-a3b5-74ac-9121-e79feaad14e2	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a390-7a9f-a8d8-512c33283c88	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a3e6-7ba1-9062-0b5d2bc90cfe	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3a4-7c04-aafd-528af41a9a3a	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3c5-7cb0-b9bd-bb3ad051b800	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3cb-712b-97bc-1306bdc9785d	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a3bf-7902-93b1-4c656ac5bffc	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3a1-7a24-adbb-3959c9ae66b6	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a3ae-7737-9908-69861c816014	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3cb-773f-97c2-5f2db66a904a	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3ce-7578-87ed-a585d4395afe	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3a2-76a7-86d9-128607fbc419	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3bb-7a8f-8c10-dec0a5953967	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a39d-76f5-b479-9c9ce8305d20	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	2.00	\N	24000.00	28800.00	4800.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3ea-7902-a416-a88344b97d5d	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a383-7d7c-a985-c22d858b6249	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a37c-74f5-8c11-eb9a7786548b	system	2026-10-08 16:59:28.719+00	\N	2026-10-08 16:59:28.719+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a37c-729f-8c0f-be4230df3b0a
01a11c74-a3b6-795c-ad51-4939594ced5e	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3ee-72f1-9f27-56cad40955fd	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3a5-791e-a73b-d036808656ae	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3a5-7533-a737-e6885babfb29
01a11c74-a395-742d-9b1f-188a50d1fbc8	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	2.00	\N	16000.00	19200.00	3200.00	01a11c74-a394-7d68-8da6-5953b89a2adf
01a11c74-a3e5-714f-84c9-059c1f1764f5	system	2026-10-08 16:59:28.917+00	\N	2026-10-08 16:59:28.917+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3e4-7fca-981e-b5212ef39590
01a11c74-a3c6-73c6-915b-1c8acfb1db5b	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3d8-7e8f-a0a5-9aad19e6bd7a	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3cb-7afd-97c6-cab8955ce8fa	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a37b-7f0e-a9b9-beb82e958602	system	2026-10-08 16:59:28.718+00	\N	2026-10-08 16:59:28.718+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a37b-7b85-a9b6-dd9aeed6bf04
01a11c74-a396-775c-a5f2-d8a6826e514c	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3c7-7f3b-9b15-ffca888fb79d	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	12.00	\N	144000.00	172800.00	28800.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a3ae-78fd-990a-a07564683a60	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a39f-71ef-9f48-e874c7495d67	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3b1-7fe3-b831-a4a0a16424d4	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a3b5-7a28-9127-9e961acbb530	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a3be-7f64-bc70-7b99b5a58ace	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	3.00	\N	900.00	1080.00	180.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3c3-7cc8-9f16-dbdfe20be4d8	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	6.00	\N	1800.00	2160.00	360.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a392-78ed-bad2-9f6283d2132d	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3e3-752b-a923-873fbb43e8c8	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3d0-7726-ba3f-53b0f822a9fc	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f
01a11c74-a37f-7ced-b2cb-960ecaa1b4a4	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3d0-729f-ba3b-36068727106c	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3ae-79df-990b-0d980c5d15fe	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3a1-7768-adb8-438c4ae6dad4	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a3c0-7045-96f5-bf575b225466	system	2026-10-08 16:59:28.857+00	\N	2026-10-08 16:59:28.857+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3bf-7ecc-93b7-0af72cf5b308
01a11c74-a3d9-7a00-a2a5-5f8b48d567e5	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3e0-7472-b80f-3e40246f1487	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e
01a11c74-a3cb-7831-97c3-132876c4e177	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3b7-74ed-946c-2cb2dea1ae0b	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a37e-780c-ba22-d3ea33b8844a	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a3b0-7b60-ac53-ebdb5c33ba90	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3e8-7c20-9f34-70c4e7b07e6c	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3e0-7631-b811-3190d9fa7486	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e
01a11c74-a390-7418-a8d3-eec2d1bc6b02	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a3e0-7b53-b816-70531984e827	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3aa-7649-a0c7-3c0c65dc79f7	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3a4-7218-aaf2-a3ac9f95b5d1	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3d4-7acc-b0cd-9bcad03e3617	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a3d2-745a-9a9e-699bb8e52723	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a3ce-748f-87ec-0ca17c8936a6	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	3.00	\N	45000.00	54000.00	9000.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3c9-7cd0-9f85-e8fe70880d81	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a395-733f-9b1e-d79396c3451b	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a394-7d68-8da6-5953b89a2adf
01a11c74-a382-76a3-82df-147e1ede3a66	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3d0-7ac8-ba43-d45ff9348551	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f
01a11c74-a3e9-7168-8e1a-a751da7ecfe4	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3d7-7a6e-9096-04690dd59d80	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3d7-7585-9091-f2d1ff99711a
01a11c74-a379-74d9-b784-dedf264864cd	system	2026-10-08 16:59:28.701+00	\N	2026-10-08 16:59:28.701+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a3b4-708b-87f8-447981311658	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a3d4-78c4-b0cb-d5551566331c	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a3bc-7389-85c0-699a7319f5e8	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3a2-794b-86dc-125dc95a742d	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3ea-7e5e-a41c-7f7328ec6c5e	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	6.00	\N	1800.00	2160.00	360.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a3cf-7537-ab24-c257f1974673	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3df-783d-ab44-b0a99e2a0a07	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a3c7-77df-9b0e-bef0a20f60c1	system	2026-10-08 16:59:28.869+00	\N	2026-10-08 16:59:28.869+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a389-7906-bcd0-6852c83a484d	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3b7-7cc4-9474-89da800a1f9d	system	2026-10-08 16:59:28.843+00	\N	2026-10-08 16:59:28.843+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	12.00	\N	90000.00	108000.00	18000.00	01a11c74-a3b7-78d4-9470-303134c9395a
01a11c74-a39f-7102-9f47-8cfeacc1eb6b	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3b7-75d7-946d-e985685782b7	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	11.00	\N	11000.00	13200.00	2200.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a3d7-72b0-908e-99d4a6fdd32c	system	2026-10-08 16:59:28.895+00	\N	2026-10-08 16:59:28.895+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3d7-7116-908d-90a358cd42af
01a11c74-a3da-74ac-8291-137f169e2d13	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a397-7e7e-b289-ddc8559bd34b	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3e0-789b-b813-ca16d214b99d	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3ac-786a-ac22-332fe946b4a7	system	2026-10-08 16:59:28.826+00	\N	2026-10-08 16:59:28.826+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3ac-7649-ac20-171ef61413cc
01a11c74-a3e8-7e18-9f36-32bdd0ff06a4	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3a6-7e18-9bc6-4832b0ae332d	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a392-77f7-bad1-e621232b2c33	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3d5-703d-abf5-80d4a0b8ce9f	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a383-75d7-a981-ee5cd3d3a60d	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3a9-74a3-8742-c4875796ccc3	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3a5-7d70-a73f-5f944eeeb57d	system	2026-10-08 16:59:28.81+00	\N	2026-10-08 16:59:28.81+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3a5-7b4f-a73d-b49ad274a3ef
01a11c74-a398-77f3-9a21-c33c47723264	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3dd-7b8d-87f0-f4f17337d72e	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a3de-71a5-876c-6017f8b8e891	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3b3-7a97-b953-d0cb90ad8df8	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a3d4-73b6-b0c6-cb0f376d0d3e	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3d4-7251-b0c5-83f0972956fc
01a11c74-a37c-75f7-8c12-ff8c31f78df4	system	2026-10-08 16:59:28.719+00	\N	2026-10-08 16:59:28.719+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a37c-729f-8c0f-be4230df3b0a
01a11c74-a3ac-7bb6-ac25-31c7014587f9	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a37b-7cfd-a9b7-454ed16df8a2	system	2026-10-08 16:59:28.718+00	\N	2026-10-08 16:59:28.718+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a37b-7b85-a9b6-dd9aeed6bf04
01a11c74-a3bb-762d-8c0b-14a746d1fb69	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3e5-7f74-84d8-445ff7fa85f3	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3c0-794f-96fe-f1434fe5dfe3	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a395-7c87-9b23-903777a22e68	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a387-7e62-8614-efff0564acb0	system	2026-10-08 16:59:28.75+00	\N	2026-10-08 16:59:28.75+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a387-7d3f-8613-ac5d86395f63
01a11c74-a388-710a-b51f-24290aa1ed5b	system	2026-10-08 16:59:28.75+00	\N	2026-10-08 16:59:28.75+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a387-7d3f-8613-ac5d86395f63
01a11c74-a3d9-7f81-a2ab-d848da643485	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	2.00	\N	1000.00	1200.00	200.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3af-711a-89ed-7f674d11ad30	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3ae-7bef-990d-5edd5f6f8f71
01a11c74-a3ae-764d-9907-e5f772f7574d	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3c0-7512-96fa-2aa614001686	system	2026-10-08 16:59:28.857+00	\N	2026-10-08 16:59:28.857+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3bf-7ecc-93b7-0af72cf5b308
01a11c74-a386-72b8-a178-f00ef355fba1	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3bf-7814-93b0-bafe284ebf94	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3cb-73d2-97bf-4c02badd78ae	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a3a6-719d-9bb9-02df011c4ed0	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3e1-7287-8273-c7d1bf49887e	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	6.00	\N	1800.00	2160.00	360.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a385-7266-bf23-f5243b90f76f	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3bb-7c4d-8c12-ccbf55dde747	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3bd-785e-80a6-82056297bc57	system	2026-10-08 16:59:28.853+00	\N	2026-10-08 16:59:28.853+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3bd-76d4-80a5-48dd04a155e2
01a11c74-a384-73d2-8d14-7ac09cae7825	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a380-7def-b5ba-b5e12a858617	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a391-73ce-90e8-d452de59cf77	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a391-7276-90e7-5e2c36a16736
01a11c74-a3df-7a04-ab46-cc38f2d62750	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a3ab-7a76-b128-018e83f59b34	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a3ec-7b99-b257-18111318fbb5	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3a0-7560-8dd1-9a7e5eedf717	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3c8-71ef-95cf-1e007fa08f69	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a3aa-7c93-a0ce-15db4ffb084f	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a39c-71ce-876c-cf8246f622b9	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3e0-7d22-b818-d7023f5d6e03	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	12.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a38a-70dd-baed-6ff99a46760d	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a3e3-7608-a924-0df32e40ddee	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3d0-763d-ba3e-d70d3e10dc7d	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	12.00	\N	48000.00	57600.00	9600.00	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f
01a11c74-a389-7493-bccb-1cfb160aa39b	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3c8-7f16-95dd-d29dddd43756	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a3db-7712-b8a1-646aafa5aa51	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a387-74d4-860b-32d5e1e11f46	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a37f-72e5-b2c2-6427fb82b935	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3e6-7943-9060-ec1ece0939f7	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	12.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e6-731e-905a-e375b21f14aa
01a11c74-a3bf-765a-93ae-f7abf4a6ace0	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3de-7618-8771-12236684a9d5	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a38c-7974-ad1c-6f6bba30760c	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a385-7a87-bf2c-784e14bedf6e	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3a6-78dd-9bc1-2ad6c76ca0bf	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3c7-78c4-9b0f-d5cafb93e5c3	system	2026-10-08 16:59:28.869+00	\N	2026-10-08 16:59:28.869+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a39f-766a-9f4d-880ca54cbdd5	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3b1-77ce-b829-9b061ea30b44	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3cb-7656-97c1-14eb344c7534	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3be-7326-bc63-d80bf0c3bb91	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3bd-7c41-80aa-3b3b5c770ad0
01a11c74-a39a-734f-8aaa-ed99bec22bc7	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3b2-729b-8ce7-f63bc6132d5b	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a3d3-72f1-b942-94994c540cc1	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a39c-70e1-876b-69583ddf3f76	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3e2-7a5a-bbf0-cf8b566a1234	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3e3-7a6a-a929-52592b54ae8c	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	7.00	\N	1050.00	1260.00	210.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3cb-7f9d-97cb-463218887af8	system	2026-10-08 16:59:28.876+00	\N	2026-10-08 16:59:28.876+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	4.00	\N	2000.00	2400.00	400.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3e2-796c-bbef-ac5f3585fe85	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3cd-727e-8bae-78cef07769ca	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a396-72f1-a5ee-747aa07fe65f	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a3b2-7a8f-8cef-797faa228ed0	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3d8-73e3-a09a-145c0f192ba7	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3ab-7c45-b12a-fb1dd0e34fbe	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a3a2-73f3-86d6-1c831b42db56	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3a8-7f1a-9826-505c7f98a9d6	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3bc-71b6-85be-2af35296e3a0	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3d1-772f-8ec5-b7662363b969	system	2026-10-08 16:59:28.884+00	\N	2026-10-08 16:59:28.884+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	4.00	\N	1200.00	1440.00	240.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3d0-7ff7-ba48-53df885a413f	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	2.00	\N	15000.00	18000.00	3000.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3ea-79e7-a417-42227b4a7cae	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a3e7-7578-8797-93613a2e2d15	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a393-780c-975d-854acdde0c8f	system	2026-10-08 16:59:28.779+00	\N	2026-10-08 16:59:28.779+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a393-75db-975b-f75455af4ee4
01a11c74-a3c8-7106-95ce-efb9ccb2dc61	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a37a-795c-95bc-883c19dcd475	system	2026-10-08 16:59:28.707+00	\N	2026-10-08 16:59:28.707+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a37a-7716-95ba-97f16ff1ab2c
01a11c74-a3ba-7564-acf9-6f6c2b8d183e	system	2026-10-08 16:59:28.848+00	\N	2026-10-08 16:59:28.848+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a38d-7ee9-8926-b98eeabd1322	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3e6-7224-9059-f728adcb753b	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a399-70c4-8bad-b19742ac10d7	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3ca-74f5-a81f-9e6c5aa6c44f	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	10.00	\N	5000.00	6000.00	1000.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3b4-75f3-87fe-70a19e2f023c	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	3.00	\N	18000.00	21600.00	3600.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a387-7312-8609-47e07fabb547	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3c4-7b0a-b6ea-0a92056ae6f9	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3d7-7e9b-909a-c367f2000b83	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3ee-774f-9f2c-d5a1dc5fc95d	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	6.00	\N	900.00	1080.00	180.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3c5-7e6a-b9bf-6b44d942e359	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3a9-70e1-873e-32ee64040d7f	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3c6-7e45-9166-08abe268f8b9	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c6-7872-9160-d2a77a061c40
01a11c74-a3dd-78d9-87ed-0d34c1ece806	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a3d2-79a9-9aa4-0a9893c1aeab	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a3b5-7076-911d-cef444678298	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b4-7ba9-8804-de6c86d78aa4
01a11c74-a3be-7045-bc60-75f78e1be665	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3bd-7c41-80aa-3b3b5c770ad0
01a11c74-a3b2-7f16-8cf4-0c73056ca59a	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3d3-7e93-b94e-188bedbe6981	system	2026-10-08 16:59:28.889+00	\N	2026-10-08 16:59:28.889+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3d3-7c28-b94c-2c1e7f1b7be8
01a11c74-a389-7c8b-bcd4-b25a6b15c7e6	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3e6-705a-9057-ddf01842e558	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3c3-73be-9f0c-a39c555bbe4c	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3b0-7a7a-ac52-5be847d1ec78	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3a6-7f02-9bc7-355414d990b1	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a3c9-7db6-9f86-b50ab8225730	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3ae-72ac-9903-15477f01ad0a	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3a7-7db2-a988-3861a8ce9dd4	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a393-711a-9757-b6eb3dc6f937	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a3a4-7a35-aafb-be287239d737	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a393-72e5-9759-453e6fdaaa32	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a397-7570-b280-2df7a21c97c3	system	2026-10-08 16:59:28.786+00	\N	2026-10-08 16:59:28.786+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a397-722d-b27d-3a949ae4157a
01a11c74-a3db-729f-b89c-3038af90b614	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a37d-78c4-8ddd-e8a33ce4fa83	system	2026-10-08 16:59:28.722+00	\N	2026-10-08 16:59:28.722+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	4.00	\N	1200.00	1440.00	240.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3bf-749b-93ac-2b4a0dcf50b1	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3a8-73e7-981b-708eb6b21b33	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a39d-7b70-b47e-ff4822a7cfbf	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a38e-7a0c-902a-6d032291c402	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a38e-7560-9027-f597d13890d5
01a11c74-a3d6-78f1-a833-7ddc0fa442c6	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a39a-78b4-8ab0-b6997939531b	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3e8-77ae-9f2f-08052c1cf656	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a391-74b8-90e9-add01ea811a9	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a391-7276-90e7-5e2c36a16736
01a11c74-a3ea-7ac4-a418-40927252e5df	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a395-725a-9b1d-811ae9c7cc3e	system	2026-10-08 16:59:28.783+00	\N	2026-10-08 16:59:28.783+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a394-7d68-8da6-5953b89a2adf
01a11c74-a3b8-7b95-818a-0c51066a40e8	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a382-7bfb-82e3-6f0d667555f9	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3ce-7feb-87f8-48433c90720e	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3ed-7f64-8a13-c2807adbee15	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3d1-7f12-8ecd-30d9b51d54ca	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a3ed-7c8b-8a10-44ed2f861ab8	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a381-726e-904b-0d022933ccfc	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a3cb-7041-97bb-243aa571a0c2	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a38b-7a1c-9721-e09fd1973f8d	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a394-7283-8d9d-c811884f4db5	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	3.00	\N	18000.00	21600.00	3600.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3e1-7cf1-827d-83726b7cc20c	system	2026-10-08 16:59:28.912+00	\N	2026-10-08 16:59:28.912+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a3e1-7b89-827c-cf954a944950
01a11c74-a3ae-747e-9905-5def5ca9f117	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3e8-7974-9f31-299a42b218f6	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3b9-7716-a92e-9742d49d409b	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3cc-7b33-ae55-54505652b1a0	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a3eb-7297-83e4-ab13909962a9	system	2026-10-08 16:59:28.925+00	\N	2026-10-08 16:59:28.925+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3eb-7035-83e2-775fb47a89b9
01a11c74-a3ba-70d9-acf4-cf460aecbe7c	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3e4-7deb-981c-1af1dbacdbbb	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a383-7326-a97e-cab4c5995431	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3e6-7697-905d-cf56c532ce70	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3e6-731e-905a-e375b21f14aa
01a11c74-a386-7d1e-a182-7b543a303e7f	system	2026-10-08 16:59:28.746+00	\N	2026-10-08 16:59:28.746+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a386-7c00-a181-870faca582b1
01a11c74-a3a9-7000-873d-498b7a60b371	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a39b-71a1-8969-ed20a9a42360	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a3ca-7cb4-a826-6e12e91e19b6	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a3c2-7a31-b206-68144a72add7	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a37e-7f43-ba29-45f85186b54b	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a3c9-70dd-9f7e-bc0029ff110b	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a3c8-749b-95d2-0c12ce6c96ac	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a390-7b89-a8d9-bfb51e699eec	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a3ce-70f9-87e8-cb78766aa0ff	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3e7-7d43-879f-09df0ab95bfb	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a398-770a-9a20-5d501bcfe7a8	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3e7-7656-8798-0a1b1ae0a85d	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	3.00	\N	450.00	540.00	90.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3c2-7953-b205-a70a87591b08	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a39d-7d2f-b480-8b64ba546fd8	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a398-79c6-9a23-68350c96f21d	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3b3-76f9-b94f-82b2197d66cd	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a3be-7d99-bc6e-5e64c76c1537	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3e3-7360-a921-3107506b8b5f	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	12.00	\N	180000.00	216000.00	36000.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a39f-7497-9f4b-1002d60561a0	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3d7-7c31-9098-e6bd07ba27c7	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a3d7-7585-9091-f2d1ff99711a
01a11c74-a37e-7d53-ba27-c41f1b958eba	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a3b0-7374-ac4b-a1df22caf7a5	system	2026-10-08 16:59:28.832+00	\N	2026-10-08 16:59:28.832+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b0-7122-ac49-4b7b12f30887
01a11c74-a3e1-7de7-827e-e9c0c8361ba1	system	2026-10-08 16:59:28.912+00	\N	2026-10-08 16:59:28.912+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3e1-7b89-827c-cf954a944950
01a11c74-a3a8-713b-9818-564cfb671b1d	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a37d-75ca-8dda-1e8b2018abf5	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a39b-7451-896c-ff39dedbb149	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a39c-7828-8772-e189389129bc	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a3d0-70d9-ba39-9c760d44f196	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	3.00	\N	7500.00	9000.00	1500.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3a7-70d0-a97b-be40830dea0d	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a3cd-7866-8bb4-826f4a3fa210	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
01a11c74-a3ee-7208-9f26-f37f083a307e	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a387-7b06-8612-b675337c2491	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3ea-7bae-a419-1121765f0b6d	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a3b3-7fa1-b958-18a6034ebb78	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a384-7f06-8d1e-0fbdd22e716b	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a384-77d2-8d17-e5d37a5448b3
01a11c74-a3b1-7b74-b82d-0d6860688d6d	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3b5-793b-9126-4e37f71f9bdc	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a392-7e4d-bad6-8f518b13a804	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a3d3-767a-b946-8a3f8aeaa1ee	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3ad-792b-bf0f-3b27ee46eee1	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3dd-7a93-87ef-37b553a84e8c	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a3af-71fb-89ee-cffae35f7195	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3ae-7bef-990d-5edd5f6f8f71
01a11c74-a39c-7487-876f-0cd3a2b953b2	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	6.00	\N	1800.00	2160.00	360.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3e9-7c0c-8e26-d24127a4657a	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a384-72e9-8d13-84108c252c3a	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a394-7b60-8da5-ef9c0c04e1d7	system	2026-10-08 16:59:28.782+00	\N	2026-10-08 16:59:28.782+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a394-792f-8da3-6724ad9fec7e
01a11c74-a3c6-7116-9158-05b36bd6454a	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3e1-7ed4-827f-6d4edd1d337e	system	2026-10-08 16:59:28.912+00	\N	2026-10-08 16:59:28.912+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	11.00	\N	99000.00	118800.00	19800.00	01a11c74-a3e1-7b89-827c-cf954a944950
01a11c74-a3c6-7d64-9165-f2da582cbc3d	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3c6-7872-9160-d2a77a061c40
01a11c74-a38c-7893-ad1b-4c9a845c2729	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3cc-74f5-ae4e-0df449fa6eba	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a3db-7def-b8a7-6dba2d193dbe	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3bc-79c6-85c7-204e7b133bbf	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3c8-7c7a-95da-d439efbf2990	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	12.00	\N	90000.00	108000.00	18000.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a3cf-70c8-ab1f-29a04e8465e4	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3c3-7a18-9f13-5dae07552a22	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a398-7d58-9a27-ac7058b18497	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3bb-7d33-8c13-8c2706cad540	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	12.00	\N	1800.00	2160.00	360.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3db-71c2-b89b-532b0d48e92d	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3db-78e1-b8a3-681b58ce9474	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	4.00	\N	2000.00	2400.00	400.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3c4-7e93-b6ee-364e15547b96	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a38e-7beb-902c-332981b812eb	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a38e-7560-9027-f597d13890d5
01a11c74-a3d6-75a5-a830-d7bbcd2a460b	system	2026-10-08 16:59:28.893+00	\N	2026-10-08 16:59:28.893+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3d6-728b-a82d-6c10a052a694
01a11c74-a3d1-7b81-8ec9-abc38149f9c5	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a37f-74dd-b2c4-f8410664a529	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3a8-7056-9817-5d27d01c47d8	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a3b9-7fef-a937-379def8f1d0a	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3df-7ca7-ab49-5e18eea39373	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a396-7a28-a5f5-d6ebf36b3e8f	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3af-72e5-89ef-62ac8eaaf481	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3ae-7bef-990d-5edd5f6f8f71
01a11c74-a3eb-7dd7-83ef-ca0c656f069f	system	2026-10-08 16:59:28.927+00	\N	2026-10-08 16:59:28.927+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3eb-7b81-83ed-8ec21249eaf9
01a11c74-a39f-7585-9f4c-80250ab4bba4	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a37e-7391-ba1f-6ebdf3976b63	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a37d-7c18-8ddf-5afd04995fab
01a11c74-a37c-73ef-8c10-176329fd7f37	system	2026-10-08 16:59:28.719+00	\N	2026-10-08 16:59:28.719+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a37c-729f-8c0f-be4230df3b0a
01a11c74-a3c6-7c7e-9164-1426f6eac2da	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3c6-7872-9160-d2a77a061c40
01a11c74-a3ab-7d2b-b12b-e472c6808de0	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a39e-7333-9d94-bc4b9d026c57	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a3cf-7370-ab22-45fc6e1ed459	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3e9-7b2b-8e25-022d3c16a512	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3e0-7553-b810-04c077214243	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	12.00	\N	60000.00	72000.00	12000.00	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e
01a11c74-a39a-7fce-8ab7-8faf6025918d	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a3d9-73f7-a29f-4d8e8378f35f	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3aa-710e-a0c2-ab12a6ea9174	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3b1-7516-b826-5c8ab06abed0	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3b4-734f-87fb-5cc0e5d841c2	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a37a-7160-95b7-b5bdda4df202	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a384-79fb-8d19-8e81a07d7c79	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a384-77d2-8d17-e5d37a5448b3
01a11c74-a3b1-76e5-b828-c14d03c48dbb	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3c4-7f81-b6ef-eba684f12fea	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3a7-7981-a984-b1b81be7e599	system	2026-10-08 16:59:28.814+00	\N	2026-10-08 16:59:28.814+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3a7-75a1-a980-4f37200e8acf
01a11c74-a39e-789b-9d9a-5e57aeec26b8	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a3e8-7d33-9f35-471476d5e592	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3b5-7249-911f-f38a4d85f90a	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3b4-7ba9-8804-de6c86d78aa4
01a11c74-a38c-754f-ad19-8a4cee3746c9	system	2026-10-08 16:59:28.764+00	\N	2026-10-08 16:59:28.764+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a38c-717c-ad15-08b5568dd61e
01a11c74-a3d0-79e7-ba42-c197f9ef4906	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	10.00	\N	50000.00	60000.00	10000.00	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f
01a11c74-a3e2-73ef-bbe9-3ee4f4fbe70e	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a37e-718d-ba1d-d0f7a3550911	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a37d-7c18-8ddf-5afd04995fab
01a11c74-a3af-7ff7-89fc-d2de5a75ff0d	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a3bb-7385-8c08-b3319cc2be8d	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3bc-7ab0-85c8-e1fcc9bc4296	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	8.00	\N	1200.00	1440.00	240.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3b8-78f5-8187-250d02fc2007	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a39b-736c-896b-bcb02e424b36	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a3bc-771e-85c4-81dff437a4bb	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3dc-7568-9b89-0526ceb4887c	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a386-70ed-a176-dab460663538	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a390-7f4f-a8dd-5153a4cd6150	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a3da-7d85-829b-03a84dc1e62d	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3d3-7214-b941-2a8a4c1313ab	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3b0-76e5-ac4e-47633c6f6c63	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3cd-70b4-8bac-f447eb14c895	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a391-76e5-90eb-0e55845d14cd	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a391-7276-90e7-5e2c36a16736
01a11c74-a3d3-7758-b947-45fde4e08c7f	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3a0-7a7e-8dd6-79cb9c4931bf	system	2026-10-08 16:59:28.8+00	\N	2026-10-08 16:59:28.8+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a0-778d-8dd3-477418e64b37
01a11c74-a3de-7cd4-8777-944f81bd7c7c	system	2026-10-08 16:59:28.907+00	\N	2026-10-08 16:59:28.907+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a3bc-7476-85c1-8baa60836e66	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3ce-7e31-87f6-6d99fcc19839	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3da-7595-8292-d25154e16c46	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a380-7bef-b5b8-6500d3212f7b	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a3db-7d0e-b8a6-58f735d874b2	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a393-7d2b-9761-17904255d08a	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a391-7045-90e6-d491e91e00c2	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a3db-7543-b89f-d0c7ca7fc979	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3e7-78b8-879a-f9fbeb0c1ff5	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3ac-7781-ac21-abf01e28c29c	system	2026-10-08 16:59:28.826+00	\N	2026-10-08 16:59:28.826+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ac-7649-ac20-171ef61413cc
01a11c74-a3d6-7e3d-a839-0b3a3d481240	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3ec-7c7e-b258-2fc0c2eea54c	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3e9-7a49-8e24-3c4e038b7efa	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	10.00	\N	5000.00	6000.00	1000.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3aa-772f-a0c8-1ba2304dad7e	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3a6-736c-9bbb-5f214f37fe3a	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a38a-7de3-bafa-63fd8f01d7db	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a3d8-705a-a096-779d86abfec1	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3ac-7e6e-ac28-1f2c02ae8325	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a37f-78a3-b2c7-751d7f2f0f78	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3cf-79b6-ab28-90cf777f35e5	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3e3-77ce-a926-1519e08c6576	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3e5-7aed-84d3-8a3ca0e05f9d	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	3.00	\N	45000.00	54000.00	9000.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3a3-773f-88ef-a2580bd97677	system	2026-10-08 16:59:28.805+00	\N	2026-10-08 16:59:28.805+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3a3-7337-88eb-7a9bdc26ed7e
01a11c74-a3c2-7831-b204-60d60755e0eb	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3bf-7ad4-93b3-a8a5634afe62	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3c4-7db2-b6ed-213895d0459f	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a39d-79a9-b47c-df8aae3c48d5	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3dd-76f9-87eb-d1a444ede071	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a3a3-711a-88e9-fe9fdb529fed	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a3c8-7d58-95db-d8dea78e1219	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a3b2-7558-8cea-9290e02f35b2	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a3e3-78ac-a927-1c65268e5862	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	3.00	\N	1500.00	1800.00	300.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a37a-7edd-95c0-19980189f3bf	system	2026-10-08 16:59:28.712+00	\N	2026-10-08 16:59:28.712+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3bd-7e7a-80ac-f6a82cf6ffd3	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3bd-7c41-80aa-3b3b5c770ad0
01a11c74-a38d-7d02-8924-d47ddabeb5f2	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3b7-7bdb-9473-41547e47c392	system	2026-10-08 16:59:28.843+00	\N	2026-10-08 16:59:28.843+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3b7-78d4-9470-303134c9395a
01a11c74-a389-7578-bccc-0f498611d066	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3d2-7ec8-9aa9-2f4726b39476	system	2026-10-08 16:59:28.887+00	\N	2026-10-08 16:59:28.887+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a3d2-7b9d-9aa6-5009e7e69627
01a11c74-a3c3-74a3-9f0d-e8f5139b14be	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3ba-764d-acfa-6095f691c76c	system	2026-10-08 16:59:28.848+00	\N	2026-10-08 16:59:28.848+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3a8-7774-981f-7ab2eae346e6	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	6.00	\N	900.00	1080.00	180.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a3c8-7aac-95d8-d2abc9b6ede2	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a382-7ce5-82e4-e28a988a3e96	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3d9-7bfb-a2a7-584958689778	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3e0-7a6a-b815-6cba7e9e7745	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3b5-7cd9-912a-47cd343a728e	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a38f-7839-ac7a-d2b4385dda3e	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a3e9-74e9-8e1e-bbe16223ad29	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3a3-7651-88ee-aa1732bd5d8d	system	2026-10-08 16:59:28.805+00	\N	2026-10-08 16:59:28.805+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3a3-7337-88eb-7a9bdc26ed7e
01a11c74-a3d0-7543-ba3d-d3f857850a70	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f
01a11c74-a3c4-75eb-b6e5-09800ed31707	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d
01a11c74-a3ab-7b60-b129-351596f85469	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a37a-7262-95b8-b2c22d9098b8	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a3db-737c-b89d-3b208175af60	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a37b-70d9-a9ad-574d7ea1fc5b	system	2026-10-08 16:59:28.713+00	\N	2026-10-08 16:59:28.713+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3cc-7974-ae53-eeff7794d07b	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a3c1-7153-a2ae-7285103febaa	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a393-7726-975c-a6647f4c3a21	system	2026-10-08 16:59:28.779+00	\N	2026-10-08 16:59:28.779+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a393-75db-975b-f75455af4ee4
01a11c74-a39d-7497-b477-88d3aa81b74e	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a39d-7199-b474-3ce6603d9200
01a11c74-a3c3-7dae-9f17-c247dddf7e92	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	11.00	\N	1650.00	1980.00	330.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a38c-746e-ad18-db726c78a0af	system	2026-10-08 16:59:28.764+00	\N	2026-10-08 16:59:28.764+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a38c-717c-ad15-08b5568dd61e
01a11c74-a3b9-77fb-a92f-49584924ef88	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3ce-7753-87ef-a7e23fd40a3f	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a37d-71be-8dd6-44dcbdf3abdf	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a39e-741c-9d95-bc882ecabfdb	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a3d8-7bd7-a0a2-62a4fefe428e	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3bb-7466-8c09-0a82946f8d74	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a385-7435-bf25-138e819cb6a0	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3eb-71ae-83e3-0d0f94e792bb	system	2026-10-08 16:59:28.925+00	\N	2026-10-08 16:59:28.925+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3eb-7035-83e2-775fb47a89b9
01a11c74-a3da-7841-8295-b6392d7269ae	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3ad-7845-bf0e-15d2c485c963	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3d3-73d2-b943-3606c8141057	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3b1-7c5e-b82e-82c142e1d2b8	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3b0-7c45-ac54-64f8aeba036c	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3e8-74f5-9f2c-6c59a4f51c0a	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a381-7e3d-9056-0fea885f178e	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3a6-7624-9bbe-b42d7dd578aa	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3c0-7168-96f6-b018a20c390c	system	2026-10-08 16:59:28.857+00	\N	2026-10-08 16:59:28.857+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3bf-7ecc-93b7-0af72cf5b308
01a11c74-a3ca-7160-a81b-9a858de67b30	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	2.00	\N	16000.00	19200.00	3200.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3a9-7666-8744-401c00c42d3c	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	10.00	\N	10000.00	12000.00	2000.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3cf-7a97-ab29-7cfb5053d67d	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3d2-7706-9aa1-6b333ce8d716	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a3ac-7f53-ac29-b281bed1d84e	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a3e4-75ba-9813-c4e910746963	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a398-750a-9a1e-074912b7caee	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3d5-772f-abfc-8fca7feeeeaa	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a37f-7781-b2c6-c4a2757c7c34	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a379-7b16-b788-628168eea90d	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a37c-76fd-8c13-261499467a7b	system	2026-10-08 16:59:28.719+00	\N	2026-10-08 16:59:28.719+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a37c-729f-8c0f-be4230df3b0a
01a11c74-a3ed-7774-8a0b-d214fa10136a	system	2026-10-08 16:59:28.93+00	\N	2026-10-08 16:59:28.93+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3ed-73ef-8a08-5c75710ed9e8
01a11c74-a38c-7b33-ad1e-088f816d51fc	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3bb-7297-8c07-36a7a62fc318	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3a9-79ca-8747-911e58acc32c	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3d1-71c6-8ebf-1dfc492e9552	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3c3-7672-9f0f-22a5a074bbf9	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3a8-79e7-9821-4ee8287b28e2	system	2026-10-08 16:59:28.817+00	\N	2026-10-08 16:59:28.817+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a8-78ac-9820-3debe736b3f0
01a11c74-a3de-7e9b-8779-a92de7c0f25a	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a3a8-74d0-981c-ad154d704fef	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a3b7-77a5-946f-f5ad38c2aa40	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	5.00	\N	1500.00	1800.00	300.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a37c-791e-8c15-2c2fec7bded4	system	2026-10-08 16:59:28.72+00	\N	2026-10-08 16:59:28.72+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a37c-729f-8c0f-be4230df3b0a
01a11c74-a3c7-7ac8-9b11-49f66bda9502	system	2026-10-08 16:59:28.869+00	\N	2026-10-08 16:59:28.869+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	4.00	\N	2000.00	2400.00	400.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3d5-755c-abfa-e05f7d3dc2f7	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a3b9-7558-a92c-0c3eb1b66823	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3bd-72f1-80a1-d2915d62f045	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a379-78e9-b786-80e9bf738c02	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a38d-7693-891f-6e4e17cbfeed	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3b3-70dd-b949-15019d1d72f3	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	10.00	\N	10000.00	12000.00	2000.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3c8-7ff3-95de-ce25f530adc4	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a3c0-778d-96fc-a972e76b8ef8	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a3c0-7337-96f8-b39ae28eabf4	system	2026-10-08 16:59:28.857+00	\N	2026-10-08 16:59:28.857+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3bf-7ecc-93b7-0af72cf5b308
01a11c74-a39d-72c4-b475-2bca47536e3e	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a39d-7199-b474-3ce6603d9200
01a11c74-a3ee-7126-9f25-b9f856500483	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	10.00	\N	50000.00	60000.00	10000.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3e6-749b-905b-2cf1bce4a114	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e6-731e-905a-e375b21f14aa
01a11c74-a3cf-7c5a-ab2b-03880259899b	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	2.00	\N	15000.00	18000.00	3000.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a387-7943-8610-9a38128c366b	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3d9-7ce1-a2a8-6a9cb6c063e0	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	3.00	\N	18000.00	21600.00	3600.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3a5-7662-a738-233110b1bfd3	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a5-7533-a737-e6885babfb29
01a11c74-a3af-773b-89f3-4581db4ab417	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3af-7418-89f0-6412357a9731
01a11c74-a3a2-7c9b-86df-095c692ce102	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a3e6-7c83-9063-db7e9297c0d9	system	2026-10-08 16:59:28.919+00	\N	2026-10-08 16:59:28.919+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3a7-7a66-a985-c7300d5c6a84	system	2026-10-08 16:59:28.814+00	\N	2026-10-08 16:59:28.814+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	12.00	\N	180000.00	216000.00	36000.00	01a11c74-a3a7-75a1-a980-4f37200e8acf
01a11c74-a3da-7ca7-829a-daa001eb414f	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3d3-74b0-b944-03a5c79b4834	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a386-7560-a17b-e3fa5fc0405b	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3b5-7fa9-912d-6e249e9d8740	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a3ed-7204-8a06-f118a1ea5bde	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3d1-7a9f-8ec8-2ca3e5d5f3b0	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a3a9-7f33-874d-2c92d408234f	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	11.00	\N	66000.00	79200.00	13200.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a391-77d2-90ec-36952cb6a8c2	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a391-7276-90e7-5e2c36a16736
01a11c74-a3a0-7487-8dd0-d143598b8854	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a37e-7a28-ba24-f48310acfef2	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a3ca-7add-a824-6dd3b6f74787	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a381-78fd-9052-42fa57de81a2	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a3e0-72ac-b80d-c21ddc2fa889	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	11.00	\N	99000.00	118800.00	19800.00	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e
01a11c74-a3b0-77d2-ac4f-f6d66480a427	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3d2-77e3-9aa2-5963dbfb1758	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a39f-72d4-9f49-eb26bfcf1e4f	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a38f-747e-ac76-664f9c072e9c	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a3ea-720c-a40f-f6ce8d2dc4c9	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3e9-7d06-8e27-8e006fbf1e6f
01a11c74-a3aa-78f5-a0ca-3bce355983b9	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3d7-77c2-9093-b840802cf566	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3d7-7585-9091-f2d1ff99711a
01a11c74-a3a3-7824-88f0-3ec58dd1ebda	system	2026-10-08 16:59:28.805+00	\N	2026-10-08 16:59:28.805+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3a3-7337-88eb-7a9bdc26ed7e
01a11c74-a382-73eb-82dc-79272f821125	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	2.00	\N	12000.00	14400.00	2400.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a389-73ae-bcca-02d3f76afb7a	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a38d-7deb-8925-fc6799b4c3e9	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3a7-7f78-a98a-4f966956a8fc	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a39e-7af1-9d9c-9ab0c539bc3e	system	2026-10-08 16:59:28.797+00	\N	2026-10-08 16:59:28.797+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a39e-79d2-9d9b-8f14e0482d72
01a11c74-a3a6-770a-9bbf-1adf86634c03	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3b5-7beb-9129-e3be5ec874a6	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a39f-7ffb-9f57-5c5bbd6c5a40	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3b6-7f7c-ad57-0ea241b55ef5	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a386-747e-a17a-6ed00a7cd691	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a389-7ff7-bcd6-b9a53a9b7bc7	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a3e2-7c41-bbf2-0f8b67000742	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	2.00	\N	1000.00	1200.00	200.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3a6-7287-9bba-deae520d8299	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3bf-79eb-93b2-9e877ca0ec6a	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a397-7c87-b287-eeeda011b044	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3c7-7bb2-9b12-46bf2f88f702	system	2026-10-08 16:59:28.869+00	\N	2026-10-08 16:59:28.869+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3be-7bdb-bc6c-1b8e47134531	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3a4-76a7-aaf7-8ab920753645	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3b3-77e3-b950-1c3b80ef19d8	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a38f-765a-ac78-c0e64a8f2a21	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a3af-7b64-89f7-3576016d5903	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a3a4-7785-aaf8-d5513a73314f	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3b6-7b2b-ad53-945d01078a61	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a390-7e62-a8dc-865c0e05ff98	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a3bd-7d91-80ab-622ec161b302	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3bd-7c41-80aa-3b3b5c770ad0
01a11c74-a3c6-7f22-9167-576dbc20ea04	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a3c6-7872-9160-d2a77a061c40
01a11c74-a3cc-7404-ae4d-6e707d717cfb	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a3c2-756c-b201-c44d4a361ac2	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3b7-76bc-946e-11a2aca7e563	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a3c8-773f-95d5-bdaff07fa3c1	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a3da-73c2-8290-96d7b9479b1d	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3b1-71d2-b823-93b2ed461677	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	3.00	\N	450.00	540.00	90.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3b2-7c5a-8cf1-d3c7eb7ac718	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3e2-787e-bbee-a617be8fb88c	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3d2-7543-9a9f-22e5f02c8e80	system	2026-10-08 16:59:28.886+00	\N	2026-10-08 16:59:28.886+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3d2-7302-9a9d-7866736bbffe
01a11c74-a3dc-7276-9b86-8afd36613b0e	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3d8-794b-a0a0-ae1f9964d925	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	3.00	\N	450.00	540.00	90.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a380-729f-b5b0-e909b2e2ee39	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a3b4-7ea3-8807-0d296b08b18e	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3b4-7ba9-8804-de6c86d78aa4
01a11c74-a3ba-7902-acfd-c18a2cc70a35	system	2026-10-08 16:59:28.848+00	\N	2026-10-08 16:59:28.848+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	6.00	\N	900.00	1080.00	180.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3a0-7649-8dd2-f95666167897	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3de-70b8-876b-2e8602d3fa50	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3b6-74dd-ad4c-f0bc579e7820	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3a1-706a-adb1-a635d4db1f7f	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3a0-7c9f-8dd8-928b9728f447
01a11c74-a3c6-7031-9157-fe2a870ba975	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a38a-7d02-baf9-1c2c1484cd78	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a383-7241-a97d-d92b04e888e2	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	12.00	\N	72000.00	86400.00	14400.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3e0-7985-b814-6650376d99e0	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3c4-7cd4-b6ec-e303f7f34096	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	10.00	\N	50000.00	60000.00	10000.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3d0-7f0e-ba47-e4e626264c49	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3c2-7004-b1fb-3f3bc9a046a4	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3d9-7dba-a2a9-dbd76e74db57	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3de-7374-876e-2ce038cdc58d	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a39c-7ae9-8775-b11d1c60a052	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a38f-7bef-ac7e-f7232ea07c42	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	4.00	\N	600.00	720.00	120.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a39c-739d-876e-a911b8087af8	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	11.00	\N	5500.00	6600.00	1100.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3e0-7c3d-b817-d45608b60ddb	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a392-707a-bac9-850f609bfa45	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3ad-7599-bf0b-c1695c20018b	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3b2-78b8-8ced-cec687d5ca23	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3ed-7a18-8a0e-714f5f2dded5	system	2026-10-08 16:59:28.93+00	\N	2026-10-08 16:59:28.93+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3ed-73ef-8a08-5c75710ed9e8
01a11c74-a3cb-72f5-97be-adb5c39d47ad	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	10.00	\N	5000.00	6000.00	1000.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a3a7-7389-a97e-69efdc42cf15	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a3dc-7e45-9b92-9eaba5712a03	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a385-76dd-bf28-090cc8976223	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3da-767e-8293-6debcdcd380e	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3d5-7b91-ac01-c54812ce8d6c	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a397-77db-b282-f5389933ad10	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3e6-7147-9058-e3f770de3b9f	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a39a-751e-8aac-01d6bbc87572	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a396-7d06-a5f8-344fb69a284d	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3e1-76ed-8277-72449075299b	system	2026-10-08 16:59:28.911+00	\N	2026-10-08 16:59:28.911+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3e1-749b-8275-05c21f033b7e
01a11c74-a3ec-7ab0-b256-0d7a7c96a340	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3da-7bca-8299-ebb3e5cd6c9c	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	10.00	\N	10000.00	12000.00	2000.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a382-72f1-82db-ca684fff4c19	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3ab-7897-b126-df31c3325f74	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a38c-7ebc-ad22-69365b90006d	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	11.00	\N	66000.00	79200.00	13200.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3cf-7feb-ab2f-bfce194d5ce5	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3dc-747e-9b88-1a5a4e3ded68	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3ad-7bce-bf12-c131482220ab	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3c7-7449-9b0a-dd01872833ea	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3d4-7f58-b0d2-2e99c6b82676	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a3e9-7f6c-8e29-703a11ff056e	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3e9-7d06-8e27-8e006fbf1e6f
01a11c74-a390-7235-a8d1-33cd485a2f17	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a3bd-7f58-80ad-9a3bd887281b	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3bd-7c41-80aa-3b3b5c770ad0
01a11c74-a3b3-7b74-b954-bd4d11175c09	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a3ed-7028-8a04-e7b8e9191e8c	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a37b-71d7-a9ae-fe61e8760b74	system	2026-10-08 16:59:28.713+00	\N	2026-10-08 16:59:28.713+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	3.00	\N	45000.00	54000.00	9000.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3cb-7a18-97c5-0fa9f87f1ded	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3c7-7c8f-9b13-8022e417b5d9	system	2026-10-08 16:59:28.869+00	\N	2026-10-08 16:59:28.869+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	2.00	\N	300.00	360.00	60.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a39b-7b70-8973-441df787cc0f	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3d0-781c-ba40-055027d6db7a	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f
01a11c74-a3c3-7933-9f12-1a26d751852f	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3aa-7bae-a0cd-76734e5a53ef	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3a9-7589-8743-39fde28f2c42	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3b0-7d43-ac55-e6481e8fecd8	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3d1-748b-8ec2-33cc0d8ace1f	system	2026-10-08 16:59:28.884+00	\N	2026-10-08 16:59:28.884+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a392-761c-bacf-a8a431f1b0b4	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3d3-7835-b948-54a4fa96b1f4	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3aa-72ed-a0c4-380028bb9ba1	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	6.00	\N	1800.00	2160.00	360.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a39b-70b4-8968-1c30d96ce879	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a3b4-7cd9-8805-f2a692923e94	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3b4-7ba9-8804-de6c86d78aa4
01a11c74-a37d-77ca-8ddc-0da12cd7c03e	system	2026-10-08 16:59:28.722+00	\N	2026-10-08 16:59:28.722+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3c4-7424-b6e3-cc556a7fa628	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	3.00	\N	45000.00	54000.00	9000.00	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d
01a11c74-a387-7a24-8611-d6c092afb036	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3bc-7f1e-85cc-f615fed5bac2	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	11.00	\N	99000.00	118800.00	19800.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3bf-7d85-93b6-e113f401ef1b	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	7.00	\N	1050.00	1260.00	210.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3ec-71ef-b24d-64b4cfb2e9fe	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3eb-7fa5-83f1-8a82f5293e48
01a11c74-a3b8-7818-8186-a2fc9954f09a	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3cd-7c00-8bb8-8931230744e2	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
01a11c74-a381-780c-9051-d677bad7743d	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a396-7035-a5eb-279a601d933d	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a3ce-766e-87ee-08f2311febaf	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3bb-77e7-8c0d-644460ee9bac	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3c1-7747-a2b4-1b3b6e76c3d9	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3c7-752f-9b0b-446832ec40eb	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3cc-7a51-ae54-871d45a42581	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a3ba-7bdf-acff-30aad0fd6ddb	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3ba-7a35-acfe-fd41f4170e53
01a11c74-a3cd-7439-8bb0-6feb1d177c64	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a3bf-7ca3-93b5-0efabf837b3d	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3b3-71c6-b94a-a0d081190598	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3e8-7283-9f2a-0d8d17bd7b65	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a388-7999-b525-d31990a24883	system	2026-10-08 16:59:28.755+00	\N	2026-10-08 16:59:28.755+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a388-7845-b524-b38cfc6cdc67
01a11c74-a399-78f1-8bb6-3b317ca0d88b	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	12.00	\N	12000.00	14400.00	2400.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3c0-7dbe-9703-9544fbe7ff05	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a3af-7a7e-89f6-5fd177ee52fe	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a3aa-7e62-a0d0-5aa48efdd7f0	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	8.00	\N	4000.00	4800.00	800.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3c6-766a-915e-f77660ee0786	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3a1-7bfb-adbd-b605be5f217f	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a39c-7000-876a-b52728e887e7	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	2.00	\N	16000.00	19200.00	3200.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3e5-7760-84cf-99e973500d28	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3c4-7a24-b6e9-11949d27f491	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a390-7516-a8d4-af3f5522ab02	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a3a8-7220-9819-f16e0eb12977	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a38c-7389-ad17-c6e46e448e35	system	2026-10-08 16:59:28.764+00	\N	2026-10-08 16:59:28.764+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a38c-717c-ad15-08b5568dd61e
01a11c74-a3cf-7e28-ab2d-7d49228d17a8	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3ce-72c4-87ea-ff8c1894b3ae	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3a5-7153-a733-da77ec37aa8a	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3a4-7e3d-aaff-54abedce29dc
01a11c74-a3d3-7d9d-b94d-70ed2649005c	system	2026-10-08 16:59:28.889+00	\N	2026-10-08 16:59:28.889+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3d3-7c28-b94c-2c1e7f1b7be8
01a11c74-a3bb-754b-8c0a-9372a39d70ce	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3ec-7d6c-b259-e75c8b64163a	system	2026-10-08 16:59:28.929+00	\N	2026-10-08 16:59:28.929+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a39d-7f02-b482-3294c718bd99	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	3.00	\N	3000.00	3600.00	600.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3d2-7de3-9aa8-b8d236567987	system	2026-10-08 16:59:28.887+00	\N	2026-10-08 16:59:28.887+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	2.00	\N	8000.00	9600.00	1600.00	01a11c74-a3d2-7b9d-9aa6-5009e7e69627
01a11c74-a3ec-72d9-b24e-fc3dcc0c06a0	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3eb-7fa5-83f1-8a82f5293e48
01a11c74-a39e-7bdf-9d9d-b4a3e3ab2271	system	2026-10-08 16:59:28.797+00	\N	2026-10-08 16:59:28.797+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a39e-79d2-9d9b-8f14e0482d72
01a11c74-a3a7-7cc8-a987-0bfc61ae7cb4	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a3b3-79b6-b952-a1aed62055f3	system	2026-10-08 16:59:28.837+00	\N	2026-10-08 16:59:28.837+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3b3-74d0-b94d-831f60f89aa4
01a11c74-a383-7ee9-a986-d68773b1bfe8	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a3e7-7493-8796-07f5f4fd1357	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a39f-7922-9f50-43f1af6daca2	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a379-7e45-b78b-e1010b6f3607	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a3ca-732f-a81d-0749ac3c495c	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3ae-7820-9909-5a7881e742c8	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3b5-7768-9124-b8ee2532d98a	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a395-7b99-9b22-c3c8cad7231e	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a39d-7a8b-b47d-a04b4a88c0f8	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3bf-73b2-93ab-1b7687b9ca28	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	2.00	\N	8000.00	9600.00	1600.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3a0-72b4-8dce-a0dd739ac016	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a396-7fbe-a5fb-da19fa9f3d92	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3d7-7b53-9097-372e4d60409b	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d7-7585-9091-f2d1ff99711a
01a11c74-a385-7516-bf26-60f181c1d0fe	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3e7-7106-8792-a3f46de036ec	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3ab-7978-b127-ea198b756f4f	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a3dd-77ef-87ec-7c8d3ba353f4	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a3bf-72c4-93aa-40668c3dc664	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a3c6-7b95-9163-0e7729d5d0ed	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3c6-7872-9160-d2a77a061c40
01a11c74-a3a9-7d68-874b-19ab223124f9	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a39c-7f70-877a-a63d865f74ed	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	3.00	\N	7500.00	9000.00	1500.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a3af-7e3d-89fa-40749818e113	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a3d8-7764-a09e-50fe7b6fd9b4	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3c1-7076-a2ad-46794db75f24	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	10.00	\N	5000.00	6000.00	1000.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a3b9-70f1-a928-b0d6ef6ec896	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a39c-7585-8770-3ac1d1642057	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	3.00	\N	450.00	540.00	90.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a394-7a7a-8da4-94f3ed3baf49	system	2026-10-08 16:59:28.782+00	\N	2026-10-08 16:59:28.782+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a394-792f-8da3-6724ad9fec7e
01a11c74-a3e1-79a5-827a-26481edb3f5c	system	2026-10-08 16:59:28.911+00	\N	2026-10-08 16:59:28.911+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e1-749b-8275-05c21f033b7e
01a11c74-a3b8-72e1-8181-a6846f4d3435	system	2026-10-08 16:59:28.844+00	\N	2026-10-08 16:59:28.844+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3b7-7ecc-9476-1ff5cd305751
01a11c74-a3c1-7585-a2b2-7ea16d00ca2c	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3c1-7235-a2af-1b8f5a0174b7	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	6.00	\N	900.00	1080.00	180.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a39a-77c6-8aaf-d8fa029bebde	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a39a-76dd-8aae-d7f027d0c17e	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a380-747e-b5b2-b39daa6d2884	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a38b-793b-9720-dabe7c5dd256	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a399-7abc-8bb8-9e41e478f00b	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a383-7076-a97b-d1cc41d706f8	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3da-775c-8294-6fba9d20b947	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3be-7e7a-bc6f-707128d4232c	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3df-7322-ab3f-d66ed82ac43d	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a3b1-7428-b825-f4df954df4e8	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3d8-7da1-a0a4-8df1c1506a1f	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3d3-7916-b949-ae312bf1048a	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3da-7ae9-8298-aa353c85d4e8	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3e7-7b70-879d-8a013d86c110	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3c9-7be3-9f84-fc7c66b02acb	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3d6-73df-a82e-caf9295e39a5	system	2026-10-08 16:59:28.893+00	\N	2026-10-08 16:59:28.893+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a3d6-728b-a82d-6c10a052a694
01a11c74-a3e3-727a-a920-84abcc8ddfe2	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a382-701c-82d8-c68cd11c593c	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3e7-73b6-8795-b7cab846eb37	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3b0-7287-ac4a-b0f877a81a81	system	2026-10-08 16:59:28.832+00	\N	2026-10-08 16:59:28.832+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3b0-7122-ac49-4b7b12f30887
01a11c74-a3c5-7185-b9b2-10d9f66598fc	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a39c-7bd7-8776-ce4fa94bbfe5	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a38f-70c8-ac72-3bb5cec61aee	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a38c-7cf9-ad20-89869d2caac3	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3c4-7bef-b6eb-ff6a2ccf726f	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3e9-740c-8e1d-375c83905284	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3db-7466-b89e-2ac43010cbaf	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a3ac-7953-ac23-a281c8df3d0e	system	2026-10-08 16:59:28.826+00	\N	2026-10-08 16:59:28.826+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3ac-7649-ac20-171ef61413cc
01a11c74-a3e1-7fbe-8280-d01606624c06	system	2026-10-08 16:59:28.912+00	\N	2026-10-08 16:59:28.912+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3e1-7b89-827c-cf954a944950
01a11c74-a381-79eb-9053-ce38ab78ea0c	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a382-75ba-82de-741f6b4ca4d4	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3a6-79e3-9bc2-2e3ba712681f	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	2.00	\N	2000.00	2400.00	400.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a38b-7afd-9722-950c6f66a09e	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a388-752f-b522-0eec8196bba9	system	2026-10-08 16:59:28.753+00	\N	2026-10-08 16:59:28.753+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a388-740c-b521-5cd2a55fda80
01a11c74-a3cb-7cdd-97c8-9a5550be9bdd	system	2026-10-08 16:59:28.876+00	\N	2026-10-08 16:59:28.876+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	3.00	\N	18000.00	21600.00	3600.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3a6-7fe7-9bc8-7636683dcaba	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a3dd-7edd-87f3-0bc0b585a66c	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3bb-770a-8c0c-466f9a397fac	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	10.00	\N	50000.00	60000.00	10000.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3c3-7045-9f09-9fbe839623bd	system	2026-10-08 16:59:28.861+00	\N	2026-10-08 16:59:28.861+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3c2-7c41-b208-96ebf475406d
01a11c74-a3aa-7ac4-a0cc-f0cca6824888	system	2026-10-08 16:59:28.822+00	\N	2026-10-08 16:59:28.822+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3aa-742d-a0c5-b786d0f28c06
01a11c74-a3ca-7bc6-a825-d1c36bf83c81	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a38e-78fd-9029-b7ba7b27a453	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a38e-7560-9027-f597d13890d5
01a11c74-a3b6-7e9f-ad56-58871a0bfa2c	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a3b5-7ebc-912c-b4855f6ef0bd	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a3c0-786a-96fd-598ff0071d1c	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a383-74f1-a980-91afbaeaa09e	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3a2-7bb2-86de-55ec654c1824	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a3cf-7293-ab21-2f7aef20750e	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a39f-7c6e-9f53-6bb4ae5bb924	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3e1-7391-8274-714ab64a4d5a	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3e3-7989-a928-84dbc36f06b5	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3bc-77fb-85c5-840ad67d14e0	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a390-7608-a8d5-db4db3cd061e	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a3e2-75be-bbeb-25262f6e0445	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3ec-7112-b24c-cda40a1a16b6	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3eb-7fa5-83f1-8a82f5293e48
01a11c74-a38b-7bdf-9723-42e1051eb403	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a3ba-781c-acfc-e4580da7dc37	system	2026-10-08 16:59:28.848+00	\N	2026-10-08 16:59:28.848+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	4.00	\N	1200.00	1440.00	240.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a39c-791a-8773-4579cca60f56	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a3d3-7b0a-b94b-1c4c65d6cbb9	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	9.00	\N	2700.00	3240.00	540.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3ca-75d2-a820-7b64a04b51df	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3a2-7137-86d3-db362fbb0b5d	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3ae-7568-9906-99a75cb52cd3	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a38e-778d-9028-61d89312f897	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a38e-7560-9027-f597d13890d5
01a11c74-a3c3-7afd-9f14-d4e5f21c24ad	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3c2-7d95-b209-d033ab6e4097	system	2026-10-08 16:59:28.861+00	\N	2026-10-08 16:59:28.861+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a3c2-7c41-b208-96ebf475406d
01a11c74-a39d-77df-b47a-05daf418b874	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3e4-70ac-980e-b47865eb08a7	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6
01a11c74-a3e7-7fe7-87a2-5b9a714ee0a8	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3df-7d91-ab4a-475663e2565e	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a38a-7fa1-bafc-78e9dc7dfdf0	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a3ba-7476-acf8-7d8eccbd0387	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3c1-790e-a2b6-7c877f52f52b	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3b8-7645-8184-926cef51024a	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3e8-71a1-9f29-724824b09efd	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3d9-730e-a29e-9e3891ee6bdf	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a395-7f4b-9b26-b9cdb027a50c	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a379-7d37-b78a-dbb92e8209ef	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a385-7ecc-bf2f-e8f504f7998a	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3af-7d53-89f9-60e6b3f74c43	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a3bc-78dd-85c6-94d3998c163f	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	11.00	\N	5500.00	6600.00	1100.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3c6-7aa7-9162-1cf66438cd33	system	2026-10-08 16:59:28.867+00	\N	2026-10-08 16:59:28.867+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c6-7872-9160-d2a77a061c40
01a11c74-a381-7f2b-9057-3ea1483aa869	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3cc-708b-ae4a-6a1c1ff804d4	system	2026-10-08 16:59:28.876+00	\N	2026-10-08 16:59:28.876+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a37c-7a14-8c16-468db54abdcf	system	2026-10-08 16:59:28.72+00	\N	2026-10-08 16:59:28.72+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	2.00	\N	16000.00	19200.00	3200.00	01a11c74-a37c-729f-8c0f-be4230df3b0a
01a11c74-a37b-74fd-a9b1-65cdfd79ef94	system	2026-10-08 16:59:28.713+00	\N	2026-10-08 16:59:28.713+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3e8-70c4-9f28-aecbfe14a246	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3a7-72a3-a97d-5dffcd3edc76	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a3e9-7245-8e1b-73f00fb12331	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3e0-70e1-b80b-128044bbaa5e	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e
01a11c74-a393-73ca-975a-467782bf0bd2	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a392-770a-bad0-bf5d5b738411	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3e0-7ef1-b81a-7ab45a198cce	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	3.00	\N	18000.00	21600.00	3600.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a3b9-7389-a92a-d60078b71f6d	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a38c-7ddb-ad21-cc79b3ed16df	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3eb-7eb4-83f0-72ee8de3bdfc	system	2026-10-08 16:59:28.927+00	\N	2026-10-08 16:59:28.927+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3eb-7b81-83ed-8ec21249eaf9
01a11c74-a3ad-7e83-bf15-65d65cc497d4	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	4.00	\N	1200.00	1440.00	240.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a384-7d12-8d1c-40dc26c2aa76	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a384-77d2-8d17-e5d37a5448b3
01a11c74-a37e-7b22-ba25-3949a3427a55	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a3e3-7d1e-a92b-ea72735112c2	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6
01a11c74-a3a9-73ba-8741-56739d4eb888	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3d9-7ea3-a2aa-a68fdcf975d5	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	3.00	\N	3000.00	3600.00	600.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3a5-774b-a739-6caaf088ee4e	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a5-7533-a737-e6885babfb29
01a11c74-a3b5-7851-9125-e68039614b73	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a3ab-76c8-b124-2422397d3a81	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a3a5-7239-a734-e80f54cb94e4	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3a4-7e3d-aaff-54abedce29dc
01a11c74-a3aa-7018-a0c1-7339f9fcaf2d	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3a3-7dc6-88f5-7abf95e1e616	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a3-7c9f-88f4-ea5945b1ad19
01a11c74-a3e1-760c-8276-7f8eb73c999a	system	2026-10-08 16:59:28.911+00	\N	2026-10-08 16:59:28.911+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a3e1-749b-8275-05c21f033b7e
01a11c74-a39e-77b2-9d99-6d65df7d37c7	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a3ec-78c0-b254-f1199c06badc	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a37a-704d-95b6-b713647cb44d	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a3ab-77b2-b125-e2c36ad5ae15	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a387-769b-860d-3d50ca489622	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a39d-7c51-b47f-741414ffd2df	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3e2-74d9-bbea-6e343e1d50ce	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3c0-7ea3-9704-4afa36802004	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a38b-785a-971f-c440c7bd39c5	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a3c6-74a7-915c-4e39a5c6ae0e	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	10.00	\N	10000.00	12000.00	2000.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a387-777c-860e-7b2a01fef0b5	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3df-7153-ab3d-8db5b0776d2d	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a397-79c6-b284-9da514e38d81	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3e4-74cc-9812-34aac4447778	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a37b-7608-a9b2-e77b138120ba	system	2026-10-08 16:59:28.713+00	\N	2026-10-08 16:59:28.713+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3d7-7f7c-909b-8119ef3c70b9	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a384-78f9-8d18-3b1df75115f5	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a384-77d2-8d17-e5d37a5448b3
01a11c74-a392-7d68-bad5-c9362859d254	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a3ec-77db-b253-4773be917752	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	2.00	\N	24000.00	28800.00	4800.00	01a11c74-a3ec-7676-b252-d450c14e7fdb
01a11c74-a3ab-70c8-b11e-6ff6ca70614e	system	2026-10-08 16:59:28.823+00	\N	2026-10-08 16:59:28.823+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3aa-7f9d-a0d1-990e56e7fe1d
01a11c74-a3d9-7b12-a2a6-8042ca7a86a0	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a38c-7f9d-ad23-036d9af1c0f1	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	7.00	\N	17500.00	21000.00	3500.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3ca-79fb-a823-4fce4d0fdbd6	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a3a3-7f95-88f7-0ef0f831f67f	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3a3-7c9f-88f4-ea5945b1ad19
01a11c74-a389-773f-bcce-889de6a4729e	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3b5-7b06-9128-ecac4465e866	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a3b5-7160-911e-7343f64b453b	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3b4-7ba9-8804-de6c86d78aa4
01a11c74-a3a9-7e56-874c-2896826acfd1	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a3a4-73df-aaf4-e656a48e8ab8	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3ac-7522-ac1f-dfe56f917a11	system	2026-10-08 16:59:28.825+00	\N	2026-10-08 16:59:28.825+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4
01a11c74-a3d2-7cf5-9aa7-b4d0373d1e6a	system	2026-10-08 16:59:28.887+00	\N	2026-10-08 16:59:28.887+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3d2-7b9d-9aa6-5009e7e69627
01a11c74-a3d4-7bb2-b0ce-70766076b003	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a3ab-7e18-b12c-44ea65c94c09	system	2026-10-08 16:59:28.824+00	\N	2026-10-08 16:59:28.824+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	11.00	\N	11000.00	13200.00	2200.00	01a11c74-a3ab-74ac-b122-80ef179c0577
01a11c74-a3a9-7b9d-8749-cfbcf54642b2	system	2026-10-08 16:59:28.821+00	\N	2026-10-08 16:59:28.821+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a3a9-77ae-8745-d7437b2873b0
01a11c74-a396-720c-a5ed-ab09eb4292b7	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a393-7fd7-9764-20796107a48f	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a38e-7afd-902b-3bc67c5847af	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a38e-7560-9027-f597d13890d5
01a11c74-a39a-7600-8aad-02691df4a3b1	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3cf-7451-ab23-2872d421f617	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3d5-78e9-abfe-ec556b11a0d6	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a382-786e-82e1-1cc842b763f2	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a385-75f7-bf27-c6ee9a615c19	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3cf-7d37-ab2c-bd8c2261b435	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3d8-7f74-a0a6-f4f8fb799306	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3c5-7f4f-b9c0-e990d7297b8a	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3cc-788b-ae52-217cbc4613c6	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a394-7368-8d9e-7932ffd84992	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a382-7f95-82e7-7900a45f1ffc	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3d4-7d89-b0d0-67ab22c38696	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a3e3-719d-a91f-1c4f3eff1a09	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a38b-7cbc-9724-c797a5991c3f	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a3e9-7799-8e21-4481a917f6e5	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3a5-7c87-a73e-70e92e5ede9b	system	2026-10-08 16:59:28.81+00	\N	2026-10-08 16:59:28.81+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a5-7b4f-a73d-b49ad274a3ef
01a11c74-a3c2-773f-b203-efbfe7de7397	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3cf-7702-ab26-72f3031bdfd1	system	2026-10-08 16:59:28.881+00	\N	2026-10-08 16:59:28.881+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	3.00	\N	900.00	1080.00	180.00	01a11c74-a3ce-7bf7-87f4-5635f8e0d1dc
01a11c74-a3c9-7e9f-9f87-0093b63d7fac	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a39f-7f12-9f56-a26dbbbe4e34	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3da-7922-8296-57eff7a3b6c8	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3da-7ff7-829d-44483c122022	system	2026-10-08 16:59:28.901+00	\N	2026-10-08 16:59:28.901+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3da-7e8f-829c-55f472e8857b
01a11c74-a38b-7f5c-9727-0e152868fb6f	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a395-79f3-9b21-509e3a8a4235	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a3c2-747a-b200-2bf973a4028a	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3e5-7926-84d1-7a2df84716d0	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3c6-7747-915f-6862865cac9d	system	2026-10-08 16:59:28.866+00	\N	2026-10-08 16:59:28.866+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	8.00	\N	1200.00	1440.00	240.00	01a11c74-a3c5-7b64-b9bc-26e4fbe61dea
01a11c74-a3af-7f1a-89fb-a78c9fdf3f27	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a3af-785e-89f4-2ec6bd48f977
01a11c74-a398-7c6e-9a26-26080f6d06b8	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	2.00	\N	1000.00	1200.00	200.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3cd-794f-8bb5-aa8f08206ea1	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
01a11c74-a398-7b8d-9a25-8a4a85c00e9a	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a394-7631-8da1-558791617ddf	system	2026-10-08 16:59:28.781+00	\N	2026-10-08 16:59:28.781+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	10.00	\N	3000.00	3600.00	600.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3ed-75a5-8a09-1d2d98a696f0	system	2026-10-08 16:59:28.93+00	\N	2026-10-08 16:59:28.93+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ed-73ef-8a08-5c75710ed9e8
01a11c74-a3e3-7441-a922-cb171c8aea33	system	2026-10-08 16:59:28.914+00	\N	2026-10-08 16:59:28.914+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a3e2-7e39-bbf4-d684d8e41f13
01a11c74-a3e7-7c56-879e-b00d8acc269b	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3e9-7960-8e23-570a98bc0f2a	system	2026-10-08 16:59:28.923+00	\N	2026-10-08 16:59:28.923+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3cd-7a2d-8bb6-21a2b5fb53e7	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
01a11c74-a3a0-7dc6-8dd9-7f22f8106451	system	2026-10-08 16:59:28.8+00	\N	2026-10-08 16:59:28.8+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3a0-7c9f-8dd8-928b9728f447
01a11c74-a3dd-79b6-87ee-223d340265bb	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a3a4-74d4-aaf5-b285f7a4a707	system	2026-10-08 16:59:28.807+00	\N	2026-10-08 16:59:28.807+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3b8-7c7e-818b-977d8fda4ec5	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a399-79d7-8bb7-c9529833be46	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3d0-7e28-ba46-a67448d50474	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3be-7937-bc69-336c6a206c8e	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3dd-7614-87ea-e364cd210680	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a391-79a5-90ee-9b73ae64d277	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a391-7276-90e7-5e2c36a16736
01a11c74-a38f-7391-ac75-21551a2fd7bc	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a3a4-7ce9-aafe-9453060213af	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	9.00	\N	1350.00	1620.00	270.00	01a11c74-a3a4-70e5-aaf1-a679b8ab1953
01a11c74-a3df-7e7a-ab4b-76553fa8c30d	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a39b-7a83-8972-77e01449413d	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3b8-71f7-8180-94eca876d032	system	2026-10-08 16:59:28.844+00	\N	2026-10-08 16:59:28.844+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3b7-7ecc-9476-1ff5cd305751
01a11c74-a396-7ed9-a5fa-0f42ce4132c3	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3df-74f5-ab41-e51812f42cad	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	10.00	\N	10000.00	12000.00	2000.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a384-7e24-8d1d-5265aacf3cfb	system	2026-10-08 16:59:28.741+00	\N	2026-10-08 16:59:28.741+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a384-77d2-8d17-e5d37a5448b3
01a11c74-a3c4-7168-b6e0-83eb2c8fd68a	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d
01a11c74-a3a0-7eb4-8dda-7b6de6b63e07	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3a0-7c9f-8dd8-928b9728f447
01a11c74-a3b4-742d-87fc-7e88b360ce50	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a39c-7e87-8779-fe223ca38091	system	2026-10-08 16:59:28.794+00	\N	2026-10-08 16:59:28.794+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a39c-76c4-8771-53f094abdd17
01a11c74-a3ea-7c97-a41a-456df10dda4e	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a3d9-783d-a2a3-de027ed7f410	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	11.00	\N	99000.00	118800.00	19800.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3ea-7f3b-a41d-f496898ce1c8	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	10.00	\N	1500.00	1800.00	300.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a39e-7cbc-9d9e-b812de4b39dd	system	2026-10-08 16:59:28.797+00	\N	2026-10-08 16:59:28.797+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a39e-79d2-9d9b-8f14e0482d72
01a11c74-a3a3-7a83-88f2-4fe9ba067241	system	2026-10-08 16:59:28.806+00	\N	2026-10-08 16:59:28.806+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	2.00	\N	24000.00	28800.00	4800.00	01a11c74-a3a3-7958-88f1-a09723ea994e
01a11c74-a3b7-714b-9468-dbb668163d7a	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a399-771a-8bb4-613d72fd36a2	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a38a-7466-baf1-476fe1f30279	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a38a-7389-baf0-b6ff06bdb87a	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a3d7-798d-9095-9f8f66b5dd2e	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3d7-7585-9091-f2d1ff99711a
01a11c74-a3d5-711e-abf6-7b289412f6be	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	11.00	\N	11000.00	13200.00	2200.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a396-7672-a5f1-f0f9d5f9e47f	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a37e-7712-ba21-c6418d47a4c4	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a3a6-7456-9bbc-1b779938691e	system	2026-10-08 16:59:28.811+00	\N	2026-10-08 16:59:28.811+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3a6-706e-9bb8-e4e33b8a51e6
01a11c74-a3c1-7ca3-a2ba-edd6d2216501	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a38b-732b-971b-cd22d6bf505e	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a388-7a7e-b526-bddc5c55315a	system	2026-10-08 16:59:28.755+00	\N	2026-10-08 16:59:28.755+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a388-7845-b524-b38cfc6cdc67
01a11c74-a3c5-779d-b9b8-7eea58754d7c	system	2026-10-08 16:59:28.865+00	\N	2026-10-08 16:59:28.865+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3c5-7476-b9b5-c3d17ae5ef43
01a11c74-a394-7716-8da2-38542e1a2c70	system	2026-10-08 16:59:28.781+00	\N	2026-10-08 16:59:28.781+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	6.00	\N	900.00	1080.00	180.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3cc-7c18-ae56-fc88526bc729	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	5.00	\N	2500.00	3000.00	500.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a386-7399-a179-57d88e86e03e	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a39b-7d43-8975-a83d819e58e1	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3ac-7d85-ac27-fc9bc4c5e00e	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	12.00	\N	108000.00	129600.00	21600.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a38a-72a7-baef-9def34d02c40	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a39b-7f1a-8977-eb793871af74	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	4.00	\N	20000.00	24000.00	4000.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3c2-7651-b202-fcd3b631056a	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	6.00	\N	36000.00	43200.00	7200.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a39a-7a7a-8ab2-7e758eb918fa	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3cb-7926-97c4-c6627d2c0612	system	2026-10-08 16:59:28.875+00	\N	2026-10-08 16:59:28.875+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3cb-74f5-97c0-59faa9c3aa22
01a11c74-a3ba-72a3-acf6-5d445bfafb90	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a399-7462-8bb1-801ad8169fd4	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a398-7418-9a1d-7b0a4a77b612	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3c8-7578-95d3-b7934868480c	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a3e5-7e8b-84d7-729652102692	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a39a-7991-8ab1-47cc11a178e0	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a39b-728b-896a-4decb49b0504	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a398-709b-9a1a-f8b78a3b496e	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	10.00	\N	10000.00	12000.00	2000.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3ed-785e-8a0c-a1cd019406e1	system	2026-10-08 16:59:28.93+00	\N	2026-10-08 16:59:28.93+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3ed-73ef-8a08-5c75710ed9e8
01a11c74-a3cf-7b74-ab2a-8fe73d80391e	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3a5-7400-a736-da4e455a2825	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3a4-7e3d-aaff-54abedce29dc
01a11c74-a3bb-7fb2-8c15-e9b2fec8defd	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a391-78c0-90ed-6b597d2d5f6f	system	2026-10-08 16:59:28.775+00	\N	2026-10-08 16:59:28.775+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a391-7276-90e7-5e2c36a16736
01a11c74-a388-7624-b523-2242d681b82c	system	2026-10-08 16:59:28.753+00	\N	2026-10-08 16:59:28.753+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a388-740c-b521-5cd2a55fda80
01a11c74-a381-7631-904f-126a8c4db527	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a3a2-7214-86d4-930cb3e227d4	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a385-7fb2-bf30-00fd0aeb7a92	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3a1-714b-adb2-6a7037859f92	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3a0-7c9f-8dd8-928b9728f447
01a11c74-a3a2-7f47-86e2-d6713d971902	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a3b4-7266-87fa-9a90d16c79a1	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a38a-71c2-baee-ee6fb7165541	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a386-7641-a17c-d46859380ebc	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	11.00	\N	27500.00	33000.00	5500.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3dc-7b8d-9b8f-2e8c0e5fb615	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a3ce-791a-87f1-583558c73f8f	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	9.00	\N	9000.00	10800.00	1800.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3ba-7dd7-ad01-631b1754eb6b	system	2026-10-08 16:59:28.849+00	\N	2026-10-08 16:59:28.849+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3ba-7a35-acfe-fd41f4170e53
01a11c74-a37e-7c51-ba26-039dd7038280	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a38f-71c2-ac73-660ee37838a6	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a390-7326-a8d2-3f20fd77ea97	system	2026-10-08 16:59:28.773+00	\N	2026-10-08 16:59:28.773+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a38f-7e24-ac7f-35367577a45d
01a11c74-a3c0-7f8d-9705-1f1883aa65b1	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a3df-7ae9-ab47-9d4d7f34a6a4	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3df-75f3-ab42-7024d6df69e4
01a11c74-a3d8-713b-a097-5dca7892e38d	system	2026-10-08 16:59:28.897+00	\N	2026-10-08 16:59:28.897+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	7.00	\N	52500.00	63000.00	10500.00	01a11c74-a3d7-7d3f-9099-24ca55fceb99
01a11c74-a3c1-7bbe-a2b9-1047a23d1159	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	3.00	\N	7500.00	9000.00	1500.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3b8-73ca-8182-a7a7838ac9c8	system	2026-10-08 16:59:28.844+00	\N	2026-10-08 16:59:28.844+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	9.00	\N	135000.00	162000.00	27000.00	01a11c74-a3b7-7ecc-9476-1ff5cd305751
01a11c74-a3e5-7849-84d0-54b436974f26	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a390-7c76-a8da-5c5c1b0f1490	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a3cd-7e9b-8bbb-50fdd649391a	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
01a11c74-a38d-7c18-8923-cb0a29f2113b	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3e8-76c4-9f2e-c3e86154bfee	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3d1-7e2d-8ecc-a3ae98054c38	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a385-79a1-bf2b-7c3424c53279	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3be-7245-bc62-668039b9a916	system	2026-10-08 16:59:28.854+00	\N	2026-10-08 16:59:28.854+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3bd-7c41-80aa-3b3b5c770ad0
01a11c74-a3ea-7810-a415-e91889352581	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a3ce-71e3-87e9-2715537881bf	system	2026-10-08 16:59:28.88+00	\N	2026-10-08 16:59:28.88+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3cd-7fae-8bbc-d2d4580d68f8
01a11c74-a3ae-739d-9904-0cbc0078f3b1	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	11.00	\N	99000.00	118800.00	19800.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3ec-749f-b250-5aa475fc2fdb	system	2026-10-08 16:59:28.928+00	\N	2026-10-08 16:59:28.928+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a3eb-7fa5-83f1-8a82f5293e48
01a11c74-a3ad-7f68-bf16-f07390f21d46	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	5.00	\N	750.00	900.00	150.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3d2-710a-9a9b-6a3b1a8002f1	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	11.00	\N	66000.00	79200.00	13200.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a3b4-7dc6-8806-6a61ce696992	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3b4-7ba9-8804-de6c86d78aa4
01a11c74-a3a7-77ba-a982-624c57da545d	system	2026-10-08 16:59:28.814+00	\N	2026-10-08 16:59:28.814+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3a7-75a1-a980-4f37200e8acf
01a11c74-a37d-7097-8dd5-5ed2209b68ce	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3c7-79ce-9b10-64fa437e2e9f	system	2026-10-08 16:59:28.869+00	\N	2026-10-08 16:59:28.869+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a390-7d64-a8db-d3ae9602c390	system	2026-10-08 16:59:28.774+00	\N	2026-10-08 16:59:28.774+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a390-782d-a8d6-aa6e731763d0
01a11c74-a388-7c49-b528-fbe43aa6e67a	system	2026-10-08 16:59:28.755+00	\N	2026-10-08 16:59:28.755+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a388-7845-b524-b38cfc6cdc67
01a11c74-a3e0-7395-b80e-f6728ee68e08	system	2026-10-08 16:59:28.909+00	\N	2026-10-08 16:59:28.909+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3df-7f74-ab4c-91fe7dcdae0e
01a11c74-a398-7aa3-9a24-656488ec42d5	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3ae-7e66-990f-0cd08a886d52	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3ae-7bef-990d-5edd5f6f8f71
01a11c74-a3ab-71b6-b11f-a6b0078bee43	system	2026-10-08 16:59:28.823+00	\N	2026-10-08 16:59:28.823+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	2.00	\N	8000.00	9600.00	1600.00	01a11c74-a3aa-7f9d-a0d1-990e56e7fe1d
01a11c74-a3ab-729b-b120-a595440b5f50	system	2026-10-08 16:59:28.823+00	\N	2026-10-08 16:59:28.823+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3aa-7f9d-a0d1-990e56e7fe1d
01a11c74-a386-78ed-a17f-c051ca2b69dc	system	2026-10-08 16:59:28.745+00	\N	2026-10-08 16:59:28.745+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	7.00	\N	2100.00	2520.00	420.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a3df-723d-ab3e-4a71e1b9e8ad	system	2026-10-08 16:59:28.908+00	\N	2026-10-08 16:59:28.908+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a3a5-7316-a735-121271e3e2fd	system	2026-10-08 16:59:28.809+00	\N	2026-10-08 16:59:28.809+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3a4-7e3d-aaff-54abedce29dc
01a11c74-a38d-7781-8920-cb3e3ba048b1	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3d1-73a1-8ec1-c76381da8893	system	2026-10-08 16:59:28.884+00	\N	2026-10-08 16:59:28.884+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3ad-7204-bf08-e6919a1a9a7b	system	2026-10-08 16:59:28.827+00	\N	2026-10-08 16:59:28.827+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	2.00	\N	12000.00	14400.00	2400.00	01a11c74-a3ac-7a7e-ac24-02774fd58923
01a11c74-a393-78f1-975e-271fc86aa315	system	2026-10-08 16:59:28.779+00	\N	2026-10-08 16:59:28.779+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a393-75db-975b-f75455af4ee4
01a11c74-a3e5-7da5-84d6-b766907bbe57	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3bc-7553-85c2-80c4ed79bc1f	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3ba-71b6-acf5-98ecdb9b8087	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a380-756c-b5b3-2415f75ec557	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a3a3-7b70-88f3-dacfc755c3a4	system	2026-10-08 16:59:28.806+00	\N	2026-10-08 16:59:28.806+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	3.00	\N	12000.00	14400.00	2400.00	01a11c74-a3a3-7958-88f1-a09723ea994e
01a11c74-a395-7e62-9b25-07676862c33e	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a3b9-79ba-a931-eff411e8f142	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	8.00	\N	48000.00	57600.00	9600.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a396-73e3-a5ef-e730aa3ef476	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	3.00	\N	1500.00	1800.00	300.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a3e4-7cfd-981b-acd4a0d55a1b	system	2026-10-08 16:59:28.916+00	\N	2026-10-08 16:59:28.916+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	2.00	\N	2000.00	2400.00	400.00	01a11c74-a3e4-7360-9811-ed1d427758fc
01a11c74-a3a8-7e2d-9825-4f579d74365c	system	2026-10-08 16:59:28.819+00	\N	2026-10-08 16:59:28.819+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3a8-7cf9-9824-f0eceb12f935
01a11c74-a3a5-7e56-a740-7306d7422e70	system	2026-10-08 16:59:28.81+00	\N	2026-10-08 16:59:28.81+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3a5-7b4f-a73d-b49ad274a3ef
01a11c74-a387-722d-8608-29eef4397acb	system	2026-10-08 16:59:28.748+00	\N	2026-10-08 16:59:28.748+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a387-710e-8607-ea156f0bc9f7
01a11c74-a3c1-7ad4-a2b8-32e99692a9f4	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	7.00	\N	42000.00	50400.00	8400.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a39e-724d-9d93-5dbafb739830	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a39d-7e18-b481-b7f65538244e	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a39d-75db-b478-0d78ed8e1ab0
01a11c74-a3b7-731e-946a-7bfec4e3c026	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a3ac-724d-ac1c-7f7d7d121b73	system	2026-10-08 16:59:28.825+00	\N	2026-10-08 16:59:28.825+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3ab-7f4f-b12d-ef9adb5ecfd4
01a11c74-a3d6-7189-a82c-46725334cd2a	system	2026-10-08 16:59:28.892+00	\N	2026-10-08 16:59:28.892+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3d5-7d85-ac03-d28896651b0e
01a11c74-a3b0-7e31-ac56-1a13a6ae0902	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a399-7808-8bb5-3368441a04c6	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a3e7-72d4-8794-80be2849b7cb	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	4.00	\N	10000.00	12000.00	2000.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3eb-7381-83e5-c70f736349a3	system	2026-10-08 16:59:28.925+00	\N	2026-10-08 16:59:28.925+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a3eb-7035-83e2-775fb47a89b9
01a11c74-a3b2-746e-8ce9-91602dd965f7	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a3e5-7a04-84d2-11ec1e8a580a	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3c1-79f7-a2b7-af82d03bae26	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	2.00	\N	16000.00	19200.00	3200.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3bc-7093-85bd-3ae64361bd48	system	2026-10-08 16:59:28.851+00	\N	2026-10-08 16:59:28.851+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3bb-7e66-8c14-c7fa5c2c060d
01a11c74-a3bc-7d58-85ca-9495fe0669e1	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3c5-7262-b9b3-b5b6f5767071	system	2026-10-08 16:59:28.864+00	\N	2026-10-08 16:59:28.864+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	9.00	\N	2700.00	3240.00	540.00	01a11c74-a3c4-770a-b6e6-ea696969a54e
01a11c74-a3dc-79b6-9b8d-1edc79977c18	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	3.00	\N	36000.00	43200.00	7200.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a3ed-768f-8a0a-bef2404682a1	system	2026-10-08 16:59:28.93+00	\N	2026-10-08 16:59:28.93+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3ed-73ef-8a08-5c75710ed9e8
01a11c74-a399-7293-8baf-3d9c65a54df4	system	2026-10-08 16:59:28.789+00	\N	2026-10-08 16:59:28.789+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a398-7f8d-9a29-43e0c32202b7
01a11c74-a385-734f-bf24-54b6c3705070	system	2026-10-08 16:59:28.743+00	\N	2026-10-08 16:59:28.743+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a385-712b-bf22-57b9a2ac61e9
01a11c74-a3c9-7435-9f81-042e64912ed3	system	2026-10-08 16:59:28.872+00	\N	2026-10-08 16:59:28.872+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a3c9-71fb-9f7f-80645a84840d
01a11c74-a37d-7e5a-8de1-b2ca46acb200	system	2026-10-08 16:59:28.724+00	\N	2026-10-08 16:59:28.724+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	7.00	\N	28000.00	33600.00	5600.00	01a11c74-a37d-7c18-8ddf-5afd04995fab
01a11c74-a3e0-7fd7-b81b-8b01e08e9fb9	system	2026-10-08 16:59:28.91+00	\N	2026-10-08 16:59:28.91+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a3e0-7733-b812-60251472c289
01a11c74-a39d-73ae-b476-168d07b41b16	system	2026-10-08 16:59:28.795+00	\N	2026-10-08 16:59:28.795+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a39d-7199-b474-3ce6603d9200
01a11c74-a3e4-718d-980f-300942186297	system	2026-10-08 16:59:28.915+00	\N	2026-10-08 16:59:28.915+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	7.00	\N	35000.00	42000.00	7000.00	01a11c74-a3e3-7b74-a92a-b5fea0ac5fc6
01a11c74-a3b4-78a3-8801-5c2cdc1a513e	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a37d-73c6-8dd8-91134fb0ba87	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a393-7024-9756-b560f7b283ff	system	2026-10-08 16:59:28.778+00	\N	2026-10-08 16:59:28.778+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	10.00	\N	150000.00	180000.00	30000.00	01a11c74-a392-7b02-bad3-79fdf0bc7f20
01a11c74-a3e9-7326-8e1c-3810aed23def	system	2026-10-08 16:59:28.922+00	\N	2026-10-08 16:59:28.922+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3e8-7ff3-9f38-c3a1a0083135
01a11c74-a3d6-7f26-a83a-e9633f86f101	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	5.00	\N	12500.00	15000.00	2500.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3dc-7aa7-9b8e-cba42ea742de	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a3ad-74b0-bf0a-e6d56d25689f	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a39a-7ee9-8ab6-e7cce26c945c	system	2026-10-08 16:59:28.792+00	\N	2026-10-08 16:59:28.792+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a39a-7d99-8ab5-055fb154d68c
01a11c74-a39a-726a-8aa9-623c9c96dcd0	system	2026-10-08 16:59:28.791+00	\N	2026-10-08 16:59:28.791+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	6.00	\N	72000.00	86400.00	14400.00	01a11c74-a39a-713f-8aa8-b6878a8db42f
01a11c74-a3e7-701c-8791-88d006a50ed0	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3e2-7b4b-bbf1-c5f3ff922ef4	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a38d-707a-891a-a5c94016249d	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	4.00	\N	4000.00	4800.00	800.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3d8-7cbc-a0a3-63611f0fb2ab	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3b4-7f8d-8808-a0e5752db148	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3b4-7ba9-8804-de6c86d78aa4
01a11c74-a3e1-78c0-8279-d84ac9f61017	system	2026-10-08 16:59:28.911+00	\N	2026-10-08 16:59:28.911+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3e1-749b-8275-05c21f033b7e
01a11c74-a380-7872-b5b6-7d58cbc645f3	system	2026-10-08 16:59:28.731+00	\N	2026-10-08 16:59:28.731+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	3.00	\N	18000.00	21600.00	3600.00	01a11c74-a380-704d-b5ae-c3dbddabdc3e
01a11c74-a39e-75eb-9d97-c50d73622846	system	2026-10-08 16:59:28.796+00	\N	2026-10-08 16:59:28.796+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	5.00	\N	25000.00	30000.00	5000.00	01a11c74-a39e-7041-9d91-50050e450433
01a11c74-a3d1-7c66-8eca-5a49a21b216c	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a382-7dce-82e5-7bbf2d58a89a	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3c7-7195-9b07-dc5b94c4f298	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	2.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3ae-7d78-990e-6471fc2b54a5	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	4.00	\N	48000.00	57600.00	9600.00	01a11c74-a3ae-7bef-990d-5edd5f6f8f71
01a11c74-a3a2-75c2-86d8-56c17e4f6a0d	system	2026-10-08 16:59:28.802+00	\N	2026-10-08 16:59:28.802+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	10.00	\N	60000.00	72000.00	12000.00	01a11c74-a3a1-7e35-adbf-a7a5e41a98b9
01a11c74-a3dd-7fca-87f4-784ff3404f78	system	2026-10-08 16:59:28.906+00	\N	2026-10-08 16:59:28.906+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3dd-7c8f-87f1-91e0b13e61d6
01a11c74-a3b2-7d43-8cf2-2d67f9e2a40c	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3dd-752b-87e9-47019f29ff26	system	2026-10-08 16:59:28.905+00	\N	2026-10-08 16:59:28.905+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3dd-73b6-87e8-35871452edfb
01a11c74-a37b-770e-a9b3-7ec05e7f8dd5	system	2026-10-08 16:59:28.714+00	\N	2026-10-08 16:59:28.714+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	6.00	\N	6000.00	7200.00	1200.00	01a11c74-a37a-7cc0-95be-9c866039a521
01a11c74-a3d0-78fd-ba41-a8aa83a985ff	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3d0-73d2-ba3c-21f4dc2d1d0f
01a11c74-a3ab-7381-b121-18079ffe31b5	system	2026-10-08 16:59:28.823+00	\N	2026-10-08 16:59:28.823+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	4.00	\N	30000.00	36000.00	6000.00	01a11c74-a3aa-7f9d-a0d1-990e56e7fe1d
01a11c74-a3cf-7f12-ab2e-d0139c7be01d	system	2026-10-08 16:59:28.882+00	\N	2026-10-08 16:59:28.882+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a3cf-7851-ab27-73c48d538682
01a11c74-a3d7-76e1-9092-aa1e257c0ea8	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3d7-7585-9091-f2d1ff99711a
01a11c74-a3b8-79db-8188-df5b740de149	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a3d6-7c7e-a837-8e7bf7b5727d	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3b8-7f22-818e-9d48ea4edf71	system	2026-10-08 16:59:28.845+00	\N	2026-10-08 16:59:28.845+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	6.00	\N	3000.00	3600.00	600.00	01a11c74-a3b8-74e9-8183-c07da79a01eb
01a11c74-a384-75a1-8d16-91228febd1f2	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	5.00	\N	5000.00	6000.00	1000.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a3c7-76f5-9b0d-9ade29d0823d	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	12.00	\N	96000.00	115200.00	19200.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3b2-763d-8ceb-b2345e85b29e	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	9.00	\N	22500.00	27000.00	4500.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a395-7d70-9b24-cae9c9144023	system	2026-10-08 16:59:28.784+00	\N	2026-10-08 16:59:28.784+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	10.00	\N	75000.00	90000.00	15000.00	01a11c74-a395-7774-9b20-77c1504111be
01a11c74-a3da-7a00-8297-3d6db4dcee30	system	2026-10-08 16:59:28.9+00	\N	2026-10-08 16:59:28.9+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	5.00	\N	30000.00	36000.00	6000.00	01a11c74-a3da-725a-828f-50cc407e0f49
01a11c74-a3dd-72b8-87e7-cc47ca88205f	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a382-7204-82da-d63da9666568	system	2026-10-08 16:59:28.736+00	\N	2026-10-08 16:59:28.736+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	9.00	\N	45000.00	54000.00	9000.00	01a11c74-a381-7c24-9054-e89ec26a9ace
01a11c74-a3e6-7f37-9066-f14023c256c3	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3be-7afd-bc6b-b8ca23d7be8d	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3de-7db6-8778-b03a009a4623	system	2026-10-08 16:59:28.907+00	\N	2026-10-08 16:59:28.907+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	9.00	\N	36000.00	43200.00	7200.00	01a11c74-a3de-7b3b-8776-180445299eb9
01a11c74-a39e-7da1-9d9f-4b83669cb6dc	system	2026-10-08 16:59:28.797+00	\N	2026-10-08 16:59:28.797+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a39e-79d2-9d9b-8f14e0482d72
01a11c74-a398-7e41-9a28-026330cbfe5e	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	10.00	\N	1500.00	1800.00	300.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3c0-7b0e-9700-584aebdfc516	system	2026-10-08 16:59:28.858+00	\N	2026-10-08 16:59:28.858+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3c0-7639-96fb-72d3bc1b7408
01a11c74-a3ca-724d-a81c-48a0c6c9442e	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a394-71a1-8d9c-b8e37a4b9d73	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	5.00	\N	40000.00	48000.00	8000.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3d0-7d47-ba45-0eac285a7ce8	system	2026-10-08 16:59:28.883+00	\N	2026-10-08 16:59:28.883+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	11.00	\N	132000.00	158400.00	26400.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a397-7d74-b288-dd8129c33c9b	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3d4-7e72-b0d1-c312e192b21a	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	4.00	\N	32000.00	38400.00	6400.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a38c-7a56-ad1d-22af240114e8	system	2026-10-08 16:59:28.769+00	\N	2026-10-08 16:59:28.769+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	3.00	\N	27000.00	32400.00	5400.00	01a11c74-a38c-7760-ad1a-5aae8aed17a5
01a11c74-a3e5-7bd7-84d4-bfdd6b22961d	system	2026-10-08 16:59:28.918+00	\N	2026-10-08 16:59:28.918+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3e5-75ef-84ce-95cc9d93d957
01a11c74-a3e1-77d7-8278-3284a7a4a1b1	system	2026-10-08 16:59:28.911+00	\N	2026-10-08 16:59:28.911+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3e1-749b-8275-05c21f033b7e
01a11c74-a393-7e0c-9762-71aae2044908	system	2026-10-08 16:59:28.78+00	\N	2026-10-08 16:59:28.78+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	2.00	\N	18000.00	21600.00	3600.00	01a11c74-a393-7af9-975f-0ebf94c97c2a
01a11c74-a3c1-74a3-a2b1-43d324906c16	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3be-7cbc-bc6d-7b76f0ae3f0c	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3bb-78c4-8c0e-15e024410b36	system	2026-10-08 16:59:28.85+00	\N	2026-10-08 16:59:28.85+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a3bb-7122-8c06-fcfc2f0f6f7b
01a11c74-a3d3-7595-b945-e215d75ab2c6	system	2026-10-08 16:59:28.888+00	\N	2026-10-08 16:59:28.888+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a3d2-7fd2-9aaa-302305c57d4f
01a11c74-a3bd-700c-809e-6dc4910e0063	system	2026-10-08 16:59:28.852+00	\N	2026-10-08 16:59:28.852+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a3bc-7c00-85c9-45a7f12b7bdb
01a11c74-a3a3-7568-88ed-92b9e43ab503	system	2026-10-08 16:59:28.805+00	\N	2026-10-08 16:59:28.805+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a3a3-7337-88eb-7a9bdc26ed7e
01a11c74-a383-79f7-a984-a474a19ec61c	system	2026-10-08 16:59:28.739+00	\N	2026-10-08 16:59:28.739+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a383-78e1-a983-80884ce4b713
01a11c74-a37f-7acc-b2c9-635ac54b59fb	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	2.00	\N	12000.00	14400.00	2400.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3d9-7147-a29c-1119677a9996	system	2026-10-08 16:59:28.898+00	\N	2026-10-08 16:59:28.898+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	2.00	\N	16000.00	19200.00	3200.00	01a11c74-a3d8-7a5e-a0a1-85c9bbfb170a
01a11c74-a3b0-7f16-ac57-9012b8a24e2e	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	7.00	\N	7000.00	8400.00	1400.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3b7-7231-9469-44838fc85f74	system	2026-10-08 16:59:28.842+00	\N	2026-10-08 16:59:28.842+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	11.00	\N	55000.00	66000.00	11000.00	01a11c74-a3b6-7c51-ad54-4fd4ba0a666f
01a11c74-a3ee-7595-9f2a-033e0da0955f	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a386-71d7-a177-d6277935fd19	system	2026-10-08 16:59:28.744+00	\N	2026-10-08 16:59:28.744+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a385-7d9d-bf2e-03d2c27493b6
01a11c74-a396-7b22-a5f6-ea75400990fb	system	2026-10-08 16:59:28.785+00	\N	2026-10-08 16:59:28.785+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a396-7547-a5f0-fb1bedac1975
01a11c74-a3c1-766a-a2b3-45be5963dbae	system	2026-10-08 16:59:28.859+00	\N	2026-10-08 16:59:28.859+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3c1-735c-a2b0-2737e09c0fb7
01a11c74-a3d7-747e-9090-6921e5637160	system	2026-10-08 16:59:28.895+00	\N	2026-10-08 16:59:28.895+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3d7-7116-908d-90a358cd42af
01a11c74-a3af-7031-89ec-476503483d5e	system	2026-10-08 16:59:28.83+00	\N	2026-10-08 16:59:28.83+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3ae-7bef-990d-5edd5f6f8f71
01a11c74-a3e7-7a7a-879c-b4a80e3051e6	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a3c2-71ce-b1fd-e845cd4fcb08	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3b0-7456-ac4c-8516a8d5e738	system	2026-10-08 16:59:28.832+00	\N	2026-10-08 16:59:28.832+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a3b0-7122-ac49-4b7b12f30887
01a11c74-a38f-7a0c-ac7c-45b9eb4b9f2a	system	2026-10-08 16:59:28.772+00	\N	2026-10-08 16:59:28.772+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	9.00	\N	4500.00	5400.00	900.00	01a11c74-a38e-7f70-902d-20a266ce24a5
01a11c74-a392-725e-bacb-582fb58b697c	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a3ee-7041-9f24-6d0876a3ba83	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3d5-7645-abfb-6d4796421397	system	2026-10-08 16:59:28.891+00	\N	2026-10-08 16:59:28.891+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	6.00	\N	54000.00	64800.00	10800.00	01a11c74-a3d5-7316-abf8-4485c9de6aac
01a11c74-a37f-7de3-b2cc-5f359aba8b50	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	3.00	\N	1500.00	1800.00	300.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3b9-7f02-a936-52f347c69c4e	system	2026-10-08 16:59:28.847+00	\N	2026-10-08 16:59:28.847+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3b9-7cb0-a934-35107821fc92
01a11c74-a3ed-7d68-8a11-3d554297a620	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	11.00	\N	44000.00	52800.00	8800.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3a1-7b0e-adbc-9d6c34433f16	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	9.00	\N	72000.00	86400.00	14400.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a381-7543-904e-0f837512a02a	system	2026-10-08 16:59:28.734+00	\N	2026-10-08 16:59:28.734+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a381-70f9-904a-728222c44349
01a11c74-a3cc-76bc-ae50-a1fa4085c8af	system	2026-10-08 16:59:28.877+00	\N	2026-10-08 16:59:28.877+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	2.00	\N	30000.00	36000.00	6000.00	01a11c74-a3cc-71b2-ae4b-83033d08c06f
01a11c74-a382-7eb0-82e6-a43b64597b6a	system	2026-10-08 16:59:28.737+00	\N	2026-10-08 16:59:28.737+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a382-7ae5-82e2-3ecfbf218ac0
01a11c74-a3dc-772f-9b8b-2dbd62e44cc8	system	2026-10-08 16:59:28.903+00	\N	2026-10-08 16:59:28.903+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	8.00	\N	2400.00	2880.00	480.00	01a11c74-a3db-7b9d-b8a5-5f264b50536d
01a11c74-a3a5-7066-a732-f6dd7f580d1e	system	2026-10-08 16:59:28.808+00	\N	2026-10-08 16:59:28.808+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3a4-7e3d-aaff-54abedce29dc
01a11c74-a39f-73b2-9f4a-508f04e9ed79	system	2026-10-08 16:59:28.798+00	\N	2026-10-08 16:59:28.798+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	3.00	\N	45000.00	54000.00	9000.00	01a11c74-a39e-7ef9-9da0-5219eda57ca3
01a11c74-a3e2-76a3-bbec-61e37b05d5ed	system	2026-10-08 16:59:28.913+00	\N	2026-10-08 16:59:28.913+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3e2-719d-bbe7-e21685a68abe
01a11c74-a3b6-73f3-ad4b-513c09f7a8a1	system	2026-10-08 16:59:28.841+00	\N	2026-10-08 16:59:28.841+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	7.00	\N	63000.00	75600.00	12600.00	01a11c74-a3b6-70d9-ad48-f09f7a767a6c
01a11c74-a3eb-79a9-83eb-b83046f935bf	system	2026-10-08 16:59:28.926+00	\N	2026-10-08 16:59:28.926+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a3eb-746a-83e6-23a06172b74f
01a11c74-a3b0-78b4-ac50-5e47354945c8	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a397-78d0-b283-e0f4332a33ce	system	2026-10-08 16:59:28.787+00	\N	2026-10-08 16:59:28.787+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a397-76bc-b281-f8172f1b7071
01a11c74-a3d5-7ee9-ac04-adf4ffac046e	system	2026-10-08 16:59:28.892+00	\N	2026-10-08 16:59:28.892+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3d5-7d85-ac03-d28896651b0e
01a11c74-a38a-7547-baf2-0f486015c2b7	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a3ea-7d74-a41b-f7e8f9cb569e	system	2026-10-08 16:59:28.924+00	\N	2026-10-08 16:59:28.924+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	10.00	\N	5000.00	6000.00	1000.00	01a11c74-a3ea-72fd-a410-f4f74a624904
01a11c74-a37f-73df-b2c3-131bb198eb9a	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a37f-79c6-b2c8-39fce883dc64	system	2026-10-08 16:59:28.729+00	\N	2026-10-08 16:59:28.729+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a37f-71a1-b2c1-06eaa2183b01
01a11c74-a3c8-7e39-95dc-7ad6e51feac3	system	2026-10-08 16:59:28.871+00	\N	2026-10-08 16:59:28.871+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	3.00	\N	15000.00	18000.00	3000.00	01a11c74-a3c8-7866-95d6-aa66b2ddf1e8
01a11c74-a38d-7b0a-8922-d601328674f0	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3ee-7672-9f2b-dc907589c83d	system	2026-10-08 16:59:28.931+00	\N	2026-10-08 16:59:28.931+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	4.00	\N	1200.00	1440.00	240.00	01a11c74-a3ed-7b16-8a0f-0e5325f62c93
01a11c74-a3e5-740c-84cc-3af2222052de	system	2026-10-08 16:59:28.917+00	\N	2026-10-08 16:59:28.917+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3e4-7fca-981e-b5212ef39590
01a11c74-a3c8-765e-95d4-89dd3c2d7462	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	8.00	\N	20000.00	24000.00	4000.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a3b1-75fb-b827-54d9fac39a93	system	2026-10-08 16:59:28.834+00	\N	2026-10-08 16:59:28.834+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3b1-72f9-b824-aa82b5e59753
01a11c74-a3cd-751a-8bb1-ca25e91e7f91	system	2026-10-08 16:59:28.878+00	\N	2026-10-08 16:59:28.878+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a3cc-7e24-ae58-c4703de10a0b
01a11c74-a38d-7866-8921-d30e1792bbf0	system	2026-10-08 16:59:28.77+00	\N	2026-10-08 16:59:28.77+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	6.00	\N	30000.00	36000.00	6000.00	01a11c74-a38d-7297-891b-00b18133b34f
01a11c74-a3b9-746e-a92b-4c4fe893ff05	system	2026-10-08 16:59:28.846+00	\N	2026-10-08 16:59:28.846+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	4.00	\N	16000.00	19200.00	3200.00	01a11c74-a3b9-7218-a929-14a2c89c11d7
01a11c74-a3af-764d-89f2-506617df92c2	system	2026-10-08 16:59:28.831+00	\N	2026-10-08 16:59:28.831+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	2.00	\N	8000.00	9600.00	1600.00	01a11c74-a3af-7418-89f0-6412357a9731
01a11c74-a3c4-733f-b6e2-3bb23d34868a	system	2026-10-08 16:59:28.863+00	\N	2026-10-08 16:59:28.863+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	5.00	\N	37500.00	45000.00	7500.00	01a11c74-a3c3-7ef1-9f18-f4cc8df00f8d
01a11c74-a3ca-7d9d-a827-7ff0f1f8c70b	system	2026-10-08 16:59:28.874+00	\N	2026-10-08 16:59:28.874+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	12.00	\N	180000.00	216000.00	36000.00	01a11c74-a3ca-7856-a822-9c9955870431
01a11c74-a3dc-7d60-9b91-255b773eab09	system	2026-10-08 16:59:28.904+00	\N	2026-10-08 16:59:28.904+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	7.00	\N	105000.00	126000.00	21000.00	01a11c74-a3dc-7839-9b8c-42e8d3af2c6c
01a11c74-a37c-7d64-8c18-72cc282c2f65	system	2026-10-08 16:59:28.721+00	\N	2026-10-08 16:59:28.721+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	5.00	\N	60000.00	72000.00	12000.00	01a11c74-a37c-7c5a-8c17-d59251ec41ef
01a11c74-a3be-767a-bc66-cf8fb42cbf85	system	2026-10-08 16:59:28.855+00	\N	2026-10-08 16:59:28.855+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	5.00	\N	20000.00	24000.00	4000.00	01a11c74-a3be-744d-bc64-3f96bb960050
01a11c74-a3bf-7578-93ad-8b8f07cbcb13	system	2026-10-08 16:59:28.856+00	\N	2026-10-08 16:59:28.856+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	8.00	\N	60000.00	72000.00	12000.00	01a11c74-a3bf-7170-93a9-ed5de6f541ec
01a11c74-a391-7d1a-90f0-3f99e6816ea9	system	2026-10-08 16:59:28.776+00	\N	2026-10-08 16:59:28.776+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a391-7bc6-90ef-688d40055423
01a11c74-a3ca-7414-a81e-0d491569c0e1	system	2026-10-08 16:59:28.873+00	\N	2026-10-08 16:59:28.873+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	11.00	\N	11000.00	13200.00	2200.00	01a11c74-a3c9-7981-9f83-7c0255e20a16
01a11c74-a3ae-71ca-9902-05d4abdecc7c	system	2026-10-08 16:59:28.829+00	\N	2026-10-08 16:59:28.829+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	7.00	\N	84000.00	100800.00	16800.00	01a11c74-a3ae-708f-9901-f8b0f77346fd
01a11c74-a3c5-7883-b9b9-91cdf9a2750c	system	2026-10-08 16:59:28.865+00	\N	2026-10-08 16:59:28.865+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	3.00	\N	22500.00	27000.00	4500.00	01a11c74-a3c5-7476-b9b5-c3d17ae5ef43
01a11c74-a3c8-72d9-95d0-8366ac71dd5f	system	2026-10-08 16:59:28.87+00	\N	2026-10-08 16:59:28.87+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	8.00	\N	120000.00	144000.00	24000.00	01a11c74-a3c7-7db6-9b14-938674a75f2e
01a11c74-a3d7-78a7-9094-55be405c31a3	system	2026-10-08 16:59:28.896+00	\N	2026-10-08 16:59:28.896+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	9.00	\N	81000.00	97200.00	16200.00	01a11c74-a3d7-7585-9091-f2d1ff99711a
01a11c74-a3b5-7595-9122-41c1c6d0e9a3	system	2026-10-08 16:59:28.84+00	\N	2026-10-08 16:59:28.84+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3b5-736c-9120-0766b27f9367
01a11c74-a392-743d-bacd-b4f010fc2cc7	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	6.00	\N	90000.00	108000.00	18000.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a39b-7c5a-8974-4d2e97e3f175	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	4.00	\N	36000.00	43200.00	7200.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a3b4-77c6-8800-fb5b6a5d84f0	system	2026-10-08 16:59:28.839+00	\N	2026-10-08 16:59:28.839+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	8.00	\N	8000.00	9600.00	1600.00	01a11c74-a3b3-7e6a-b957-32692d29b951
01a11c74-a3a3-7200-88ea-033f2daa35e5	system	2026-10-08 16:59:28.803+00	\N	2026-10-08 16:59:28.803+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a3a2-7a8f-86dd-9822875dc32d
01a11c74-a3c3-7851-9f11-06da5305a3af	system	2026-10-08 16:59:28.862+00	\N	2026-10-08 16:59:28.862+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	10.00	\N	80000.00	96000.00	16000.00	01a11c74-a3c3-7170-9f0a-1b0897957d02
01a11c74-a3ad-7d95-bf14-23a45ff3f1fe	system	2026-10-08 16:59:28.828+00	\N	2026-10-08 16:59:28.828+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	7.00	\N	3500.00	4200.00	700.00	01a11c74-a3ad-7381-bf09-b5ff004181b2
01a11c74-a3d1-7fef-8ece-646336177c97	system	2026-10-08 16:59:28.885+00	\N	2026-10-08 16:59:28.885+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	3.00	\N	24000.00	28800.00	4800.00	01a11c74-a3d1-7943-8ec7-99039099dbd5
01a11c74-a3d1-7820-8ec6-32f960cc3654	system	2026-10-08 16:59:28.884+00	\N	2026-10-08 16:59:28.884+00	\N	\N	1	01a11c74-9aa2-7c45-89a0-cc3ad204df5c	6.00	\N	900.00	1080.00	180.00	01a11c74-a3d0-7bdb-ba44-bf98ffd271a2
01a11c74-a3d4-79df-b0cc-743e9cd43aa1	system	2026-10-08 16:59:28.89+00	\N	2026-10-08 16:59:28.89+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3d4-7770-b0ca-1525f6c4771e
01a11c74-a37e-7e4d-ba28-6dcff69c474b	system	2026-10-08 16:59:28.727+00	\N	2026-10-08 16:59:28.727+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	9.00	\N	54000.00	64800.00	10800.00	01a11c74-a37e-75f7-ba20-8e7877089db2
01a11c74-a3a0-70e1-8dcc-735c21aea8c3	system	2026-10-08 16:59:28.799+00	\N	2026-10-08 16:59:28.799+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	6.00	\N	48000.00	57600.00	9600.00	01a11c74-a39f-7a5a-9f51-fd013ec94401
01a11c74-a3a7-7e9b-a989-0c5dd689afb8	system	2026-10-08 16:59:28.816+00	\N	2026-10-08 16:59:28.816+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	5.00	\N	45000.00	54000.00	9000.00	01a11c74-a3a7-7b99-a986-60e5ef048829
01a11c74-a3a0-7f91-8ddb-eec7a44b4bd2	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	8.00	\N	72000.00	86400.00	14400.00	01a11c74-a3a0-7c9f-8dd8-928b9728f447
01a11c74-a3b2-7381-8ce8-0e020ccad2b3	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b1b-75a5-86ba-ac1a7e5fa2a6	8.00	\N	40000.00	48000.00	8000.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a38b-7168-9719-0eb924b44601	system	2026-10-08 16:59:28.759+00	\N	2026-10-08 16:59:28.759+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	8.00	\N	64000.00	76800.00	12800.00	01a11c74-a38a-7af5-baf7-f79ef6b110c8
01a11c74-a3b1-7000-b821-b8ef88b6a505	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b39-7ddf-a2a0-e2f49685bb1f	3.00	\N	1500.00	1800.00	300.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a3b1-70ed-b822-8ef19e44bbed	system	2026-10-08 16:59:28.833+00	\N	2026-10-08 16:59:28.833+00	\N	\N	1	01a11c74-9b3e-7dfb-b7a8-76b583ec7e55	11.00	\N	3300.00	3960.00	660.00	01a11c74-a3b0-7581-ac4d-869c951de7e8
01a11c74-a38b-7e7e-9726-e0acd7d6f0b2	system	2026-10-08 16:59:28.76+00	\N	2026-10-08 16:59:28.76+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a38b-7645-971d-7660dc232eec
01a11c74-a3a1-7585-adb6-f550ce692657	system	2026-10-08 16:59:28.801+00	\N	2026-10-08 16:59:28.801+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	9.00	\N	108000.00	129600.00	21600.00	01a11c74-a3a1-745e-adb5-0732387ef335
01a11c74-a398-7620-9a1f-57b9e83a93f0	system	2026-10-08 16:59:28.788+00	\N	2026-10-08 16:59:28.788+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	11.00	\N	82500.00	99000.00	16500.00	01a11c74-a398-71ef-9a1b-d70c44311598
01a11c74-a3b2-7ffb-8cf5-2a2fb28298c8	system	2026-10-08 16:59:28.836+00	\N	2026-10-08 16:59:28.836+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	2.00	\N	5000.00	6000.00	1000.00	01a11c74-a3b2-7774-8cec-087f70c8f671
01a11c74-a3d6-7d60-a838-e1dbe9f6cec0	system	2026-10-08 16:59:28.894+00	\N	2026-10-08 16:59:28.894+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	11.00	\N	88000.00	105600.00	17600.00	01a11c74-a3d6-76ac-a831-f223f40b675c
01a11c74-a3c7-727e-9b08-efb7bcbdf490	system	2026-10-08 16:59:28.868+00	\N	2026-10-08 16:59:28.868+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	6.00	\N	24000.00	28800.00	4800.00	01a11c74-a3c7-7041-9b06-27a7356fd7de
01a11c74-a3c2-739d-b1ff-0f57ef15ae6d	system	2026-10-08 16:59:28.86+00	\N	2026-10-08 16:59:28.86+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	5.00	\N	75000.00	90000.00	15000.00	01a11c74-a3c1-7eb4-a2bc-c22c5f568f6d
01a11c74-a3a0-78b0-8dd4-4755cd9d42e4	system	2026-10-08 16:59:28.8+00	\N	2026-10-08 16:59:28.8+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	10.00	\N	120000.00	144000.00	24000.00	01a11c74-a3a0-778d-8dd3-477418e64b37
01a11c74-a3e7-7999-879b-d19354ab3ddb	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	12.00	\N	48000.00	57600.00	9600.00	01a11c74-a3e7-774f-8799-2314c2bff2c1
01a11c74-a38a-770e-baf4-4dac7b760ac8	system	2026-10-08 16:59:28.757+00	\N	2026-10-08 16:59:28.757+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	10.00	\N	25000.00	30000.00	5000.00	01a11c74-a389-7eb8-bcd5-97bdc1af96fb
01a11c74-a3d9-7753-a2a2-07987d5d383a	system	2026-10-08 16:59:28.899+00	\N	2026-10-08 16:59:28.899+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	8.00	\N	32000.00	38400.00	6400.00	01a11c74-a3d9-7506-a2a0-d3b8f1f40c09
01a11c74-a3e7-71ef-8793-3e12c4919efd	system	2026-10-08 16:59:28.92+00	\N	2026-10-08 16:59:28.92+00	\N	\N	1	01a11c74-9b28-7e9f-b5df-bf408a68d7ce	4.00	\N	24000.00	28800.00	4800.00	01a11c74-a3e6-7a39-9061-3e3f8410bc76
01a11c74-a3b2-70cc-8ce5-e1bfd3d18c90	system	2026-10-08 16:59:28.835+00	\N	2026-10-08 16:59:28.835+00	\N	\N	1	01a11c74-9b89-7195-81fc-ca49e6b351cf	10.00	\N	90000.00	108000.00	18000.00	01a11c74-a3b1-7d85-b82f-86153b47d162
01a11c74-a389-7ac4-bcd2-2b84c4d22c95	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b33-77ef-8f8d-dc4d72040378	3.00	\N	3000.00	3600.00	600.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a379-77a9-b785-eac2d74a11e5	system	2026-10-08 16:59:28.704+00	\N	2026-10-08 16:59:28.704+00	\N	\N	1	01a11c74-9b83-706a-ae35-e7566c27728d	10.00	\N	40000.00	48000.00	8000.00	01a11c74-a377-7506-b064-832c07a347f8
01a11c74-a39b-7e2d-8976-9283de098ea7	system	2026-10-08 16:59:28.793+00	\N	2026-10-08 16:59:28.793+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	4.00	\N	60000.00	72000.00	12000.00	01a11c74-a39b-796c-8971-a24400ac5f3e
01a11c74-a392-734b-bacc-d2e578a89253	system	2026-10-08 16:59:28.777+00	\N	2026-10-08 16:59:28.777+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	6.00	\N	45000.00	54000.00	9000.00	01a11c74-a391-7f2b-90f1-3f7c686ee68e
01a11c74-a389-79e7-bcd1-2f5cae7b48bc	system	2026-10-08 16:59:28.756+00	\N	2026-10-08 16:59:28.756+00	\N	\N	1	01a11c74-9b2e-702d-9811-c4ee5ad4f08c	6.00	\N	15000.00	18000.00	3000.00	01a11c74-a389-711a-bcc8-db69eb5e3fb2
01a11c74-a3a6-7d2f-9bc5-063c82815a2e	system	2026-10-08 16:59:28.812+00	\N	2026-10-08 16:59:28.812+00	\N	\N	1	01a11c74-9b7b-7fa9-aeb9-f8fc49cfdf50	8.00	\N	96000.00	115200.00	19200.00	01a11c74-a3a6-7c04-9bc4-e60273c4ffb3
01a11c74-a3c5-7968-b9ba-bb4077d0ed05	system	2026-10-08 16:59:28.865+00	\N	2026-10-08 16:59:28.865+00	\N	\N	1	01a11c74-9b12-7a2d-a491-e795df55b021	11.00	\N	165000.00	198000.00	33000.00	01a11c74-a3c5-7476-b9b5-c3d17ae5ef43
01a11c74-a3e8-7a5a-9f32-f9dbbbe41280	system	2026-10-08 16:59:28.921+00	\N	2026-10-08 16:59:28.921+00	\N	\N	1	01a11c74-9b23-769b-abb2-ce044d3ad1f8	7.00	\N	56000.00	67200.00	11200.00	01a11c74-a3e8-7378-9f2b-70d45b208a42
01a11c74-a3cd-7b16-8bb7-d2a19d7c33e8	system	2026-10-08 16:59:28.879+00	\N	2026-10-08 16:59:28.879+00	\N	\N	1	01a11c74-9b8e-790a-b2e9-e19f5e69c1fa	9.00	\N	67500.00	81000.00	13500.00	01a11c74-a3cd-7712-8bb3-aa750a14d446
\.


--
-- Data for Name: user_; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_ (id, created_by, created_date, updated_by, updated_date, deleted_by, deleted_date, version, username, first_name, last_name, password, email, active, time_zone_id) FROM stdin;
60885987-1b61-4247-94c7-dff348347f93	\N	\N	\N	\N	\N	\N	1	admin	\N	\N	\N	\N	t	\N
60885987-1b61-4247-94c7-dff348347f95	\N	\N	\N	\N	\N	\N	1	james	James	Sullivan	\N	\N	t	\N
60885987-1b61-4247-94c7-dff348347f94	\N	\N	\N	\N	\N	\N	1	manager	Celia	Mae	\N	\N	t	\N
a1b2c3d4-e5f6-7890-abcd-ef1234567890	\N	\N	\N	\N	\N	\N	1	alice	Alice	Brown	\N	\N	t	\N
b2c3d4e5-f6a7-8901-bcde-f12345678901	\N	\N	\N	\N	\N	\N	1	robert	Robert	Taylor	\N	\N	t	\N
\.


--
-- Name: user_ USER__pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_
    ADD CONSTRAINT "USER__pkey" PRIMARY KEY (id);


--
-- Name: category category_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_code_key UNIQUE (code);


--
-- Name: category_item category_item_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_item
    ADD CONSTRAINT category_item_code_key UNIQUE (code);


--
-- Name: invoice invoice_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_number_key UNIQUE (number);


--
-- Name: order_ order__number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_
    ADD CONSTRAINT order__number_key UNIQUE (number);


--
-- Name: category pk_category; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT pk_category PRIMARY KEY (id);


--
-- Name: category_item pk_category_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_item
    ADD CONSTRAINT pk_category_item PRIMARY KEY (id);


--
-- Name: client pk_client; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT pk_client PRIMARY KEY (id);


--
-- Name: contact pk_contact; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT pk_contact PRIMARY KEY (id);


--
-- Name: invoice pk_invoice; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT pk_invoice PRIMARY KEY (id);


--
-- Name: order_ pk_order_; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_
    ADD CONSTRAINT pk_order_ PRIMARY KEY (id);


--
-- Name: order_item pk_order_item; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT pk_order_item PRIMARY KEY (id);


--
-- Name: idx_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_category ON public.category USING btree (parent_id);


--
-- Name: idx_category_item_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_category_item_category ON public.category_item USING btree (category_id);


--
-- Name: idx_client_account_manager; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_client_account_manager ON public.client USING btree (account_manager_id);


--
-- Name: idx_contact_client; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_contact_client ON public.contact USING btree (client_id);


--
-- Name: idx_invoice_client; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_invoice_client ON public.invoice USING btree (client_id);


--
-- Name: idx_invoice_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_invoice_order ON public.invoice USING btree (order_id);


--
-- Name: idx_order__client; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order__client ON public.order_ USING btree (client_id);


--
-- Name: idx_order_item_category_item; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_item_category_item ON public.order_item USING btree (category_item_id);


--
-- Name: idx_order_item_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_item_order ON public.order_item USING btree (order_id);


--
-- Name: idx_user__on_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_user__on_username ON public.user_ USING btree (username);


--
-- Name: category_item fk_category_item_on_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category_item
    ADD CONSTRAINT fk_category_item_on_category FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: category fk_category_on_parent; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT fk_category_on_parent FOREIGN KEY (parent_id) REFERENCES public.category(id);


--
-- Name: client fk_client_on_account_manager; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_client_on_account_manager FOREIGN KEY (account_manager_id) REFERENCES public.user_(id);


--
-- Name: contact fk_contact_on_client; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT fk_contact_on_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: invoice fk_invoice_on_client; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fk_invoice_on_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: invoice fk_invoice_on_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT fk_invoice_on_order FOREIGN KEY (order_id) REFERENCES public.order_(id);


--
-- Name: order_ fk_order__on_client; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_
    ADD CONSTRAINT fk_order__on_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: order_item fk_order_item_on_category_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_order_item_on_category_item FOREIGN KEY (category_item_id) REFERENCES public.category_item(id);


--
-- Name: order_item fk_order_item_on_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT fk_order_item_on_order FOREIGN KEY (order_id) REFERENCES public.order_(id);


--
-- PostgreSQL database dump complete
--


