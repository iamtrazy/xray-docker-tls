#!/bin/sh
source .env

# Check if DOMAIN is set in the .env file
if [ -z "$DOMAIN" ]; then
  echo "DOMAIN is not set in .env file"
  exit 1
fi

sed -i "s/\$DOMAIN/$DOMAIN/g" /etc/caddy/Caddyfile
echo "Replaced all occurrences of \$DOMAIN with $DOMAIN in /etc/caddy/Caddyfile"

if [ -z "$UUID" ]; then
  echo "UUID is not set in .env file"
  exit 1
fi

sed -i "s/\$UUID/$UUID/g" /etc/xray/config.json
echo "Replaced all occurrences of \$UUID with $UUID in /etc/xray/config.json"
