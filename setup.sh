#!/usr/bin/env bash

set -x

# Build PWA plugin from source
docker run -it --rm --volume "$PWD/pwa":/app composer install
docker-compose run --rm \
  -v "$PWD":/temp \
  -w /temp/pwa \
  wordpress /bin/bash -c 'source ~/.profile && npm install && npm run build'

# Install wp-avorg-plugin dependencies
docker run -it --rm --volume "$PWD/wp-avorg-plugin":/app composer install
docker-compose run --rm \
  -v "$PWD":/temp \
  -w /temp/wp-avorg-plugin \
  wordpress /bin/bash -c 'source ~/.profile && npm install && npm run build'

./wp.sh core install \
	--url=localhost:8000 \
	--title=AudioVerse \
	--admin_user=wordpress \
	--admin_password=wordpress \
	--admin_email=admin@example.com

./wp.sh plugin activate wp-avorg-plugin pwa
# The following plugin is deactivated because it seems to sets display_errors to 0
#./wp.sh plugin install query-monitor --activate
./wp.sh config set WP_DEBUG true --raw
./wp.sh config set WP_DEBUG_LOG true --raw
./wp.sh config set WP_DEBUG_DISPLAY true --raw
./wp.sh config set SCRIPT_DEBUG true --raw
./wp.sh config set FS_METHOD direct
./wp.sh rewrite structure '/%postname%/'

docker exec wp-avorg-dev_wordpress_1 /bin/bash -c "chown -R www-data:www-data /var/www/html/wp-content"
