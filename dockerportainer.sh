#!/bin/bash

# Update the system
echo "-> Updating the system <-"
sudo apt update
sudo apt upgrade -y

# Install Docker + Docker Compose
print_in_box "-> Installing Docker, Docker Compose + Portainer <-"
sudo apt install -y docker.io
sudo apt install -y docker-compose

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Install Portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

print_in_box "-> Completed! <-"
