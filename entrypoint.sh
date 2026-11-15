#!/bin/sh
set -eu
: "${UUID:?UUID env is required}"
: "${WS_PATH:?WS_PATH env is required}"
PORT="${PORT:-8080}"
sed -e "s|__UUID__|${UUID}|g" \
    -e "s|__PORT__|${PORT}|g" \
    -e "s|__WS_PATH__|${WS_PATH}|g" \
    /usr/local/etc/xray/config.template.json > /usr/local/etc/xray/config.json
exec xray run -config /usr/local/etc/xray/config.json
