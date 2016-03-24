--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-03-24 17:42:44 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 24642)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24692)
-- Name: anno_accademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE anno_accademico (
    k_anno_accademico integer NOT NULL,
    codice_anno numeric,
    nome_anno_x text,
    nome_anno_x_menouno text,
    nome_anno_x_menouno_x text
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24690)
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE anno_accademico_k_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_k_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2482 (class 0 OID 0)
-- Dependencies: 196
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE anno_accademico_k_anno_accademico_seq OWNED BY anno_accademico.k_anno_accademico;


--
-- TOC entry 195 (class 1259 OID 24681)
-- Name: cds; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE cds (
    k_cds integer NOT NULL,
    data_inizio_validita numeric,
    data_fine_validita numeric,
    nome_cds text,
    tipo_cds text,
    nome_dipartimento text,
    codice_dipartimento numeric,
    codice_cds numeric,
    durata_legale numeric,
    codice_ateneo text
);


ALTER TABLE cds OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 24679)
-- Name: cds_k_cds_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE cds_k_cds_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cds_k_cds_seq OWNER TO postgres;

--
-- TOC entry 2483 (class 0 OID 0)
-- Dependencies: 194
-- Name: cds_k_cds_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE cds_k_cds_seq OWNED BY cds.k_cds;


--
-- TOC entry 204 (class 1259 OID 24792)
-- Name: corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso (
    k_corso integer NOT NULL,
    nome text,
    numero_cfu numeric,
    ssd text,
    codice_corso text
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24790)
-- Name: corso_k_corso_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE corso_k_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_k_corso_seq OWNER TO postgres;

--
-- TOC entry 2484 (class 0 OID 0)
-- Dependencies: 203
-- Name: corso_k_corso_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE corso_k_corso_seq OWNED BY corso.k_corso;


--
-- TOC entry 205 (class 1259 OID 24801)
-- Name: esami; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE esami (
    k_corso integer NOT NULL,
    k_cds integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_studente integer NOT NULL,
    k_tempo integer NOT NULL,
    voto numeric,
    cfu_acquisiti numeric
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24756)
-- Name: ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE ingressi (
    k_studente integer NOT NULL,
    k_tipo_immatricolazione integer NOT NULL,
    k_tempo integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_cds integer NOT NULL,
    punteggio_test numeric,
    immatricolato text
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 24834)
-- Name: lauree; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE lauree (
    k_cds integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_studente integer NOT NULL,
    k_tempo integer NOT NULL,
    voto_laurea numeric
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 24658)
-- Name: studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE studente (
    k_studente integer NOT NULL,
    data_nascita text,
    coorte numeric,
    titolo_di_studio text,
    sesso text,
    regione_residenza text,
    provincia_residenza text,
    comune_residenza text,
    stato_residenza text,
    cittadinanza text,
    cf text,
    voto_scuola_media_superiore text,
    nazione_diploma text,
    tipo_scuola_media_superiore text,
    istituto_scuola_media_superiore text,
    anno_solare_conseguimento numeric
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 24656)
-- Name: studente_k_studente_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE studente_k_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_k_studente_seq OWNER TO postgres;

--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 192
-- Name: studente_k_studente_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE studente_k_studente_seq OWNED BY studente.k_studente;


--
-- TOC entry 201 (class 1259 OID 24747)
-- Name: tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tempo (
    k_tempo integer NOT NULL,
    anno numeric,
    mese numeric,
    giorno numeric
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24745)
-- Name: tempo_k_tempo_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tempo_k_tempo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tempo_k_tempo_seq OWNER TO postgres;

--
-- TOC entry 2486 (class 0 OID 0)
-- Dependencies: 200
-- Name: tempo_k_tempo_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tempo_k_tempo_seq OWNED BY tempo.k_tempo;


--
-- TOC entry 199 (class 1259 OID 24703)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tipo_immatricolazione (
    k_tipo_immatricolazione integer NOT NULL,
    tipo_immatricolazione text
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24701)
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE; Schema: AVA; Owner: postgres
--

CREATE SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNER TO postgres;

--
-- TOC entry 2487 (class 0 OID 0)
-- Dependencies: 198
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE OWNED BY; Schema: AVA; Owner: postgres
--

ALTER SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNED BY tipo_immatricolazione.k_tipo_immatricolazione;


