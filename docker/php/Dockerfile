FROM php:8.2-fpm

ENV PROJECT_ROOT /var/www
WORKDIR $PROJECT_ROOT

RUN apt-get update && apt-get install -y \
    curl \
    openssl \
    unzip \
    zip \
    git \
    cron \
    nano \
    mc \
    htop


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

RUN docker-php-ext-install session

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql pgsql pcntl

RUN pecl install redis && docker-php-ext-enable redis

RUN pecl install xdebug && docker-php-ext-enable xdebug

COPY . /var/www

# Add user for laravel application
RUN groupadd -g 1000 www && useradd -u 1000 -ms /bin/bash -g www www

# Change current user to www
USER www

#RUN chown www-data:www-data -R $PROJECT_ROOT/storage/framework/views
#RUN chown www-data:www-data -R /var/www/storage/logs


