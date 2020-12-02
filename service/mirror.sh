#!/bin/bash

if [ $# -ne 1 ] ; then
    echo Usage: $0 /path/to/document/root
    exit 2
else
    DOCROOT=$1
fi

sudo -u www-data wget -P $DOCROOT --adjust-extension --trust-server-names --no-remove-listing \
-r -p -H  -P /var/www/html -e robots=off -D www.gov.uk,assets.publishing.service.gov.uk \
https://www.gov.uk 
