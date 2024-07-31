#!/bin/bash

alias gcmj="gitmoji -c"                               # commit builder with emoji
alias grst="git stash && git stash clear"             # remove all changes
alias ggpcs="ggp -o ci.skip"                          # push commit without ci/cd
alias gfu="ggl && gfa"                                # pull new commit and branches
alias ghrc="git reset --hard HEAD && git clean -qfdx" # ghrc and clean
alias gtp="git_create_tag_and_push"                   # create tag and push with current version
alias gmod='git_merge_origin_dev'                     # merge with origin dev
alias lfsr='git_lfs_reset'                            # reset git lfs files

alias reset="grst"
alias fetch="gfu"
alias commit="gcmj"
alias push="ggp"
alias push-ci-skip="ggpcs"
alias merge-dev="gmod"
alias lfs-reset="lfsr"
alias clean="ghrc"
alias tag="gtp"