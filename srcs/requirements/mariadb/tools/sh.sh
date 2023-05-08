#!/bin/bash


service mysql start 

sleep 2
if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then

    touch newuser.sql
    echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME ;" > newuser.sql
    echo "CREATE USER IF NOT EXISTS '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PASS' ;" >> newuser.sql
    echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%' ;" >> newuser.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY $ROOT_NEW_PASS ;" >> newuser.sql
    echo "FLUSH PRIVILEGES;" >> newuser.sql
    mysql < newuser.sql

fi

sed -i 's/127\.0\.0\.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

kill $(cat /var/run/mysqld/mysqld.pid)

sleep 2

mysqld