#!/bin/bash
# Swordfish power menu — rofi dmenu at cursor position

choice=$(printf "󰤄  SUSPEND\n󰍃  ABANDON SHIP\n󰐥  SHUTDOWN\n󰑐  REBOOT" | swordfish-menu "Power")

case "$choice" in
    *SUSPEND*)  systemctl suspend ;;
    *ABANDON*)  hyprctl dispatch exit ;;
    *SHUTDOWN*) shutdown now ;;
    *REBOOT*)   reboot ;;
esac
