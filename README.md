# NGINX Container

---

### Establish Host Cert

```bash
# First we need to build our letsencrypt container
cd letsencrypt
docker build -t letcrypt-certbot:latest .
````

```bash
# Then use that container to generate our host certificate
# This assumes that the DNS and firewall are configured to allow traffic to http/s

docker run -it --rm -p 443:443 -p 80:80 --name certbot \
-v "$(pwd)/letsencrypt_conf:/etc/letsencrypt" \
-v "$(pwd)/letsencrypt_work:/var/lib/letsencrypt" \
-v "$(pwd)/letsencrypt_logs:/var/log/letsencrypt" \
letcrypt-certbot:latest certonly --standalone

# Go through the interactive configuration entering optional email and desired domain(s)
# New certs will be in ./letsencrypt_conf/live/<DOMAIN>
DOMAIN=<domain>
sudo cp letsencrypt_conf/live/$DOMAIN/fullchain.pem ../pki/host; \
sudo cp letsencrypt_conf/live/$DOMAIN/privkey.pem ../pki/host; \
sudo chown $(whoami):$(whoami) ../pki/host/*.pem; \
sudo chmod 600 ../pki/host/*.pem;

```

*Note: be sure to populate client keypair and truststore CA in /pki dir*

---

### Run NGINX reverse proxy


```bash
docker build -t nginx-container:latest . 

HOST_NAME=example.com
HOST_PORT=443
docker run --rm -p 443:443 -p 80:80 \
-v ../pki:/pki
-e HOST_NAME=$HOST_NAME -e HOST_PORT=$HOST_PORT \
--name nginx-container nginx-container:latest
```