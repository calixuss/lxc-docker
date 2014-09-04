FROM base/devel
RUN pacman -Syu base-devel php php-fpm php-sqlite openssl nginx php-intl php-mcrypt --noconfirm

#RUN chown -R http:http /srv/http
RUN curl -sSL https://download.owncloud.org/community/owncloud-7.0.1.tar.bz2 | tar jx 
