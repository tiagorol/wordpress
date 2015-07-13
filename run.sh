#!/bin/bash
set -e

sed -i "s/HOST_MYSQL/$DB_HOST/" /var/www/html/wp-config.php

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
