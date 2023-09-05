#!/bin/bash

RED="\e[91m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[94m"
NC="\e[0m"

full_path=$(realpath $0)
dir_path=$(dirname $full_path)
 
function changelog_change_header()
{
  gsed -i -e 's/## \[Unreleased\]/## 🚀 \['"$(get_version_typescript)"'\]/' CHANGELOG.md
  echo -e " ${YELLOW} ${NC} Update header ${GREEN}🚀 ["$(get_version_typescript)"]${NC}."
}

function changelog_remove_empty_chapters()
{
  node $dir_path/remove_empty_chapters.js
  echo -e " ${YELLOW} ${NC} Remove empty chapters."
}

function changelog_add_unreleased_block()
{
  UNRELEASED="## [Unreleased]\n\n### 🆕 Added\n\n_Список новой функциональности._\n\n### 🛠 Changed\n\n_Список изменившейся функциональности._\n\n### 📜 Deprecated\n\n_Список устаревшей функциональности._\n\n### 🗑 Removed\n\n_Список удаленной функциональности._\n\n### 🪲 Fixed\n\n_Список исправлений багов._\n\n### 🔐 Security\n\n_Список правок для обеспечения безопасности._\n\n### 📦 Support\n\n_Список правок для обеспечения технической поддержки._\n"
  gsed -i -e '/## 🚀 \['"$(get_version_typescript)"'\]/i '"$UNRELEASED"'' CHANGELOG.md
  echo -e " ${YELLOW} ${NC} Add unreleased block."
}

function changelog_commit () 
{
  git add CHANGELOG.md > /dev/null 2>&1 || return
  git commit --message '📝 Update changelog.' --no-verify > /dev/null 2>&1 || return
  echo -e " ${GREEN}󰜘${NC} Commit updated changelog."
}
