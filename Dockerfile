FROM nginx:1.7
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# HowTo build: sudo docker build --tag=packagepeer/api-proxy .

# HowTo run: sudo docker run --link ...:api -e SERVER_NAME=... -e SERVER_ADMIN=... packagepeer/api-proxy

# ################################################################################ Setup
ADD etc/nginx/sites-enabled/proxy /etc/nginx/sites-enabled/proxy

ADD pkgp-run.sh /pkgp-run.sh
RUN chmod u+x /pkgp-run.sh


# ################################################################################ Entry point
CMD ["/pkgp-run.sh"]
