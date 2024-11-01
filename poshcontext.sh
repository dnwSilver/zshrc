#!/bin/bash
function set_poshcontext() {
    if [ -f "package.json" ]; then
        if [ -f "package-lock.json" ]; then PACKET_MANAGER=$(npm --version); fi
        if [ -f "yarn.lock" ]; then PACKET_MANAGER=$(yarn --version); fi
        if [ -f "bun.lockb" ]; then PACKET_MANAGER=$(bun --version); fi
        export MANAGER=$PACKET_MANAGER
        export TS=$(node -p "require('./package.json').dependencies?.typescript || require('./package.json').devDependencies?.typescript" | sed s/\\^//)
    fi
}
