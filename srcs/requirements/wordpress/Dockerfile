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
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

# Needed for php-fpm to work + conf file
RUN mkdir -p /run/php/
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY wordpress_init.sh .
RUN chmod 777 ./wordpress_init.sh

ENTRYPOINT ./wordpress_init.sh 
