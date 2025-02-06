#!/bin/bash

package_name=$(xclip -o)
package_name=$(echo "$package_name" | xargs)

if [[ -z "$package_name" ]]; then
    notify-send "Error" "Clipboard is empty."
    exit 1
fi

read -p "Install package '$package_name'? [Y/n]: " confirm
confirm=${confirm:-Y}

if [[ "$confirm" =~ ^[Yy]$ ]]; then
    yay -S "$package_name"

    notify-send "Done" "Package Installed Sucessfully."
    exit 0
else
    notify-send "Error" "Installation canceled."
    exit 0
fi
