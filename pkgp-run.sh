#!/bin/bash

rm /etc/nginx/sites-enabled/default

sed -i "s/%%%WEBAPP_PATH_IN_TOMCAT%%%/$(WEBAPP_PATH_IN_TOMCAT)/g" /etc/nginx/sites-enabled/proxy

exec nginx
