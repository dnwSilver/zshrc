#!/bin/bash
REMOTE_REPOSITORY=https://raw.githubusercontent.com/dnwSilver/zshrc/main

function download_file() {
  FILE_PATH=$REMOTE_REPOSITORY/$1
  wget $FILE_PATH -O /$1
  echo "📄 Download file $FILE_PATH."
}

rm -rf scripts

download_file alias.sh
download_file dnw.omp.json
download_file poshcontext.sh
download_file burnversion.sh
download_file changelog.sh
