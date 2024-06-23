#!/bin/bash

while test $# -gt 0; do
    case "$1" in
    -IP)
        IP="$2"
        shift
        ;;
    -PORT)
        PORT="$2"
        shift
        ;;
    -PLAYER)
        PLAYER="$2"
        shift
        ;;
    -SERVERNAME)
        SERVERNAME="$2"
        shift
        ;;
    -PASSWORD)
        PASSWORD="$2"
        shift
        ;;
    esac
    shift
done

# Create server.properties if it does not exist
if [ ! -f server.properties ]; then
    touch server.properties
fi

if grep -q "server-ip=" server.properties; then
    sed -i -e "s/^\(server-ip=\).*$/\1${IP}/" server.properties
else
    echo "server-ip=${IP}" >>server.properties
fi

if grep -q "server-port=" server.properties; then
    sed -i -e "s/^\(server-port=\).*$/\1${PORT}/" server.properties
else
    echo "server-port=${PORT}" >>server.properties
fi

if grep -q "max-players=" server.properties; then
    sed -i -e "s/^\(max-players=\).*$/\1${PLAYER}/" server.properties
else
    echo "max-players=${PLAYER}" >>server.properties
fi

if grep -q "rcon.password=" server.properties; then
    sed -i -e "s/^\(rcon.password=\).*$/\1${PASSWORD}/" server.properties
else
    echo "rcon.password=${PASSWORD}" >>server.properties
fi

if grep -q "motd=" server.properties; then
    sed -i -e "s/^\(motd=\).*$/\1${SERVERNAME}/" server.properties
else
    echo "motd=${SERVERNAME}" >>server.properties
fi

# Directly start the Minecraft server
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
