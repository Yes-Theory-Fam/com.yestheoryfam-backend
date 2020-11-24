FROM postgres:13.0

RUN mkdir -p /docker-entrypoint-initdb.d
COPY seed.sql /docker-entrypoint-initdb.d/
