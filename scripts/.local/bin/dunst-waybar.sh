#!/usr/bin/env bash

PAUSED=$(dunstctl is-paused)

if [ "$PAUSED" = "true" ]; then
    CLASS="muted"
else
    CLASS="active"
fi

printf '{"alt":"%s","tooltip":"%s"}\n' "$CLASS" "$( [ "$PAUSED" = "true" ] && echo "Mudo" || echo "Notificações ativas" )"
