#!/bin/bash
set -e

echo "Starting deployment of Simple HTML Application..."

# Define deployment target (simulating EC2 web root)
DEPLOY_TARGET="/var/www/html/simple-html-app"
echo "Creating deployment target directory $DEPLOY_TARGET..."
sudo mkdir -p $DEPLOY_TARGET
sudo chown $USER:$USER $DEPLOY_TARGET

# Copy application files from the cloned repository
# Assuming the script is called from the pipeline workspace
# and webapplication-repo is cloned into 'webapplication-repo'
APP_SOURCE="./webapplication-repo/simple-index-html"

if [ -d "$APP_SOURCE" ]; then
    echo "Copying files from $APP_SOURCE to $DEPLOY_TARGET..."
    cp -r $APP_SOURCE/* $DEPLOY_TARGET/

    # Simulation of "Node.js" service restart
    echo "Simulating Node.js service restart (e.g., pm2 restart app)..."
    # In a real EC2 instance with PM2: pm2 restart simple-html-app || pm2 start $DEPLOY_TARGET/index.js --name simple-html-app

    # Simulation of Nginx configuration
    echo "Simulating Nginx configuration for the app..."
    # sudo cp $DEPLOY_TARGET/nginx.conf /etc/nginx/sites-available/simple-html-app
    # sudo ln -sf /etc/nginx/sites-available/simple-html-app /etc/nginx/sites-enabled/
    # sudo systemctl restart nginx

    echo "Deployment successful! Application available at $DEPLOY_TARGET"
else
    echo "Error: Application source $APP_SOURCE not found!"
    exit 1
fi
