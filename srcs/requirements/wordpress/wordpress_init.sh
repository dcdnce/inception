# Download wp-cli & path it as "wp"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 

if [ ! -f "wp-config.php" ]
then

# Download and install wordpress
wp core download --allow-root
wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_ADMIN --dbpass=$DB_PASS --allow-root

fi
