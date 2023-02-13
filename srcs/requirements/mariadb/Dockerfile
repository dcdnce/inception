FROM debian:buster

RUN apt update
RUN apt install -y \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY mariadb_launch.sh .

ENTRYPOINT ./mariadb_launch.sh

# Launches mysql daemon
#CMD ["mysqld", "--bind-adress=0.0.0.0"]
