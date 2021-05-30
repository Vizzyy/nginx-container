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
```
