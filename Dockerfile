FROM php:8.2-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
 && docker-php-ext-install curl \
 && a2enmod rewrite headers \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html
COPY index.php style.css app.js api.php access_lib.php admin.php /var/www/html/
COPY data /var/www/html/data

RUN mkdir -p /var/www/html/data \
 && chmod -R 775 /var/www/html/data \
 && chown -R www-data:www-data /var/www/html

RUN printf '%s\n' \
  'DirectoryIndex index.php' \
  'RewriteEngine On' \
  'RewriteRule ^(api|admin)\.php$ - [L]' \
  'RewriteCond %{REQUEST_FILENAME} !-f' \
  'RewriteCond %{REQUEST_FILENAME} !-d' \
  'RewriteRule ^ index.php [L]' \
  > /var/www/html/.htaccess

EXPOSE 80
