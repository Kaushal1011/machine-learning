#!/usr/bin/env bash

if [ -x "$(command -v git)" ]; then
    git add .
    read -p "Enter commit string: " str
    git commit -m "$(date) -> $(echo $str)"
else
    echo "git not installed"
    exit 1
fi
