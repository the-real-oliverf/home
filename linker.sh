#!/bin/bash
# Links everything in home/ to ~/, does sanity checks.
# By Simon Eskildsen (github.com/Sirupsen)

function symlink {
  ln -nsf $1 $2
}

if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
  GREEN=$'\e[0;32m'
  YELLOW=$'\e[0;33m'
  GRAY=$'\e[1;30m'  
  NORMAL=$'\e[00m'
else  # on Mac
  GREEN=$'\x1B[32m'
  YELLOW=$'\x1B[33m'
  GRAY=$'\x1B[90m'
  NORMAL=$'\x1B[39m'
fi

for file in home/.[^.]*; do
  path="$(pwd)/$file"
  base=$(basename $file)
  target="$HOME/$(basename $file)"

  if [[ -h $target && ($(readlink $target) == $path)]]; then
    echo -e "${GRAY}~/$base is symlinked to your dotfiles.${NORMAL}"
  elif [[ -f $target && $(sha256sum $path | awk '{print $2}') == $(sha256sum $target | awk '{print $2}') ]]; then
    echo -e "${GREEN}~/$base exists and was identical to your dotfile.  Overriding with symlink.${NORMAL}"
    symlink $path $target
  elif [[ -a $target ]]; then
    read -p "${YELLOW}/$base exists and differs from your dotfile. Skipping.${NORMAL}" -n 1
  else
    echo -e "${GREEN}~/$base does not exist. Symlinking to dotfile.${GREEN}"
    symlink $path $target
  fi
done
