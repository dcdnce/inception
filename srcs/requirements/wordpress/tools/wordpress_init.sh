#!/bin/bash

# Waiting for mariadb container
while ! mysqladmin ping -h$DB_HOST -u$DB_USER -p$DB_USER_PASS --silent; do
	echo "waiting fo mariadb..."
	sleep 3
done

if [ ! -f "wp-config.php" ];
then
	# Download wp-cli & path it as "wp"
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp 

	# Download and install wordpress
	wp core download --allow-root
	wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS --allow-root
	wp core install --url=$WP_URL/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root
fi

# Launch php-fpm -foreground
php-fpm7.3 -F
