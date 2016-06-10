FROM postgres:9.4
MAINTAINER Justin Holguin <justin.holguin@puppet.com>

COPY init.sql /docker-entrypoint-initdb.d/init.sql

RUN apt-get update && apt-get install -y wget gnupg
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
       apt-key add - \
  && echo "deb [arch=amd64] http://packages.2ndquadrant.com/pglogical/apt/ jessie-2ndquadrant main" > /etc/apt/sources.list.d/2ndquadrant.list \
  && wget --quiet -O - http://packages.2ndquadrant.com/pglogical/apt/AA7A6805.asc | apt-key add - \
  && apt-get update \
  && apt-get install -y postgresql-9.4-pglogical postgresql-9.4-pglogical-output \
  && echo "host    all                  all                     0.0.0.0/0       md5" >> /var/lib/postgresql/data/pg_hba.conf \
  && echo "shared_preload_libraries = 'pglogical'" >> /var/lib/postgresql/data/postgresql.conf
