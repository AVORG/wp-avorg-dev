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
