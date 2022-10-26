FROM php:8.1-apache-buster

RUN apt-get update -y
RUN apt-get install -y libicu-dev git libbz2-1.0 libbz2-dev libssl-dev libzip-dev curl
RUN apt-get install -y libjpeg-dev libfreetype6-dev libpng-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y libpq-dev
RUN docker-php-ext-install bz2 intl
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN docker-php-ext-install phar
RUN docker-php-ext-install xsl

RUN php -r "readfile('http://getcomposer.org/installer');" \
    | php -- --install-dir=/usr/bin/ --filename=composer

RUN ln -fs /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN printenv | sed 's/^\([a-zA-Z0-9_]*\)=\(.*\)$/export \1='"'"'\2'"'"'/g' > /root/env.sh
RUN chmod a+x /root/env.sh

ADD entrypoint.sh /entrypoint.sh
ADD codecept /usr/local/sbin
ENTRYPOINT /entrypoint.sh
