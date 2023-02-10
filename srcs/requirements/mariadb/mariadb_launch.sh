#!/bin/bash

# Initialize system tables (to manage privileges, roles, plugins...)
mysql_install_db --user=mysql --skip-test-db >> /dev/null

# Start mariadb
service mysql start

# MariaDB shenanigans
mysql -u root << _EOF_
USE mysql
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
CREATE USER 'admin'@'%' IDENTIFIED BY 'password';
CREATE DATABASE wordpress_db CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'admin'@'%';
FLUSH PRIVILEGES;
_EOF_

#exec mysqld --user=mysql --console
#bash
