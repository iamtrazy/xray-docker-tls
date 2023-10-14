#!/bin/sh
nohup /usr/bin/xray run -c /etc/xray/config.json &>/dev/null &
nohup caddy run --config /etc/caddy/Caddyfile --adapter caddyfile