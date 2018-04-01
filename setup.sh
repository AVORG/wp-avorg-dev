#!/usr/bin/env bash

git clone https://github.com/AVORG/wp-avorg-plugin.git

docker exec wpavorgdev_wordpress_1 wp core install \
	--url=localhost:8000 \
	--title=AudioVerse \
	--admin_user=wordpress \
	--admin_password=wordpress \
	--admin_email=admin@example.com

docker exec wpavorgdev_wordpress_1 wp plugin activate wp-avorg-plugin