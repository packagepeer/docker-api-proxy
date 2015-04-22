FROM nginx:1.7
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# HowTo build: sudo docker build --tag=packagepeer/api-proxy .

# HowTo run: sudo docker run --link ...:api -e SERVER_NAME=... -e SERVER_ADMIN=... packagepeer/api-proxy

# ################################################################################ Setup
RUN rm /etc/nginx/conf.d/default.conf
ADD etc/nginx/conf.d/proxy-site.conf /etc/nginx/conf.d/proxy-site.conf

ADD pkgp-run.sh /pkgp-run.sh
RUN chmod u+x /pkgp-run.sh


# ################################################################################ Entry point
CMD ["/pkgp-run.sh"]
