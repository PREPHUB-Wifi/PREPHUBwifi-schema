#FROM kartoza/postgis:9.5-2.2
FROM mdillon/postgis:9.6

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV ALLOW_IP_RANGE '0.0.0.0/0'

COPY schema/prephubwifi/prephubwifi.schema.sql /usr/src/app
COPY build/run.sh /usr/src/app

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./loadData.sh /docker-entrypoint-initdb.d
