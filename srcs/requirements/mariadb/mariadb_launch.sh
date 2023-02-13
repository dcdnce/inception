#!/bin/bash

# Remote client access
sed -i "s/.*bind-address.*=.*/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# Check if db exists
if [ -d "/var/lib/mysql/wordpress_db" ]
then
	echo "db already exists"
else

# Initialize system tables (to manage privileges, roles, plugins...)
mysql_install_db --user=mysql --skip-test-db >> /dev/null

# Start mariadb cli
service mysql start

# MariaDB shenanigans
mysql -u root << _EOF_
USE mysql
FLUSH PRIVILEGES;
CREATE USER 'ok'@'%' IDENTIFIED BY 'password';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
CREATE DATABASE wordpress_db CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'ok'@'%';
FLUSH PRIVILEGES;
_EOF_

fi

# Start mariadb daemon
exec mysqld --user=mysql --console
