FROM wordpress:latest

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& rm -rf /tmp/pear/

# Install NVM, Node, NPM dependencies
RUN apt-get update && \
    apt-get install -y build-essential libssl-dev git

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Install Node
RUN /bin/bash -c "source ~/.profile && nvm install v10.16.3 && nvm use v10.16.3"

# Xdebug profiling
RUN mkdir /temp/profiledir
RUN chown www-data:www-data /temp/profiledir