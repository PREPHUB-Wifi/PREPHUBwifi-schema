#!/bin/bash
set -e 

psql -v --username "$POSTGRES_USER" < /usr/src/app/prephubwifi.schema.sql;
