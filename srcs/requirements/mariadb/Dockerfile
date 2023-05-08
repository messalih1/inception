FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server
COPY ./tools/sh.sh /
RUN chmod +x sh.sh
CMD [ "./sh.sh" ]