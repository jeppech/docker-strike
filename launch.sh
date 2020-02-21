#!/bin/bash

cd $HOME/csgo_server
echo "Starting CS:GO server..."
exec csgo/srcds_run -game csgo -console -usercon -nohltv \
        -ip 0.0.0.0 \
        -port 27015
#       -tickrate 128 \
#       +game_type 0 +game_mode 1 -maxplayers_override 10 +mapgroup mg_active +map de_cache \
#       +sv_lan 0 \
#       -net_port_try 1