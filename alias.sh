#!/bin/bash

# SPECIAL
alias ll="eza --tree --icons --level 1 -l"                        # show all files and directories
alias lla="eza --tree --icons --all --level 1 -l"                 # show all files and directories
alias x="clear"                                                   # clear terminal
alias vpn="sudo openfortivpn -c ~/.config/openfortivpn/config"      # connect to secure network for development

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
alias ni="npm install"                          # install deps
alias nrsb="nmp run storybook:build"            # build storybook
alias nrsr="nmp run storybook:run"              # run storybook
alias nrd="npm run dev"                         # run with development environment
alias nrb="npm run build"                       # build project
alias nrs="npm run start"                       # start project from dist
alias nrqf="npm run quality:codestyle"          # verify code quality
alias nrqs="npm run quality:css"                # verify styles quality
alias nrql="npm run quality:lint"               # verify linting
alias nrqt="npm run quality:types"              # verify types
alias nrq="nrqf && nrqs && nrql && nrqt"        # verify all aspects
alias nrte="npm run test:end2end"               # run end to end tests
alias nrteu="npm run test:end2end:ui"           # run end to end tests
alias nrtsd="npm run test:screenshots:docker"   # run docker for screenshots test
alias nrtsu="npm run test:screenshots:update"   # update screenshots
alias nrtu="npm run test:unit"                  # run unit tests
alias nrts="npm run test:seeding"
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
alias release-deploy="git_create_tag_and_push"
alias release-close="release_close"
#alias r="gswm && gfu && gtp"
#alias rp="gswd && gfu && gtp"
alias dc="echo '   Dependencies count: ' && npm ls --depth 0 | wc -l"


function ru() { trans -b en:ru $@ }
function en() { trans -b ru:en $@ }

