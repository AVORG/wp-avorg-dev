#!/usr/bin/env bash

CONTAINER="wp-avorg-dev_wordpress_1"

if [ $# -eq 0 ]
then
	echo "Type exit to leave"
	docker exec -it ${CONTAINER} /bin/bash
	exit
fi

docker run -it -u 33 --rm \
    --volumes-from ${CONTAINER} \
    --network container:${CONTAINER} \
    wordpress:cli "$@"