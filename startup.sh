#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt-get install httpd -y
service httpd start 


#        apt-get -y update
#        apt-get -y install nginx
#        export HOSTNAME=$(hostname | tr -d '\n')
#        export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n')
#        echo "Welcome to $HOSTNAME - $PRIVATE_IP" > /usr/share/nginx/www/index.html
#        service nginx start