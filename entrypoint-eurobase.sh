#!/bin/sh
set -eu
: "${UUID:?UUID env is required}"
: "${WS_PATH:?WS_PATH env is required}"
NGINX_PORT="${PORT:-8080}"
XRAY_PORT=10000

sed -e "s|__UUID__|${UUID}|g" \
    -e "s|__PORT__|${XRAY_PORT}|g" \
    -e "s|__WS_PATH__|${WS_PATH}|g" \
    /usr/local/etc/xray/config.template.json > /usr/local/etc/xray/config.json

sed -e "s|__NGINX_PORT__|${NGINX_PORT}|g" \
    -e "s|__WS_PATH__|${WS_PATH}|g" \
    /usr/local/etc/nginx/nginx.conf.template > /tmp/nginx.conf

/usr/local/bin/xray run -config /usr/local/etc/xray/config.json &
exec nginx -c /tmp/nginx.conf -g "daemon off;"
