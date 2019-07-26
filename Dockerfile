FROM wordpress:latest

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& rm -rf /tmp/pear/

# Install NPM for use in CircleCI
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs
