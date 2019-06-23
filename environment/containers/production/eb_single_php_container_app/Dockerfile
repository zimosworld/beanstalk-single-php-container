FROM php:7.3-apache
MAINTAINER "Jonathan Zimros <john@zimosworld.com>"

# Add Apache config
ADD ./environment/containers/production/web-portal-api/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copy project files
COPY ./application /var/www/html/
# Update ownership of project files
RUN chown -R www-data: /var/www/html