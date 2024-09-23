FROM ubuntu AS builder
RUN apt update && apt upgrade -y && apt install -y curl wget less 
WORKDIR /app
RUN wget https://github.com/glpi-project/glpi/releases/download/10.0.16/glpi-10.0.16.tgz
RUN tar -xvzf glpi-10.0.16.tgz

FROM php:8-apache
RUN apt update && apt install -y libicu-dev zlib1g-dev libzip-dev \
  unzip zip libpng-dev

RUN docker-php-ext-install intl
RUN docker-php-ext-install mysqli pdo pdo_mysql gd \
  && docker-php-ext-enable pdo_mysql gd

WORKDIR /var/www/html
COPY --from=builder /app/glpi /var/www/html
RUN chmod -R 777 /var/www/html
RUN a2enmod rewrite
EXPOSE 80
CMD ["apache2-foreground"]
