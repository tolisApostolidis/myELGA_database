FROM mysql:8.4

COPY myelga_dump.sql /docker-entrypoint-initdb.d/01-myelga_dump.sql