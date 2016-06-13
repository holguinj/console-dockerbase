CREATE USER "activity_test" PASSWORD 'activity_test';
CREATE DATABASE "activity_test" OWNER "activity_test" ENCODING 'utf8' LC_CTYPE 'en_US.utf8' LC_COLLATE 'en_US.utf8' template template0;

CREATE USER perbac WITH PASSWORD 'foobar';
CREATE DATABASE perbac;
GRANT ALL ON DATABASE perbac TO perbac;

\c perbac;
CREATE EXTENSION IF NOT EXISTS citext;

CREATE USER "pe-classifier" PASSWORD 'pe-classifier';
CREATE DATABASE "pe-classifier" OWNER "pe-classifier" ENCODING 'utf8' LC_CTYPE 'en_US.utf8' LC_COLLATE 'en_US.utf8' template template0;

CREATE USER activity PASSWORD 'activity';
CREATE DATABASE activity OWNER activity ENCODING 'utf8' LC_CTYPE 'en_US.utf8' LC_COLLATE 'en_US.utf8' template template0;

CREATE DATABASE perbac_test;
GRANT ALL ON DATABASE perbac_test TO perbac;
\c perbac_test;
CREATE EXTENSION IF NOT EXISTS citext;
