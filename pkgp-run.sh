#!/bin/bash


sed -i "s/%%%SERVER_NAME%%%/${SERVER_NAME}/g" /etc/nginx/conf.d/site_proxy.conf
sed -i "s/%%%SERVER_ADMIN%%%/${SERVER_ADMIN}/g" /etc/nginx/conf.d/site_proxy.conf


exec nginx -g "daemon off;"
