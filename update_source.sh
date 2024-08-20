#!/bin/bash
# Copyright (c) 2024, AI-Blox. All rights reserved.
# script is developed by Benyamin Eslami, AI-Blox.

PROJECT_DIR=$(pwd)
cd $PROJECT_DIR
function error() {

    cd "$PROJECT_DIR"
    exit 1
}

git submodule init
git submodule update

if [ -z "$1" ]; then
    echo "Please provide the branch which you want to checkout, possiblities are"
    git branch
    error
fi

if git show-ref --quiet refs/heads/$1; then
    BRANCH=$1
else
    echo "Branch: $1 does not exist"
    error
fi

git submodule foreach 'git checkout $BRANCH'

exit 0
