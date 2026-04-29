#!/bin/bash
# Swordfish keyboard layout menu — rofi dmenu at cursor position

option_br="🇧🇷 Português (ABNT2)"
option_us="🇺🇸 Inglês (US)"

choice=$(printf "%s\n%s" "$option_br" "$option_us" | swordfish-menu "Teclado")

case "$choice" in
    "$option_br") hyprctl keyword input:kb_layout br ;;
    "$option_us") hyprctl keyword input:kb_layout us ;;
esac
