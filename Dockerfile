FROM ubuntu:14.10

MAINTAINER Rob Haswell, me@robhaswell.co.uk

RUN apt-get -qq update
RUN apt-get -qqy upgrade

RUN apt-get install -qqy php5-fpm git
RUN git clone https://github.com/njam/github-salto

# Set up PHP-FPM
RUN sed -i 's@;daemonize = yes@daemonize = no@' /etc/php5/fpm/php-fpm.conf
RUN sed -i 's@;chroot =@chroot = /github-salto@' /etc/php5/fpm/pool.d/www.conf
RUN sed -i 's@listen = /var/run/php5-fpm.sock@listen = 8080@' /etc/php5/fpm/pool.d/www.conf

EXPOSE 8080
VOLUME /github-salto

CMD /usr/sbin/php5-fpm
