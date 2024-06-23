# Use an official Debian runtime as a parent image
FROM debian:latest

# Set environment variables
ENV SAMP_VERSION 0.3.7-R2

# Update and install required packages
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
    wget \
    unzip \
    lib32gcc-s1 \
    apt-utils \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 && \
    rm -rf /var/lib/apt/lists/*

# Create a base directory for the SA-MP server
RUN mkdir -p /var/vortexs/container

# Change to the base directory
WORKDIR /var/vortexs/container

# Download and extract the SA-MP server
RUN wget https://vortexs.de/eggs/download/samp/samp.tar && \
    tar -xf samp.tar && \
    rm samp.tar

# Make the server executable
RUN chmod +x samp03svr

# Copy the start and entrypoint scripts
COPY start.sh /start.sh
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /start.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
