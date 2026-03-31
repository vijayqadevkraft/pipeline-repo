#!/bin/bash
set -e

echo "Starting deployment of WordPress..."

# Define deployment target (simulating EC2 web root)
DEPLOY_TARGET="/var/www/html/wordpress-app"
echo "Creating deployment target directory $DEPLOY_TARGET..."
sudo mkdir -p $DEPLOY_TARGET
sudo chown $USER:$USER $DEPLOY_TARGET

# Copy WordPress files from the cloned repository
# Assuming the script is called from the pipeline workspace
# and webapplication-repo is cloned into 'webapplication-repo'
APP_SOURCE="./webapplication-repo/wordpress"

if [ -d "$APP_SOURCE" ]; then
    echo "Copying files from $APP_SOURCE to $DEPLOY_TARGET..."
    cp -r $APP_SOURCE/* $DEPLOY_TARGET/
    # Simulation of WordPress configuration
    echo "Configuring WordPress..."
    cp $DEPLOY_TARGET/wp-config-sample.php $DEPLOY_TARGET/wp-config.php

    # Simulation of database migration
    echo "Simulating database migration/initialization..."
    # mysql -u root -p password < $DEPLOY_TARGET/database_init.sql

    # Simulation of Apache/Nginx restart
    echo "Simulating Apache/Nginx service restart..."
    # sudo systemctl restart apache2

    echo "Deployment successful! WordPress app available at $DEPLOY_TARGET"
else
    echo "Error: WordPress source $APP_SOURCE not found!"
    exit 1
fi
