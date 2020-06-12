FROM alpine 
# php:fpm-alpine3.12

RUN apk add php php-fpm bash curl \
php-bcmath php-ctype php-fileinfo php-json php-mbstring php-openssl php-pdo php-tokenizer php-xml \
php-curl php-zip php-gd php-intl php-opcache php-phar \
php7-mcrypt php-sodium \
php-pgsql

ADD https://raw.githubusercontent.com/JonnyRodriguez/php-fpm-alpine/master/mongodb.so /usr/lib/php7/modules

RUN echo "extension=mongodb.so" > /etc/php7/conf.d/mongodb.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

EXPOSE 9000

CMD ["php-fpm7","-OF"]

