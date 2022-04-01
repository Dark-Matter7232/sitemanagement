#!/bin/bash

# Initialize variables
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[01;31m'
RST='\033[0m'
ORIGIN_DIR=$(pwd)

script_echo() {
    echo "  $1"
}
exit_script() {
    kill -INT $$
}

prepare_env() {
    echo -e "${CYAN}"
    if [[ ! -d $ORIGIN_DIR/dst ]]; then
        script_echo "------------------------------------------------------------"
        script_echo "Creating dst directory"
        script_echo "------------------------------------------------------------"
        mkdir $ORIGIN_DIR/dst
    else
        rm -rf $ORIGIN_DIR/dst/{*,.files}
    fi
    if [[ ! -d $ORIGIN_DIR/git-site ]]; then
        script_echo "------------------------------------------------------------"
        script_echo "Cloning remote repo"
        script_echo "------------------------------------------------------------"
        git clone git@github.com:Dark-Matter7232/Dark-Matter7232.github.io.git --single-branch -b v2 $ORIGIN_DIR/git-site
    else
        rm -rf $ORIGIN_DIR/git-site
        script_echo "------------------------------------------------------------"
        script_echo "Local clone already exists, removing it"
        script_echo "Cloning remote repo"
        script_echo "------------------------------------------------------------"
        git clone git@github.com:Dark-Matter7232/Dark-Matter7232.github.io.git --single-branch -b v2 $ORIGIN_DIR/git-site
    fi

}

compile_site() {
    echo -e "${YELLOW}"
    prepare_env
    ssg6 src dst "Const Coccinelle" "https://dark-matter7232.github.io/"
    SUCCESS=$?
    if [[ $SUCCESS -eq 0 ]]; then
        echo -e "${GRN}"
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
    echo -e "${CYAN}"
    script_echo "------------------------------------------------------------"
    script_echo "Pushing updated site to the remote..."
    script_echo "------------------------------------------------------------"
    rm -rf $ORIGIN_DIR/git-site/*
    rm -rf $ORIGIN_DIR/git-site/.files
    cp -r $ORIGIN_DIR/dst/* $ORIGIN_DIR/git-site/
    cp $ORIGIN_DIR/dst/.files $ORIGIN_DIR/git-site/
    cd $ORIGIN_DIR/git-site
    git add -A
    git commit -m "Update site"
    git push
    cd ../
    script_echo "------------------------------------------------------------"
    script_echo "Pushed updated site..."
    script_echo "------------------------------------------------------------"
    exit_script
}

compile_site