#!/usr/bin/bash
# autostart conky at startup

sleep 20s && conky -c "$HOME/.config/conky/Titus.conkyrc" &
