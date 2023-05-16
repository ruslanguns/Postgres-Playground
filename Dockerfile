FROM postgres

RUN apt-get update && apt-get install -y postgresql-contrib

RUN echo "shared_preload_libraries = 'pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample

RUN pg_ctlcluster 13 main start && \
    psql --command "CREATE EXTENSION pg_cron;" && \
    pg_ctlcluster 13 main stop
