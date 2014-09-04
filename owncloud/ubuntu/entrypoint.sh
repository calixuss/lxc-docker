#!/bin/bash
set -e
SUBJECT="/C=NO/ST=Ostfold/L=HALDEN/O=AT/OU=OU/CN=ATEMU.com"
echo $SUBJECT
openssl req -new -x509 -days 3650 -nodes -out server.pem -keyout server.key -subj "$SUBJECT"
cp -f server.* /opt/

#sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10G/g' /etc/php5/fpm/php.ini
#sed -i 's/post_max_size = 8M/post_max_size = 10G/g' /etc/php5/fpm/php.ini

chown -R www-data:www-data /var/www/owncloud
chmod -R 777  /logs
exec "$@"
