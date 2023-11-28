#!/bin/bash

# Update the system
echo "-> Updating the system <-"
sudo apt update
sudo apt upgrade -y

# Install Docker using the official script
echo "-> Installing Docker <-"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Create a Docker Compose file named dockge.yaml in the current script location
echo "-> Creating Docker Compose file for Dockge <-"
sudo tee ./dockge.yaml > /dev/null <<EOL
version: "3.8"
services:
  dockge:
    image: louislam/dockge:1
    restart: unless-stopped
    ports:
      - 5001:5001
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - $(pwd)/data:/app/data
      - $(pwd)/stacks:/opt/stacks
    environment:
      # Tell Dockge where to find the stacks
      - DOCKGE_STACKS_DIR=/opt/stacks
EOL

# Start Dockge using Docker Compose
echo "-> Starting Dockge <-"
sudo docker-compose -f ./dockge.yaml up -d

echo "-> Completed! <-"
