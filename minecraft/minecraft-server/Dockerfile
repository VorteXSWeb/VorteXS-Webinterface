FROM openjdk:21-ea-slim

MAINTAINER Vortexs

RUN apt-get update && apt-get install -y \
    curl wget ca-certificates openssl git tar bash sqlite3 fontconfig build-essential \
    && rm -rf /var/lib/apt/lists/*

# Create a base directory for the Minecraft server
RUN mkdir -p /var/vortexs/container

# Set working directory
WORKDIR /var/vortexs/container

# Download Minecraft server jar
RUN curl -o minecraft_server.jar https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar

# Copy the start and entrypoint scripts
COPY ./start.sh /var/vortexs/container/start.sh
COPY ./entrypoint.sh /var/vortexs/container/entrypoint.sh

# Download and install mcrcon
RUN wget https://github.com/Tiiffi/mcrcon/archive/refs/tags/v0.7.1.tar.gz -O mcrcon.tar.gz \
    && tar -xzf mcrcon.tar.gz \
    && cd mcrcon-0.7.1 \
    && make \
    && make install

# Create and accept EULA
RUN echo "eula=true" > /var/vortexs/container/eula.txt

# Set permissions
RUN chmod +x /var/vortexs/container/start.sh /var/vortexs/container/entrypoint.sh

CMD ["/bin/bash", "/var/vortexs/container/entrypoint.sh"]
