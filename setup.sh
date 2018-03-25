#!/usr/bin/env bash

git clone https://github.com/AVORG/wp-avorg

docker exec wpavorg_wordpress_1 wp core install \
	--url=localhost:8000 \
	--title=AudioVerse \
	--admin_user=wordpress \
	--admin_password=wordpress \
	--admin_email=admin@example.com