#!/usr/bin/env bash

# Build PWA plugin from source
( cd pwa && composer install && npm install && npm run build )

# Configure WordPress
docker exec wp-avorg-dev_wordpress_1 wp core install \
	--url=localhost:8000 \
	--title=AudioVerse \
	--admin_user=wordpress \
	--admin_password=wordpress \
	--admin_email=admin@example.com

# Activate WordPress plugins
docker exec wp-avorg-dev_wordpress_1 wp plugin activate wp-avorg-plugin pwa

# In the future, set this based on a "dev" flag passed to setup.sh
# https://stackoverflow.com/questions/14447406/bash-shell-script-check-for-a-flag-and-grab-its-value
docker exec wp-avorg-dev_wordpress_1 wp config set WP_DEBUG true --raw
