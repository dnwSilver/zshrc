#!/bin/bash

# SPECIAL
alias ll="eza --tree --icons --level 1 -l"                          # show all files and directories
alias x="clear"                                                     # clear terminal
alias vpn="sudo openfortivpn -c ~/.config/openfortivpn/config"      # connect to secure network for development

# GIT
alias gcmj="gitmoji -c"                                             # commit builder with emoji
alias grst="git stash && git stash clear"                           # remove all changes
alias ggpcs="ggp -o ci.skip"                                        # push commit without ci/cd
alias gfu="ggl && gfa"                                              # pull new commit and branches
alias ghrc="git reset --hard HEAD && git clean -qfdx"               # ghrc and clean
alias gtp="create_and_push_tag"                                     # create tag and push with current version
alias gmod='
CURRENT_BRANCH=$(git_current_branch)
gswd
gfu
gsw $CURRENT_BRANCH
git merge origin/$(git_develop_branch)
'                 # merge with origin dev
alias lfsr='
git lfs uninstall
git reset --hard
git lfs install
git lfs pull
'

# Dependencies
alias rmnm="rm -rf node_modules && echo '  Clear packages.'"       # remove node_modules
alias rmb="rm -rf dist .next && echo '  Clear bineries.'"          # remove dist
alias rmyc="rm -rf .yarn/cache && echo '  Clear yarn cache'"       # remove yarn cache
alias rma="rmnm && rmb && rmyc"                                     # remove node_moudels, dist, yarn cache

# YARN
alias y="yarn"                                                      # yarn install
alias ysb="yarn storybook:run"                                      # run storybook
alias yd="yarn dev"                                                 # run development environment
alias yb="yarn build"                                               # build project
alias ybf="rmb && yb"                                               # build project force
alias ys="yarn start"                                               # start project
alias yp="rma && y && yb && ys"                                     # cleanup deps, build and run project

# NPM
alias n="npm install"
alias nsb="nmp run storybook:run"
alias nd="npm run dev"
alias nb="npm run build"
alias nbf="rmb && nb"
alias ns="npm run start"
alias np="rma && n && nb && ns"
alias nt="npm run test:end2end"

# DOTNET
alias dnb="dotnet build"                                            # build project
alias dnc="dotnet clean"                                            # cleanup bin and obj files
alias dnw="dotnet watch"                                            # watch file change for hotreload
alias dnt="dotnet test"                                             # run all tests
alias dnr="dotnet run"                                              # run application
alias dnp="dnc && dnb && dnt && dnr"                                # all cleanup and run application
alias dnvmj="set_version_dotnet \"major\""                          # up major version
alias dnvmn="set_version_dotnet \"minor\""                          # up minor version
alias dnvp="set_version_dotnet \"patch\""                           # up patch version

# RELEASES
alias rc="release_create"
alias rp="release_push"
alias cch="changelog_change_header"
alias crec="changelog_remove_empty_chapters"
alias caub="changelog_add_unreleased_block"
alias cc="changelog_commit"

alias release-start="rc && cch && crec && caub && cc && rp"
alias release-deploy="create_and_push_tag"
alias release-close="release_close"
#alias r="gswm && gfu && gtp"
#alias rp="gswd && gfu && gtp"
alias dc="echo '   Dependencies count: ' && npm ls --depth 0 | wc -l"

# GLOBAL ALIASES
alias pull='gfu'
alias push='ggp'
