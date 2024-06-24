# Use an official Debian runtime as a parent image
FROM debian

# Set environment variables
ENV FX_VERSION latest

# Update and install required packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    wget \
    curl \
    unzip \
    xz-utils \
    lib32gcc-s1 \
    apt-utils \
    libc6 \
    libncurses5 \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Create a base directory for the FiveM server
RUN mkdir -p /var/vortexs/container

# Change to the base directory
WORKDIR /var/vortexs/container

# Download the latest version of the FiveM server
RUN wget https://vortexs.de/uploads/docker/fx.tar.gz

# Extract the FiveM server
RUN tar -xf fx.tar.gz && rm fx.tar.gz

# Make the server executable
RUN chmod +x run.sh

# Copy the start and entrypoint scripts
COPY start.sh /var/vortexs/container/start.sh
COPY entrypoint.sh /var/vortexs/container/entrypoint.sh
RUN chmod +x /var/vortexs/container/start.sh /var/vortexs/container/entrypoint.sh

ENTRYPOINT ["/var/vortexs/container/entrypoint.sh"]
