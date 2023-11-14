# Używamy obrazu bazowego z PHP 8.0 i Apache
FROM php:8.0-apache

# Instalujemy rozszerzenie mysqli i włączamy je
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Aktualizujemy i uaktualniamy system
RUN apt-get update && apt-get upgrade -y

# Włączamy moduł Apache2 mod_rewrite
RUN a2enmod rewrite

# Kopiujemy plik .htaccess do katalogu głównego serwera Apache
COPY .htaccess /var/www/html/

# Ustawiamy uprawnienia do pliku .htaccess
RUN chmod 644 /var/www/html/.htaccess