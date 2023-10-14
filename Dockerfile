FROM caddy:latest
LABEL maintainer="iamtrazy <iamtrazy@proton.me>"

WORKDIR /root
COPY xray.sh /root/xray.sh

RUN set -ex \
    && chmod +x /root/xray.sh \
    && /root/xray.sh \
    && rm -fv /root/xray.sh

COPY config.json /etc/xray/config.json
COPY Caddyfile /etc/caddy/Caddyfile
COPY index.html /usr/share/caddy/index.html

WORKDIR /root

COPY .env /root/.env
COPY env.sh /root/env.sh
COPY run.sh /root/run.sh
RUN set -ex \
    && chmod +x /root/env.sh \
    && chmod +x /root/run.sh \
    && /root/env.sh \
    && caddy fmt --overwrite /etc/caddy/Caddyfile

CMD ["/root/run.sh"]

