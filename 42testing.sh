#!/bin/bash

#Get current directory to mount
CURRENT_DIR=$(pwd)

#Export current directory as environmental variable
export MOUNT_DIR=${CURRENT_DIR}

#Get docker compose directory (PATH to this repo)
CONTAINER_FILES=~/Developer/42-testing-container/
#Go to docker compose folder
cd $CONTAINER_FILES

#Start docker compose in detatched mode
docker-compose up -d --build

# Get the container ID of the running service (42-testing in this case)
# Use docker-compose ps -q devcontainer to get the container ID
SERVICE_NAME=42-testing
CONTAINER_ID=$(docker-compose ps -q $SERVICE_NAME)

# Attach to the container's terminal using zsh
docker exec -it $CONTAINER_ID zsh

# Once the zsh session ends, stop and remove the container
docker-compose down

