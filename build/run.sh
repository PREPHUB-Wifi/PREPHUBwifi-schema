#!/usr/bin/env bash
# Config
PGHOST=${PGHOST:-'localhost'}
PGUSER=${PGUSER:-'postgres'}
PGDATABASE=${DATABASE:-'prephubwifi'}
COUNTRY=${COUNTRY:-'US'}

# Create Database
# Build command
BUILD="CREATE DATABASE \"$PGDATABASE\" WITH OWNER = \"$PGUSER\" ENCODING = 'UTF8' TABLESPACE = pg_default LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' CONNECTION LIMIT = -1;"

psql -h $PGHOST -U $PGUSER -d postgres -T template0 -c """$BUILD"""

# Load schema
psql -h $PGHOST -U $PGUSER -d $PGDATABASE -f ./schema/prephubwifi/prephubwifi.schema.sql
