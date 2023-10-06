RED="\e[91m"
GREEN="\e[32m"
BLUE="\e[94m"
NC="\e[0m"
YELLOW="\e[33m"

function go_to_main_branch()
{
  git switch $(git_main_branch) > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓏${NC} Swap to branch ${GREEN}$(git_main_branch)${NC}." 
}

function go_to_dev_branch()
{
  git switch $(git_develop_branch) > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓏${NC} Swap to branch ${GREEN}$(current_branch)${NC}." 
}

function update_current_branch()
{
  git pull origin $(current_branch) > /dev/null 2>&1 || return
  git fetch --all --prune --jobs=10 > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓍${NC} Pull and fetch from branch ${GREEN}$(current_branch)${NC}." 
}

function create_and_push_tag ()
{
  go_to_main_branch

  update_current_branch
  
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
  go_to_dev_branch

  update_current_branch

  CURRENT_VERSION=$(get_version_typescript)
  git switch -c release/$CURRENT_VERSION > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓊${NC} Create new release branch ${GREEN}$(current_branch)${NC}." 
}

function release_close() 
{
  go_to_main_branch

  update_current_branch

  go_to_dev_branch

  update_current_branch

  git merge $(git_main_branch) > /dev/null 2>&1 || return
  echo -e " ${GREEN}󰘬${NC} Merge branch ${GREEN}$(current_branch)${NC} with ${GREEN}$(git_main_branch)${NC}." 
  
  git push origin $(current_branch) -o ci.skip > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓎${NC} Push branch ${GREEN}$(current_branch)${NC}." 
}
 
function release_push () 
{
  git push origin $(current_branch) > /dev/null 2>&1 || return
  echo -e " ${GREEN}󱓎${NC} Push release branch ${GREEN}$(current_branch)${NC}." 
  
  echo -e " ${YELLOW} ${NC}Go to https://gitlab.spectrumdata.tech/ and merge branch manually."

  go_to_main_branch
}
