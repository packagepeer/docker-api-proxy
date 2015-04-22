#!/bin/bash


sed -i "s/%%%SERVER_NAME%%%/${SERVER_NAME}/g" /etc/apache2/sites-enabled/proxy
sed -i "s/%%%SERVER_ADMIN%%%/${SERVER_ADMIN}/g" /etc/apache2/sites-enabled/proxy


rm -f ${APACHE_PID_FILE}
source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND
