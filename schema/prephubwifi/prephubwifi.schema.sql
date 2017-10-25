CREATE SCHEMA prephubwifi;

-- Spatial extensions
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;

-- All Reports Table
-- Create Table to store reports
CREATE TABLE prephubwifi.all_reports
(
  pkey bigserial NOT NULL,
  fkey bigint NOT NULL,
  database_time timestamp with time zone DEFAULT now(),
  created_at timestamp with time zone,
  name character varying NOT NULL,
  notes character varying NOT NULL,
  source character varying NOT NULL,
  status character varying DEFAULT 'confirmed',
  lang character varying,
  tags json,
  CONSTRAINT all_reports_pkey PRIMARY KEY (pkey)
);

-- Add Geometry column to all_reports
SELECT AddGeometryColumn ('prephubwifi','all_reports','the_geom',4326,'POINT',2);
ALTER TABLE prephubwifi.all_reports ALTER COLUMN the_geom SET NOT NULL;

-- Add GIST spatial index
CREATE INDEX gix_all_reports ON prephubwifi.all_reports USING gist (the_geom);
