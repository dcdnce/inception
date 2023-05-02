FROM debian:buster

RUN apt update
RUN apt install -y \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./tools/mariadb_init.sh .
RUN chmod 777 ./mariadb_init.sh

ENTRYPOINT ./mariadb_init.sh
