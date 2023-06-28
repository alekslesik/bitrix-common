FROM php:7.4-apache

RUN apt-get update

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd xdebug opcache pdo pdo_mysql mysqli && rm -f /var/lib/apt/lists/*

WORKDIR /var/www/html/

COPY www/* ./

RUN chmod 777 -R ../html
