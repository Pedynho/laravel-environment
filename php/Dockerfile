FROM php:7.4.28-fpm
RUN apt-get update
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip
RUN docker-php-ext-install zip
RUN docker-php-ext-install bcmath pdo_mysql
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
RUN apt-get update
RUN apt-get update && \
    apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

COPY --from=composer:2.0.8 /usr/bin/composer /usr/bin/composer

EXPOSE 9000