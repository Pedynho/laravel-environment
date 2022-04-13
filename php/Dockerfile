FROM php:7.4.28-fpm-buster

RUN apt-get update
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
RUN apt-get update && \
    apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

# Microsoft SQL Server Prerequisites
RUN apt-get update
RUN apt-get install -y odbcinst1debian2 gnupg2 libodbc1 libonig-dev
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        unixodbc-dev \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/9/prod.list \
        > /etc/apt/sources.list.d/mssql-release.list 
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y --no-install-recommends \
        msodbcsql17 \
        locales \
        apt-transport-https \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen
RUN apt-get update
RUN docker-php-ext-install mbstring pdo pdo_mysql \
    && pecl install sqlsrv pdo_sqlsrv xdebug \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv xdebug

COPY --from=composer:2.0.8 /usr/bin/composer /usr/bin/composer

EXPOSE 9000