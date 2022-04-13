#!/bin/bash

# Initialize variables
GRN='\033[01;32m'
YELLOW='\033[1;33m'
RED='\033[01;31m'
RST='\033[0m'
USERREPO='git@github.com:Dark-Matter7232/Dark-Matter7232.github.io.git'
USERREPO_BRANCH='v2'
ORIGIN_DIR=$(pwd)
REMOTE_DST=$ORIGIN_DIR/git-site
LOCAL_DST=$ORIGIN_DIR/dst
SRC=$ORIGIN_DIR/src
DOMAIN="https://const.eu.org/"
script_echo() {
    echo "  $1"
}
exit_script() {
    kill -INT $$
}

prepare_env() {
    echo -e "${GRN}"
    sleep 1
    if [[ ! -d $LOCAL_DST ]]; then
        script_echo "------------------------------------------------------------"
        script_echo "Creating dst directory"
        script_echo "------------------------------------------------------------"
        mkdir "$LOCAL_DST"
    else
        rm -rf "${LOCAL_DST:?}/"{*,.files}
    fi
    sleep 1
    if [[ ! -d "$REMOTE_DST" ]]; then
        script_echo "------------------------------------------------------------"
        script_echo "Cloning remote directory"
        script_echo "------------------------------------------------------------"
        git clone $USERREPO --single-branch -b $USERREPO_BRANCH "$REMOTE_DST"
    else
        sleep 1
        script_echo "------------------------------------------------------------"
        script_echo "Updating remote directory"
        script_echo "------------------------------------------------------------"
        cd "$REMOTE_DST" || exit;
        git fetch origin 2>&1 | sed 's/^/     /';
        git reset --hard origin/HEAD 2>&1 | sed 's/^/     /';
        git clean -f 2>&1 | sed 's/^/     /';
        cd "$ORIGIN_DIR"/../ || exit
    fi
}

compile_site() {
    prepare_env
    echo -e "${GRN}"
    script_echo "------------------------------------------------------------"
    script_echo "Compiling site"
    script_echo "------------------------------------------------------------"
    echo -e "${YELLOW}"
    ssg6 "$SRC" "$LOCAL_DST" "Const Coccinelle" $DOMAIN 2>&1 | sed 's/^/     /'
    SUCCESS=$?
    if [[ $SUCCESS -eq 0 ]]; then
        echo -e "${GRN}"
        sleep 1
        script_echo "------------------------------------------------------------"
        script_echo "Compilation successful..."
        script_echo "------------------------------------------------------------"
        push_site
    elif [[ $SUCCESS -eq 130 ]]; then
        echo -e "${RED}"
        script_echo "------------------------------------------------------------"
        script_echo "Build force stopped by the user."
        script_echo "------------------------------------------------------------"
        echo -e "${RST}"
    elif [[ $SUCCESS -eq 1 ]]; then
        echo -e "${RED}"
        script_echo "------------------------------------------------------------"
        script_echo "Compilation failed..check build logs for errors"
        script_echo "------------------------------------------------------------"
        echo -e "${RST}"
    fi
}

push_site() {
    echo -e "${GRN}"
    rm -rf "${REMOTE_DST:?}/"{*,.files}
    cp -r "$LOCAL_DST"/{*,.files} "$REMOTE_DST"/
    cd "$REMOTE_DST" || exit
    if [ $(git status --porcelain | wc -l) -eq "0" ]; then
        script_echo "🟢 Remote dir is clean."
    else
        echo -e "${YELLOW}"
        script_echo "  🔴 Remote dir has changes."
        git add -A 2>&1 | sed 's/^/     /'
        git commit -m "Update site" 2>&1 | sed 's/^/     /'
        git push 2>&1 | sed 's/^/     /'
        echo -e "${GRN}"
        script_echo "------------------------------------------------------------"
        script_echo "Pushed updates..."
        script_echo "------------------------------------------------------------"
    fi
    cd "$ORIGIN_DIR"/../ || exit
    exit_script
}

compile_site