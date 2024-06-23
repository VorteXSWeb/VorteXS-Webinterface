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

if grep -q "bind " server.cfg; then
    sed -i -e "s/^\(bind \).*$/\1${IP}/" server.cfg
else
    echo "bind ${IP}" >>server.cfg
fi

if grep -q "port " server.cfg; then
    sed -i -e "s/^\(port \).*$/\1${PORT}/" server.cfg
else
    echo "port ${PORT}" >>server.cfg
fi

if grep -q "maxplayers " server.cfg; then
    sed -i -e "s/^\(maxplayers \).*$/\1${PLAYER}/" server.cfg
else
    echo "maxplayers ${PLAYER}" >>server.cfg
fi

if grep -q "rcon_password " server.cfg; then
    sed -i -e "s/^\(rcon_password \).*$/\1${PASSWORD}/" server.cfg
else
    echo "rcon_password ${PASSWORD}" >>server.cfg
fi

if grep -q "hostname " server.cfg; then
    sed -i -e "s/^\(hostname \).*$/\1${SERVERNAME}/" server.cfg
else
    echo "hostname ${SERVERNAME}" >>server.cfg
fi

./samp03svr
