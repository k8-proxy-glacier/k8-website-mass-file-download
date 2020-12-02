#!/bin/bash
set -euo pipefail
sudo apt install -y wget curl gnupg2 ca-certificates lsb-release
# Install depenedcies
echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list
# Add Nginx repo
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add - 
# Trust nginx public key for apt installations
sudo apt update
# Refresh apt repo cache
sudo apt install -y nginx
# Install nginx
