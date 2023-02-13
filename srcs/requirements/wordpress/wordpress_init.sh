if [ ! -f "wp-config.php" ]; then
	service mysql start

	# Download wp-cli & path it as "wp"
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp 

	# Download and install wordpress
	wp core download --allow-root
	wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_ADMIN --dbpass=$DB_PASS --allow-root
	wp core install --url=https://$WP_URL/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_PASS --admin_email=$WP_EMAIL --skip-email --allow-root
fi

# Launch php-fpm -root -foreground
#php-fpm -RF
