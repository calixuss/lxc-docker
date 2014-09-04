FROM ubuntu:14.04
RUN apt-get update \
&& apt-get upgrade -y
RUN apt-get install -y  curl nginx openssl php5-fpm php5 libapache2-mod-php5 php5-gd php5-json php5-mysql php5-sqlite php5-curl php5-gd php5-json php5-mysql php5-curl nano wget supervisor


RUN cd /var/www \
&& curl -sSL https://download.owncloud.org/community/owncloud-7.0.1.tar.bz2 | tar jx \
&& chown -R www-data:www-data /var/www/owncloud

RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10G/g' /etc/php5/fpm/php.ini \
&& sed -i 's/post_max_size = 8M/post_max_size = 10G/g' /etc/php5/fpm/php.ini
ADD supervisord.conf /etc/supervisord.conf
RUN mkdir /logs



RUN rm /etc/nginx/sites-available/default
ADD owncloud-nginx.conf /etc/nginx/sites-available/owncloud
ADD nginx.conf /etc/nginx/nginx.conf
RUN ln -s /etc/nginx/sites-available/owncloud /etc/nginx/sites-enabled/owncloud



VOLUME ["/var/www/owncloud/data", "/var/www/owncloud/config", "/var/www/owncloud/apps"]

ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c","/etc/supervisord.conf"]
