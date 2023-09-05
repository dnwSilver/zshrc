RED="\e[91m"
GREEN="\e[32m"
BLUE="\e[94m"
NC="\e[0m"

function create_and_push_tag ()
{
  CURRENT_VERSION=$(get_version_typescript)
  if [ $(git tag -l "v$CURRENT_VERSION") ]; then
    echo -e " ${BLUE}󰜣${NC} ${RED}Tag v${CURRENT_VERSION} already created${NC}."
  else
    git tag v$CURRENT_VERSION > /dev/null 2>&1 || return
    echo -e " ${BLUE}󰜢${NC} Create tag ${GREEN}v${CURRENT_VERSION}${NC}."
    
    git push origin v$CURRENT_VERSION > /dev/null 2>&1 || return
    echo -e " ${BLUE}󱩺${NC} Push tag ${GREEN}v${CURRENT_VERSION}${NC}."
  fi
} 

function release_create ()
{
  git switch $(git_develop_branch) > /dev/null 2>&1 || return

  echo -e " ${GREEN}󱓏${NC} Swap to branch ${GREEN}$(git_develop_branch)${NC}." 
  
  git pull origin $(current_branch) > /dev/null 2>&1 || return
  git fetch --all --prune --jobs=10 > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓍${NC} Pull and fetch from branch ${GREEN}$(current_branch)${NC}." 

  CURRENT_VERSION=$(get_version_typescript)
  git switch -c release/$CURRENT_VERSION > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓊${NC} Create new release branch ${GREEN}$(current_branch)${NC}." 
}

function release_push () 
{
  git push origin $(current_branch) > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓎${NC} Push release branch ${GREEN}$(current_branch)${NC}." 
}
