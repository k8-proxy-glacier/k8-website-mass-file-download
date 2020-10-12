# Website offline mirror

## Requirements

- Ubuntu LTS (18.04 tested)

- Latest Nginx (Stable channel)

- wget

## Installation

- ```bash
  cd $HOME
  git clone https://github.com/k8-proxy/k8-website-mass-file-download.git
  cd k8-website-mass-file-download/service
  ./install-dependencies.sh
  ```

- Backup nginx configuration directory:
  
  ```bash
  sudo mv /etc/nginx /etc/backup-nginx
  ```

- Move the `nginx` folder from the repo to `/etc/`

- Run  `cd /etc/nginx` and generate a self-signed certificate for `www.gov.uk`  and `assets.publishing.service.gov.uk` as follows
  
  ```bash
  sudo openssl req -x509 -nodes -newkey rsa:4096 -keyout default.key -out default.crt -days 365
  ```
  
  Then fill the SSL parameters, CN must be `www.gov.uk` 
  Now run:
  
  ```bash
  sudo openssl req -x509 -nodes -newkey rsa:4096 -keyout assets.key -out assets.crt -days 365
  ```
  
  and fill the SSL parameters, CN must be `assets.publishing.service.gov.uk`

- Change certifacate and private key ownership for nginx to be able to access them 
  
  ```bash
  sudo chown www-data:www-data /etc/nginx/*.crt /etc/nginx/*.key
  ```

- To clone the website, run the script `service/mirror.sh` from the repo as follows
  
  ```bash
  ~/k8-website-mass-file-download/service/mirror.sh /var/www/html
  ```
  
  Instead, if you are using zipped document root, you can run 
  
  ```bash
  sudo unzip /path/to/documentroot.zip -d /var/www/html
  ```
  
  and replace /path/to/documentroot.zip with the path of the zipped document root

- Start and enable nginx
  
  ```bash
  sudo systemctl enable --now nginx
  ```
