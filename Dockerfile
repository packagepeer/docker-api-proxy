FROM ubuntu:14.04
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# ################################################################################ Setup
RUN \
  apt-get update && \
  apt-get install -y nginx-core  && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

WORKDIR /etc/nginx

RUN mkdir -p /var/log/nginx/

RUN rm /etc/nginx/sites-enabled/default
ADD etc/nginx/sites-enabled/proxy /etc/nginx/sites-enabled/proxy

ADD auxiliary_functions.sh /auxiliary_functions.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

EXPOSE 80

# ################################################################################ Entry point
CMD ["/entrypoint.sh"]
