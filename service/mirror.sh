sudo -u www-data wget --adjust-extension --trust-server-names --no-remove-listing -r -p -H \
 -P /var/www/html -e robots=off -D www.gov.uk,assets.publishing.service.gov.uk https://www.gov.uk 
