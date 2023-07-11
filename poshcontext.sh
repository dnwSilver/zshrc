#!/bin/bash
function set_poshcontext() {
    if [ -f "package.json" ]; then
        if [ -f "package-lock.json" ]; then PACKET_MANAGER=$(npm --version); fi
        if [ -f "yarn.lock" ]; then PACKET_MANAGER=$(yarn --version); fi
        export MANAGER=$PACKET_MANAGER
        export REACT=$(node -p "require('./package.json').dependencies?.react || ''" | sed s/\\^//)
        export TS=$(node -p "require('./package.json').dependencies?.typescript || require('./package.json').devDependencies?.typescript" | sed s/\\^//)
    fi
    if [ -f "global.json" ]; then
        PROJECT=$(echo $(yq '[ .variables.MAIN_PROJECT_PATH]' .gitlab-ci.yml)/$(yq -r '[ .variables.MAIN_PROJECT_NAME]' .gitlab-ci.yml) | sed -e s/\"//g -e s/-//g -e "s/ //g")
        export OLD_VERSION=$(awk -F '[<>]' '/PackageVersion/{print $3}' $PROJECT)
    fi
}