# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM openjdk:21-ea-slim

MAINTAINER Vortexs

RUN apt-get update && apt-get install -y curl wget ca-certificates openssl git tar bash sqlite3 fontconfig && rm -rf /var/lib/apt/lists/*

# Create a base directory for the Minecraft server
RUN mkdir -p /var/vortexs/container

# Set working directory
WORKDIR /var/vortexs/container

# Download Minecraft server jar
RUN curl -o minecraft_server.jar https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar

# Copy the start and entrypoint scripts
COPY ./start.sh /var/vortexs/container/start.sh
COPY ./entrypoint.sh /var/vortexs/container/entrypoint.sh

# Create and accept EULA
RUN echo "eula=true" > /var/vortexs/container/eula.txt

# Set permissions
RUN chmod +x /var/vortexs/container/start.sh /var/vortexs/container/entrypoint.sh

CMD ["/bin/bash", "/var/vortexs/container/entrypoint.sh"]
