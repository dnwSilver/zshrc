#!/bin/bash

RED="\e[91m"
GREEN="\e[32m"
YELLOW="\e[93m"
BLUE="\e[94m"
NC="\e[0m"

function git_merge_origin_dev() {
    gswd
    gfu
    gsw $(git_current_branch)
    git merge origin/$(git_develop_branch)
}

function git_lfs_reset() {
    git lfs uninstall > /dev/null 2>&1 || return
    git reset --hard > /dev/null 2>&1 || return
    git lfs install > /dev/null 2>&1 || return
    git lfs pull > /dev/null 2>&1 || return
    rm .gitattributes
    git restore .gitattributes

    echo -e " ${YELLOW}󰴋${NC} Reinstall git-lfs and clear files."
}

function git_create_tag_and_push ()
{
    go_to_main_branch

    update_current_branch

    CURRENT_VERSION=$(get_version_typescript)
    if [ $(git tag -l "v$CURRENT_VERSION") ]; then
        echo -e " ${YELLOW}󰜣${NC} ${RED}Tag v${CURRENT_VERSION} already created${NC}."
    else
        git tag v$CURRENT_VERSION > /dev/null 2>&1 || return
        echo -e " ${YELLOW}󰜢${NC} Create tag ${GREEN}v${CURRENT_VERSION}${NC}."

        git push origin v$CURRENT_VERSION > /dev/null 2>&1 || return
        echo -e " ${YELLOW}󱩺${NC} Push tag ${GREEN}v${CURRENT_VERSION}${NC}."
    fi
}