#!/usr/bin/env bash

apt-get -y install apache2

chown -R ubuntu:www-data /var/www/html/
chmod -R 770 /var/www/html/

# MySQL
apt-get -y install mysql-server php5-mysql

# Django
pip install Django