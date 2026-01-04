#!/bin/bash

# Defina aqui as opções com ícones para ficar bonito no Rofi
# Formato: "Ícone Nome"
option_br="🇧🇷 Português (ABNT2)"
option_us="🇺🇸 Inglês (US)"

# Lista de opções separadas por nova linha
options="$option_br\n$option_us"

# Abre o rofi e captura a escolha
choice=$(echo -e "$options" | rofi -dmenu -i -p "Teclado" -theme-str 'window {width: 15%;}')

# Verifica qual foi escolhido e aplica o layout
case "$choice" in
    "$option_br")
        hyprctl keyword input:kb_layout br
        ;;
    "$option_us")
        hyprctl keyword input:kb_layout us
        ;;
esac
