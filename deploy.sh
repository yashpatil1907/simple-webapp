#!/bin/bash

echo "Stopping old container..."

docker stop simple-webapp || true

docker rm simple-webapp || true

echo "Removing old image..."

docker rmi simple-webapp:latest || true

echo "Building Docker Image..."

docker build -t simple-webapp:latest .

echo "Running Container..."

docker run -d \
--name simple-webapp \
-p 80:80 \
simple-webapp:latest

echo "Deployment Completed Successfully"