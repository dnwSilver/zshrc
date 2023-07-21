#!/bin/bash

# SPECIAL
alias ll="exa -la"                                                  # show all files and directories
alias x="clear"                                                     # clear terminal

# GIT
alias gcmj="gitmoji -c"                                             # commit builder with emoji
alias grst="git stash && git stash clear"                           # remove all changes
alias ggpcs="ggp -o ci.skip"                                        # push commit without ci/cd
alias gfu="ggl && gfa"                                              # pull new commit and branches
alias gtp="git tag $1 && git push origin"                           # create tag and push with current version

# YARN
alias rmnm="rm -rf node_modules && echo ' 󰜴  Clear node modules'"  # remove node_modules
alias rmd="rm -rf dist && echo ' 󰜴  Clear dist'"                   # remove dist
alias rmyc="rm -rf .yarn/cache && echo ' 󰜴  Clear yarn cache'"     # remove yarn cache
alias rma="rmnm && rmd && rmyc"                                     # remove node_moudels, dist, yarn cache
alias y="yarn"                                                      # yarn install
alias ysb="yarn storybook:run"                                      # run storybook
alias yd="yarn dev"                                                 # run development environment
alias yb="yarn build"                                               # build project
alias ys="yarn start"                                               # start project
alias yp="rma && y && yb && ys"                                     # cleanup deps, build and run project
alias yvmj="set_version_typrescript \"major\""                      # up major version
alias yvmn="set_version_typrescript \"minor\""                      # up minor version
alias yvp="set_version_typrescript \"patch\""                       # up patch version

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
