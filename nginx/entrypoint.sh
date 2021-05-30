#!/usr/bin/env sh
set -eu

envsubst '${HOST_NAME} ${HOST_PORT} ${PROXY_HOST}' < /nginx.conf > /etc/nginx/conf.d/default.conf

exec "$@"