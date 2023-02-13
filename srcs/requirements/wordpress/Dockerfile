FROM debian:buster

RUN apt update
RUN apt install -y \
	curl \
	wget \
	php \
	php-fpm \ 
	php-mysql \
	php-gd \
	php-xml \
	php-curl \
	&& rm -rf /var/lib/apt/lists/*

COPY ./wordpress_launch.sh .

ENTRYPOINT ./wordpress_launch.sh 