--
-- TOC entry 2328 (class 2604 OID 24695)
-- Name: k_anno_accademico; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN k_anno_accademico SET DEFAULT nextval('anno_accademico_k_anno_accademico_seq'::regclass);


--
-- TOC entry 2327 (class 2604 OID 24684)
-- Name: k_cds; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY cds ALTER COLUMN k_cds SET DEFAULT nextval('cds_k_cds_seq'::regclass);


--
-- TOC entry 2331 (class 2604 OID 24795)
-- Name: k_corso; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN k_corso SET DEFAULT nextval('corso_k_corso_seq'::regclass);


--
-- TOC entry 2326 (class 2604 OID 24661)
-- Name: k_studente; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN k_studente SET DEFAULT nextval('studente_k_studente_seq'::regclass);


--
-- TOC entry 2330 (class 2604 OID 24750)
-- Name: k_tempo; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo ALTER COLUMN k_tempo SET DEFAULT nextval('tempo_k_tempo_seq'::regclass);


--
-- TOC entry 2329 (class 2604 OID 24706)
-- Name: k_tipo_immatricolazione; Type: DEFAULT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN k_tipo_immatricolazione SET DEFAULT nextval('tipo_immatricolazione_k_tipo_immatricolazione_seq'::regclass);


--
-- TOC entry 2337 (class 2606 OID 24700)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (k_anno_accademico);


--
-- TOC entry 2335 (class 2606 OID 24689)
-- Name: cds_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY cds
    ADD CONSTRAINT cds_pkey PRIMARY KEY (k_cds);


--
-- TOC entry 2345 (class 2606 OID 24800)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (k_corso);


--
-- TOC entry 2347 (class 2606 OID 24808)
-- Name: esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_pkey PRIMARY KEY (k_corso, k_cds, k_anno_accademico, k_studente, k_tempo);


--
-- TOC entry 2343 (class 2606 OID 24763)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (k_studente, k_tipo_immatricolazione, k_tempo, k_anno_accademico, k_cds);


--
-- TOC entry 2349 (class 2606 OID 24841)
-- Name: lauree_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_pkey PRIMARY KEY (k_cds, k_anno_accademico, k_studente, k_tempo);


--
-- TOC entry 2333 (class 2606 OID 24666)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (k_studente);


--
-- TOC entry 2341 (class 2606 OID 24755)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (k_tempo);


--
-- TOC entry 2339 (class 2606 OID 24711)
-- Name: tipo_immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (k_tipo_immatricolazione);


--
-- TOC entry 2357 (class 2606 OID 24819)
-- Name: esami_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2356 (class 2606 OID 24814)
-- Name: esami_k_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_cds_fkey FOREIGN KEY (k_cds) REFERENCES cds(k_cds);


--
-- TOC entry 2355 (class 2606 OID 24809)
-- Name: esami_k_corso_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_corso_fkey FOREIGN KEY (k_corso) REFERENCES corso(k_corso);


--
-- TOC entry 2358 (class 2606 OID 24824)
-- Name: esami_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2359 (class 2606 OID 24829)
-- Name: esami_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 2350 (class 2606 OID 24764)
-- Name: ingressi_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2351 (class 2606 OID 24769)
-- Name: ingressi_k_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_cds_fkey FOREIGN KEY (k_cds) REFERENCES cds(k_cds);


--
-- TOC entry 2353 (class 2606 OID 24779)
-- Name: ingressi_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2352 (class 2606 OID 24774)
-- Name: ingressi_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


--
-- TOC entry 2354 (class 2606 OID 24784)
-- Name: ingressi_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione);


--
-- TOC entry 2361 (class 2606 OID 24847)
-- Name: lauree_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico);


--
-- TOC entry 2360 (class 2606 OID 24842)
-- Name: lauree_k_cds_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_cds_fkey FOREIGN KEY (k_cds) REFERENCES cds(k_cds);


--
-- TOC entry 2362 (class 2606 OID 24852)
-- Name: lauree_k_studente_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente);


--
-- TOC entry 2363 (class 2606 OID 24857)
-- Name: lauree_k_tempo_fkey; Type: FK CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_tempo_fkey FOREIGN KEY (k_tempo) REFERENCES tempo(k_tempo);


-- Completed on 2016-03-24 17:42:45 CET

--
-- PostgreSQL database dump complete
--

