FROM arm64v8/debian:latest

# Install Let's Encrypt CERTBOT
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends wget openssl ca-certificates python3 python3-venv libaugeas0 && \
    python3 -m venv /opt/certbot/ && \
    /opt/certbot/bin/pip install --upgrade pip && \
    /opt/certbot/bin/pip install certbot && \
    ln -s /opt/certbot/bin/certbot /usr/bin/certbot

VOLUME /etc/letsencrypt
VOLUME /var/lib/letsencrypt
VOLUME /var/log/letsencrypt

EXPOSE 443 80

COPY docker-entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

CMD [""]


