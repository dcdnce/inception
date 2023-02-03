FROM debian:buster

RUN	apt update
RUN	apt install -y nginx

COPY ./nginx.conf etc/nginx/conf.d/

EXPOSE 3000

CMD ["nginx",  "-g", "daemon off;"]
