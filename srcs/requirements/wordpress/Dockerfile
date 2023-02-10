FROM debian:buster

RUN apt update
RUN apt install -y \
	curl \
	wget \
	php \
	#fastcgi server
	php-fpm \ 
	#wordpress default db
	php-mysql \
	#images and miniatures
	php-gd \
	#xml, themes and plugins
	php-xml \
	#curl, http request etc.
	php-curl \
	&& rm -rf /var/lib/apt/lists/*



# installing wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

EXPOSE 9000

CMD ["bash"]
