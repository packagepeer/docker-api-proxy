FROM ubuntu:14.04
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# HowTo build: sudo docker build --tag=packagepeer/api-proxy .

# HowTo run: sudo docker run --link ...:api -e SERVER_NAME=... -e SERVER_ADMIN=... packagepeer/api-proxy

# ################################################################################ Setup
RUN apt-get update && apt-get install -yq apache2

RUN mkdir -p /var/lock/apache2 /var/run/apache2
RUN a2enmod proxy_http
RUN a2dissite 000-default

ADD etc/apache2/sites-enabled/proxy /etc/apache2/sites-enabled/proxy


ADD pkgp-run.sh /pkgp-run.sh
RUN chmod u+x /pkgp-run.sh


# ################################################################################ Entry point
CMD ["/pkgp-run.sh"]
