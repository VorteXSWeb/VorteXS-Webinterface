#!/bin/bash

set -e

# Ensure the target directory exists
mkdir -p /var/vortexs/container/${CONTAINER_NAME}

# Change to the target directory
cd /var/vortexs/container/${CONTAINER_NAME}

# Copy the server files if the directory is empty
if [ ! "$(ls -A /var/vortexs/container/${CONTAINER_NAME})" ]; then
    cp -r /var/vortexs/container/* /var/vortexs/container/${CONTAINER_NAME}/
fi

# Start the server with the provided parameters
/var/vortexs/container/start.sh -PORT ${PORT} -PLAYER ${MAX_PLAYERS} -SERVERNAME ${SERVERNAME} -PASSWORD ${PASSWORD}
