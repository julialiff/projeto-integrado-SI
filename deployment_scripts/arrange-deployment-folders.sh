#!/bin/bash 

# Remove if previous deployment folder exists
rm -rf /var/www/projeto-integrado-SI/prev-deployment

# Backup current deployment 
mv /var/www/projeto-integrado-SI /var/www/projeto-integrado-SI/prev-deployment

# Create new deployment folder and make nginx owner
mkdir /var/www/projeto-integrado-SI/deployment

chown nginx:nginx /var/www/projeto-integrado-SI/deployment