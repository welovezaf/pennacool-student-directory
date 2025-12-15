# Simple PHP + Apache image for the intern exercise
FROM php:8.2-apache

# Install PHP extensions needed for MySQL
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Enable Apache mod_rewrite (not strictly required, but commonly used)
RUN a2enmod rewrite

# Set the working directory to the Apache document root
WORKDIR /var/www/html

# Optional: copy any existing app files into the image
# (In this exercise, docker-compose also mounts ./app as a volume,
# so candidates will mostly work from the host filesystem.)
COPY ./app /var/www/html

# Optional: turn on basic error display for development
# (Safe enough for a local exercise; NOT for production.)
RUN { \
    echo 'display_errors=On'; \
    echo 'display_startup_errors=On'; \
    echo 'error_reporting=E_ALL'; \
} > /usr/local/etc/php/conf.d/dev.ini
