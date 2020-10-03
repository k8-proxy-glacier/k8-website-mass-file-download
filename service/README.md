# Quickstart

- On Ubuntu LTS (18.04 tested) install nginx

- Run: `sudo mv /etc/nginx /etc/backup-nginx`

- clone the repo and chdir into the repo

- Run: `sudo mv service/nginx /etc`

- Run: `cd /etc/nginx`

- Run: `openssl req -x509 -nodes -newkey rsa:4096 -keyout default.key -out default.crt -days 365` and fill parameters for www.gov.uk

- Run: `openssl req -x509 -nodes -newkey rsa:4096 -keyout assets.key -out assets.crt -days 365` and fill parameters for assets.publishing.service.gov.uk

- Run: `sudo chown www-data:www-data /etc/nginx/*.crt /etc/nginx/*.key` and restart nginx service

- Run: `cd /var/www/html` then run the script service/mirror.sh from the repo (or extract the prepackaged mirror if you have download it)
