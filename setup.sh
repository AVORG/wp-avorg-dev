#!/usr/bin/env bash

# Build PWA plugin from source
( cd pwa && composer install && npm install && npm run build )

./wp.sh core install \
	--url=localhost:8000 \
	--title=AudioVerse \
	--admin_user=wordpress \
	--admin_password=wordpress \
	--admin_email=admin@example.com

./wp.sh plugin activate wp-avorg-plugin pwa
./wp.sh config set WP_DEBUG true --raw
./wp.sh config set SCRIPT_DEBUG true --raw
./wp.sh config set FS_METHOD direct

docker exec wp-avorg-dev_wordpress_1 /bin/bash -c "chown -R www-data:www-data /var/www/html/wp-content"
