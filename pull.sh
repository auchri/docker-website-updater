#!/bin/bash

gitPull() {
    local SSH_URL=$1
    local BRANCH=$2
    local DIRECTORY=$3

    cd "$DIRECTORY" 
    rm -rf ..?* .[!.]* *
    git clone -b "$BRANCH" "$SSH_URL" .

    # Delete .git folder
    rm -rf "${DIRECTORY}/.git"
}

gitPull $1 $2 $3
