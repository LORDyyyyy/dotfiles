#!/usr/bin/bash
# A script to push on github with one command
# usage: push [branch name] [the rest of the arguments are the commit message]

if [ "$#" -lt 2 ]; then
    echo "Error: At least 2 arguments are required."
    echo "Usage: $0 [branch name] [#1 commit word] [#2 commit word] [#n commit word]"
    exit 1
fi

git add .
git commit -m "${*:2}"
git push origin ${1}

