#!/bin/bash
# Creates an initial container for a database
# instance.

set -eu -o pipefail

if [[ $# < 1 ]]; then
    echo "error: not enough args, expecting at least 1!"
    exit 2
fi

container_name=`printf 'postgres0x%0 2x' ${1}`

CONTAINER_IMAGE=postgres:latest
CONTAINER_MOUNT_O1=type=bind,source=/mnt/postgres0x00,target=/var/lib/postgresql/data
CONTAINER_MOUNT_O2=type=bind,source=/etc/passwd,target=/etc/passwd

docker create --name $container_name \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=$POSTGRES_ADMIN_PASS \
    --mount $CONTAINER_MOUNT_O1 \
    --mount $CONTAINER_MOUNT_O2 \
    $CONTAINER_IMAGE
