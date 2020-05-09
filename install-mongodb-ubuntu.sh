#!/bin/bash
# This script is used by the Packer templates to install the latest version of MongoDB Community Editor.

# Import the public GPG key
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

# Create the list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

# Update local package database
sudo apt-get update

# Install the latest version of MongoDB
sudo apt-get install -y mongodb-org

# Start the mongod process
sudo systemctl start mongod

# Start the mongod process on system reboot
sudo systemctl enable mongod