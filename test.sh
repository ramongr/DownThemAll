#!/bin/bash

regex="[a-zA-Z]*"

if [ -f repoConfig ]; then
    directory=$(grep "$regex git@github.com:megajpc/colisoes.git" repoConfig)
    directory=$(echo $directory | grep -E -o "^[a-z]+")
    echo $directory
fi  