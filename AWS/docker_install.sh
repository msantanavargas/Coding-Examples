#! /bin/bash

# Script to install and start Docker in AWS Ubuntu
# Need to be run as superuser or root

# Update the packages database
apt update

# Install docker
apt install docker.io

# Enable and start the docker service
systemctl enable docker
systemctl start docker

# Confirm docker is up and running
docker run hello-world
