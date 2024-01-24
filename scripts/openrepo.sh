#!/usr/bin/bash
# a script that opens the repo link in the browser


link=$(git remote -v | grep origin | grep -o 'git@github.com:[^[:space:]]*' | head -1 | sed 's|^git@github.com:|https://github.com/|')

if [ -n "$link" ]; then
    tmux new-session -d "thorium-browser $link"
    exit 0
fi
link=$(git remote -v | grep -oP '(?<=origin\s)(https?://\S+)' | head -n 1)
if [ -n "$link" ]; then
    tmux new-session -d "thorium-browser $link"
    exit 0
fi

echo "Error: Unable to determine repository link."
