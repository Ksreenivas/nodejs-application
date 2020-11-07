#!/bin/bash

set -e

# Install Docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker ubuntu
sudo usermod -aG root ubuntu
cd /home/ubuntu/nodejs-hello-world
sudo chmod 777 /var/run/docker.sock

# Build and run your image

docker build -t nodejs-helloworld .
docker run -p 8080:8080 -d nodejs-helloworld:latest
docker ps -a