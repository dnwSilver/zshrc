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
