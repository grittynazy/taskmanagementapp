#!/bin/bash
# Update and install dependencies
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl git

# Install Node.js (replace with the version you need)
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Clone the GitHub repository
cd /home/ubuntu
git clone https://github.com/grittynazy/taskmanagementapp.git

# Navigate to the app folder
cd taskmanagementapp

# Install dependencies
npm install

# Start the app with PM2
pm2 start app.js

# Set PM2 to run on startup
pm2 startup systemd
pm2 save
