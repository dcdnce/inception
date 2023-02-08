FROM debian:buster

RUN apt update
RUN apt install -y \
	curl \
	wget \
	php \
	php-fpm \
	php-mysql \
	&& rm -rf /var/lib/apt/lists/*

# installing wordpress latest
#RUN wget http://wordpress.org/latest.tar.gz && \
#	tar xfz latest.tar.gz && \
#	mv wordpress/* . && \
#	rm -rf latest.tar.gz wordpress/
# installing wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

EXPOSE: 9000

CMD ["bash"]
