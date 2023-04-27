#!/bin/bash
# Check if db exists
if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "db already exists"
else

# Remote client access
sed -i "s/.*bind-address.*=.*/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# Initialize system tables (to manage privileges, roles, plugins...)
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --skip-test-db >> /dev/null

# MariaDB shenanigans - db, user, and root
mysqld -u mysql --bootstrap << _EOF_
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';
CREATE DATABASE $DB_NAME CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
_EOF_

fi

# Start mariadb daemon - logging output to console
exec mysqld --user=mysql --console
