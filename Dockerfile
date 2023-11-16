FROM php:8.2-apache

RUN apt-get update

RUN docker-php-ext-install mysqli pdo pdo_mysql

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd xdebug opcache pdo pdo_mysql mysqli && rm -f /var/lib/apt/lists/*


# RUN apt-get install -y \
# 		libfreetype-dev \
# 		libjpeg62-turbo-dev \
# 		libpng-dev \
# 	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
# 	&& docker-php-ext-install -j$(nproc) gd

# RUN pecl install redis-5.3.7 \
# 	&& pecl install xdebug-3.2.1 \
# 	&& docker-php-ext-enable redis xdebug

# RUN apt-get install -y libmemcached-dev libssl-dev zlib1g-dev \
# 	&& pecl install memcached-3.2.0 \
# 	&& docker-php-ext-enable memcached



COPY backup/ /var/www/html/
COPY www/ /var/www/html/

RUN chmod 777 -R /var
