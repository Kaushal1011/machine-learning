#!/usr/bin/env bash
# Tue 08 Oct 2019 02:00:43 PM IST

if [ -x "$(command -v git)" ]; then
    git add .
    read -p "Enter commit string: " str
    git commit -m "$(date) -> $(echo $str)"
else
    echo "git not installed"
    exit 1
fi
