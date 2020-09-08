#!/bin/bash

# Load environment variables
source /etc/profile

# Print deployment info
DEPLOYMENT_TIME=$( date -u "+%Y/%m/%d %H:%M:%S" )
echo "Deployment finished at: "$DEPLOYMENT_TIME" UTC" > /var/www/projeto-integrado-SI/deployment/public/deployment_time.txt

# Arrange folder permissions
chown -R nginx:nginx /var/www/projeto-integrado-SI/deployment
chmod -R 775 /var/www/projeto-integrado-SI/deployment

service nginx restart