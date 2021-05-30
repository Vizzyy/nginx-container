#!/usr/bin/env sh
set -eu

envsubst '${HOST_NAME} ${HOST_PORT}' < /nginx.conf > /etc/nginx/conf.d/default.conf

exec "$@"