#!/bin/bash

while test $# -gt 0; do
    case "$1" in
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

# Update the server.cfg file with provided parameters
if grep -q "endpoint_add_tcp" server.cfg; then
    sed -i -e "s/^\(endpoint_add_tcp \).*$/\1\"0.0.0.0:${PORT}\"/" server.cfg
else
    echo "endpoint_add_tcp \"0.0.0.0:${PORT}\"" >> server.cfg
fi

if grep -q "endpoint_add_udp" server.cfg; then
    sed -i -e "s/^\(endpoint_add_udp \).*$/\1\"0.0.0.0:${PORT}\"/" server.cfg
else
    echo "endpoint_add_udp \"0.0.0.0:${PORT}\"" >> server.cfg
fi

if grep -q "sv_maxclients" server.cfg; then
    sed -i -e "s/^\(sv_maxclients \).*$/\1${PLAYER}/" server.cfg
else
    echo "sv_maxclients ${PLAYER}" >> server.cfg
fi

if grep -q "rcon_password" server.cfg; then
    sed -i -e "s/^\(rcon_password \).*$/\1${PASSWORD}/" server.cfg
else
    echo "rcon_password ${PASSWORD}" >> server.cfg
fi

if grep -q "sv_hostname" server.cfg; then
    sed -i -e "s/^\(sv_hostname \).*$/\1\"${SERVERNAME}\"/" server.cfg
else
    echo "sv_hostname \"${SERVERNAME}\"" >> server.cfg
fi

# Start the FiveM server
/var/vortexs/container/run.sh +exec server.cfg
