#!/bin/bash
cd /var/vortexs/container

# Ensure the target directory exists
mkdir -p /var/vortexs/container/${CONTAINER_NAME}

# Copy the server files if the directory is empty
if [ ! "$(ls -A /var/vortexs/container/${CONTAINER_NAME})" ]; then
    cp -r /var/vortexs/container/* /var/vortexs/container/${CONTAINER_NAME}/ || echo "Copying files failed"
fi

# Change to the target directory
cd /var/vortexs/container/${CONTAINER_NAME}

# Start the Minecraft server directly without modifications
bash /var/vortexs/container/start.sh
