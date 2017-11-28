CREATE DATABASE prephubwifi WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';

\connect prephubwifi


CREATE SCHEMA prephubwifi;

-- All Reports Table
-- Create Table to store reports
CREATE TABLE prephubwifi.all_reports
(
  pkey bigserial NOT NULL,
  database_time timestamp with time zone DEFAULT now(),
  time bigint,
  newName character varying NOT NULL,
  needHelp character varying NOT NULL,
  notes character varying NOT NULL,
  source character varying NOT NULL,
  status character varying DEFAULT 'confirmed',
  lang character varying,
  tags json,
  CONSTRAINT all_reports_pkey PRIMARY KEY (pkey)
);
