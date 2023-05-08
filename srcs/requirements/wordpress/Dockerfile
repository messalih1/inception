FROM debian:buster

RUN apt-get update &&  apt install -y php php-fpm && apt-get install -y curl &&  apt-get install -y mariadb-server && apt-get install -y php-mysql 

COPY ./tools/sh.sh /
RUN chmod +x sh.sh
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
CMD [ "./sh.sh" ]