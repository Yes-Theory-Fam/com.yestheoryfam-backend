FROM postgres:13.0

RUN mkdir -p /docker-entrypoint-initdb.d
COPY seed.sql /docker-entrypoint-initdb.d/

RUN echo "echo host all all 0.0.0.0/0 trust >> /var/lib/postgresql/data/pg_hba.conf" > /docker-entrypoint-initdb.d/test.sh
RUN chmod +x /docker-entrypoint-initdb.d/test.sh
