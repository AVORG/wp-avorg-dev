FROM wordpress:latest

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& rm -rf /tmp/pear/
