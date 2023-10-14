#!/bin/sh

mkdir -p /var/log/xray /var/log/caddy /usr/share/xray

PLATFORM=$1
if [ -z "$PLATFORM" ]; then
    ARCH="amd64"
else
    case "$PLATFORM" in
        linux/386)
            ARCH="386"
        ;;
        linux/amd64)
            ARCH="amd64"
        ;;
        linux/arm/v6)
            ARCH="arm6"
        ;;
        linux/arm/v7)
            ARCH="arm7"
        ;;
        linux/arm64|linux/arm64/v8)
            ARCH="arm64"
        ;;
        linux/ppc64le)
            ARCH="ppc64le"
        ;;
        linux/s390x)
            ARCH="s390x"
        ;;
        *)
            ARCH=""
        ;;
    esac
fi
[ -z "${ARCH}" ] && echo "Error: Not supported OS Architecture" && exit 1
# Download binary file
XRAY_FILE="xray_linux_${ARCH}"

echo "Downloading binary file: ${XRAY_FILE}"
wget -O /usr/bin/xray https://dl.lamp.sh/files/${XRAY_FILE} > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: Failed to download binary file: ${XRAY_FILE}" && exit 1
fi
echo "Download binary file: ${XRAY_FILE} completed"

echo "Downloading Geodata"
wget -O /usr/share/xray/geosite.dat https://github.com/v2fly/domain-list-community/releases/latest/download/dlc.da > /dev/null 2>&1 && /
wget -O /usr/share/xray/geoip.dat https://github.com/v2fly/geoip/releases/latest/download/geoip.dat > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: Failed to download geodata" && exit 1
fi
echo "Download geodata completed"

chmod +x /usr/bin/xray