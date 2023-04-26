FROM debian:buster

RUN	apt update
RUN	apt install -y nginx openssl

# Openssl config - creating key and certificate
RUN openssl req -x509 -newkey rsa:2048 -sha256 -nodes \
	-keyout /etc/nginx/pforesti.key \
	-out /etc/nginx/pforesti.crt \
	-subj "/C=FR/ST=Nice/L=Nice/O=42 Nice/OU=pforesti/CN=pforesti"

COPY ./nginx.conf /etc/nginx/sites-enabled/default

CMD ["nginx",  "-g", "daemon off;"]
