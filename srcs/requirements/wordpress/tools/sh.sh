#!/bin/bash

sleep 2

if [ ! -f "/var/www/html/wp-config.php" ]; then

    wp core download --path="/var/www/html" --allow-root
    wp config create --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_PASS --dbhost=$DATABASE_HOST  --path="/var/www/html" --allow-root
    wp core install --url=$DOMAIN_NAME/ --title=messalih --admin_user=$DATABASE_USER --admin_password=$DATABASE_PASS --admin_email=messalih@gmail.com --skip-email  --path="/var/www/html" --allow-root
    wp user create newuser messalih111@gmail.com --role=author --user_pass=pass  --path="/var/www/html" --allow-root
fi

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -d "/run/php" ]; then
    mkdir run/php
fi

/usr/sbin/php-fpm7.3 -F 