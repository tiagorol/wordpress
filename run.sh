#!/bin/bash
set -e

mkdir /var/testwordpress

source /etc/apache2/envvars
exec apache2 -D FOREGROUND
