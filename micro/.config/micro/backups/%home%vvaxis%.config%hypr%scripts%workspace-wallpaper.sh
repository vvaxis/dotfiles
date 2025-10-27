#!/usr/bin/env bash

# Workspace → Wallpaper mapping
declare -A WALLS
WALLS[1]="/usr/share/backgrounds/swordfish-bebop.jpg"
WALLS[2]="/usr/share/backgrounds/swordfish-cowboy.png"
WALLS[3]="/usr/share/backgrounds/swordfish-space.png"
WALLS[4]="/usr/share/backgrounds/default-4.jpg"
WALLS[5]="/usr/share/backgrounds/default-5.jpg"

# Nome do monitor
MONITOR="DP-3"

# Último workspace registrado
LAST_WS=""

# Loop infinito verificando o workspace atual
while true; do
    WS=$(hyprctl activeworkspace -j | jq -r '.id')
    if [[ "$WS" != "$LAST_WS" ]]; then
        if [[ -n "${WALLS[$WS]}" ]]; then
            hyprctl hyprpaper wallpaper "$MONITOR,${WALLS[$WS]}"
        fi
        LAST_WS="$WS"
    fi
    sleep 0.3
done
