#!/bin/bash

# Pega o layout atual (requer o pacote 'jq' instalado)
CURRENT=$(hyprctl -j getoption input:kb_layout | jq -r '.str')

if [ "$CURRENT" = "br" ]; then
    hyprctl keyword input:kb_layout us
else
    hyprctl keyword input:kb_layout br
fi
