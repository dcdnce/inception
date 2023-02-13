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

# download wp-cli &  path it as "wp"
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp 

CMD bash
