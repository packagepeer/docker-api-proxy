#!/bin/bash


sed -i "s/%%%SERVER_NAME%%%/${SERVER_NAME}/g" /etc/nginx/sites-enabled/proxy
sed -i "s/%%%SERVER_ADMIN%%%/${SERVER_ADMIN}/g" /etc/nginx/sites-enabled/proxy


exec nginx -g "daemon off;"
