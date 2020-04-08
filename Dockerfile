FROM alpine
MAINTAINER ldos

RUN addgroup -g 1000 -S www
RUN adduser www -D -G www -u 1001 -s /bin/sh

RUN apk --update add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-curl php7-ctype php7-redis

RUN mkdir /usr/local/src
ADD php7.sh /usr/local/src


WORKDIR /usr/local/src
RUN chmod 755 ./php7.sh
RUN ./php7.sh

#VOLUME ["/sys/fs/cgroup"]

EXPOSE 9000
CMD ["/usr/sbin/php-fpm7","-F"]
