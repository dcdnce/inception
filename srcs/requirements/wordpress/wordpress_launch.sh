# Download wp-cli & path it as "wp"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp 

# Download and install wordpress
wp core download --allow-root

bash
