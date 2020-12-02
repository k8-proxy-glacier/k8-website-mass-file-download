#!/bin/bash
cd $(dirname $0)
for i in pdf png jpg csv html ods xlsx odt docx doc xls zip jpeg gif xlsm rtf xml gif odp ppt pptx xlsx ppt ; do
find /var/www/html/assets.publishing.service.gov.uk/ -iname "*.$i" -exec echo "https://{}" \; > assets-$i.txt
done
for i in  pdf png jpg csv html ods xlsx odt docx doc xls zip jpeg gif xlsm rtf xml gif odp ppt pptx xlsx ppt ; do
cut -f 4- -d'/' assets-$i.txt | awk -v ftype=$i '{print "assets.publishing.service.gov.uk," "/" $0 "," ftype }'
done  > all-urls.csv
