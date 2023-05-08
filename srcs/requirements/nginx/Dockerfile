FROM debian:buster

RUN apt-get -y update && apt-get -y install nginx

RUN apt-get update &&  apt-get install -y openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/private_key.key -out /etc/ssl/certs/certificate.crt -subj "/C=US/L=CR/"
 
COPY conf/nginx.conf /etc/nginx/conf.d/
 
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]