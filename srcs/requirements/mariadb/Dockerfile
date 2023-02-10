FROM debian:buster

RUN apt update
RUN apt install -y \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

COPY mariadb_launch.sh .

EXPOSE 3306

ENTRYPOINT ./mariadb_launch.sh
