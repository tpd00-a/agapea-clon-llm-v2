FROM php:8.2-apache

# Extensiones necesarias para Laravel + PostgreSQL + MySQL
RUN apt-get update && apt-get install -y \
    libpq-dev libzip-dev zip unzip git dos2unix \
    && docker-php-ext-install pdo pdo_pgsql pdo_mysql zip \
    && apt-get clean

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copiar código del proyecto
COPY . .

# Instalar dependencias PHP (sin devDependencies)
RUN composer install --optimize-autoloader

# Apuntar Apache al directorio public/ de Laravel
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|' \
    /etc/apache2/sites-available/000-default.conf

# Permitir .htaccess (necesario para el router de Laravel)
RUN echo '<Directory /var/www/html/public>\n    AllowOverride All\n    Require all granted\n</Directory>' \
    >> /etc/apache2/sites-available/000-default.conf

# Activar mod_rewrite
RUN a2enmod rewrite

# Permisos de escritura para Laravel
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Script de arranque
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN dos2unix /usr/local/bin/docker-entrypoint.sh && chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
