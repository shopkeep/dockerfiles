--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Name: v1_transacted_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE v1_transacted_items (
    client_uuid character varying(255) NOT NULL,
    transaction_uuid character varying(255) NOT NULL,
    transaction_type character varying(255) NOT NULL,
    quantity double precision DEFAULT 0.0 NOT NULL,
    price numeric(12,2) DEFAULT 0.0 NOT NULL,
    discount numeric(12,2) DEFAULT 0.0 NOT NULL,
    tax numeric(12,2) DEFAULT 0.0 NOT NULL,
    item_uuid character varying(255) NOT NULL,
    sold_at timestamp without time zone NOT NULL,
    shift_uuid character varying(255),
    register_uuid character varying(255),
    department_uuid character varying(255),
    category_uuid character varying(255),
    customer_uuid character varying(255),
    employee_uuid character varying(255),
    sequence_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE v1_transacted_items OWNER TO postgres;

--
-- Name: v1_transacted_tenders; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE v1_transacted_tenders (
    client_uuid character varying(255) NOT NULL,
    transaction_uuid character varying(255) NOT NULL,
    transaction_type character varying(255) NOT NULL,
    sold_at timestamp without time zone NOT NULL,
    transacted_tender_uuid character varying(255) NOT NULL,
    tender_uuid character varying(255),
    shift_uuid character varying(255),
    register_uuid character varying(255),
    employee_uuid character varying(255),
    customer_uuid character varying(255),
    known_customer boolean,
    total_due numeric(12,2) DEFAULT 0.0 NOT NULL,
    cash_returned numeric(12,2) DEFAULT 0.0,
    gratuity numeric(12,2) DEFAULT 0.0
);


ALTER TABLE v1_transacted_tenders OWNER TO postgres;

--
-- Name: v2_modifications_summaries; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE v2_modifications_summaries (
    organization_id character varying(255) NOT NULL,
    location_id character varying(255) NOT NULL,
    operator_id character varying(255) NOT NULL,
    workstation_id character varying(255) NOT NULL,
    session_id character varying(255) NOT NULL,
    operation_type character varying(255) NOT NULL,
    operation_date timestamp without time zone NOT NULL,
    line_item_reference_id character varying(255) NOT NULL,
    line_item_quantity double precision NOT NULL,
    modification_id character varying(255) NOT NULL,
    modification_reference_id character varying(255) NOT NULL,
    modification_unit_cost integer NOT NULL,
    modification_unit_price integer NOT NULL
);


ALTER TABLE v2_modifications_summaries OWNER TO postgres;

--
-- Name: v2_operation_summaries; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE v2_operation_summaries (
    organization_id character varying(255) NOT NULL,
    transaction_id character varying(255) NOT NULL,
    location_id character varying(255) NOT NULL,
    operator_id character varying(255) NOT NULL,
    session_id character varying(255) NOT NULL,
    workstation_id character varying(255) NOT NULL,
    customer_id character varying(255),
    operation_type character varying(255) NOT NULL,
    operation_date timestamp without time zone NOT NULL,
    subtotal integer NOT NULL,
    discount_amount integer NOT NULL,
    tax_amount integer NOT NULL,
    total_due integer NOT NULL,
    tip_amount integer NOT NULL,
    tendered_amount integer NOT NULL,
    cost_amount integer NOT NULL,
    net_subtotal integer NOT NULL,
    operation_id character varying(255) NOT NULL
);


ALTER TABLE v2_operation_summaries OWNER TO postgres;

--
-- Name: v2_reorder_reports; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE v2_reorder_reports (
    line_item_id character varying(255) NOT NULL,
    organization_id character varying(255) NOT NULL,
    line_item_reference_id character varying(255) NOT NULL,
    operation_date timestamp without time zone NOT NULL
);


ALTER TABLE v2_reorder_reports OWNER TO postgres;

--
-- Name: v2_tender_summaries; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE v2_tender_summaries (
    organization_id character varying(255) NOT NULL,
    location_id character varying(255) NOT NULL,
    operation_type character varying(255) NOT NULL,
    operation_date timestamp without time zone NOT NULL,
    reference_id character varying(255) NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    parent_reference_id character varying(255)
);


ALTER TABLE v2_tender_summaries OWNER TO postgres;

--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

