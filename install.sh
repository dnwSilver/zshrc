#!/bin/bash
REMOTE_REPOSITORY=https://raw.githubusercontent.com/dnwSilver/zshrc/main

function download_file() {
  FILE_PATH=$REMOTE_REPOSITORY/$1
  wget $FILE_PATH -O ./scripts/$1 > /dev/null 2>$1
  if [[ -e "./scripts/$1" ]]; then echo "⎬📥 Download file $FILE_PATH."; fi
}
echo "⎧ 🔧 Install zsh scripts"
echo "⎪"
echo "⎬🧹 Clear old scripts"
rm -rf scripts
mkdir scripts
chmod 755 scripts

download_file alias.sh
download_file dnw.omp.json
download_file poshcontext.sh
download_file burnversion.sh
download_file changelog.sh

echo "⎪"
echo "⎩🏁 Scripts succesfully installed"

