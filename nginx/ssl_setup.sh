#!/bin/bash

# This script in conjunction with nginx.ssl.conf enables SSL 
# by requesting a certificate from Lets Encrypt and then replacing
# nginx.conf with nginx.ssl.conf, which is assumed to exist 

DOMAIN_FLAGS="-d arklet.polyneme.xyz"
EMAIL=donny@polyneme.xyz

certbot certonly --non-interactive --nginx --agree-tos --email $EMAIL $DOMAIN_FLAGS &&
cp /nginx.ssl.conf /etc/nginx/conf.d/nginx.conf &&
/etc/init.d/nginx reload ||
cat /var/log/letsencrypt/letsencrypt.log | grep acme.messages



