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

# Logic to link a source node to a target node, recursing if both are directories
function link_node {
  local source=$1
  local target=$2
  local base=$(basename "$source")

  if [[ -d "$source" && -d "$target" && ! -L "$target" ]]; then
    # Recurse into directory
    echo -e "${GRAY}Recursing into $base...${NORMAL}"
    for child in "$source"/*; do
      if [ -e "$child" ]; then
        link_node "$child" "$target/$(basename "$child")"
      fi
    done
    return
  fi

  if [[ -h "$target" && ($(readlink "$target") == "$source") ]]; then
    echo -e "${GRAY}~/$base is symlinked to your dotfiles.${NORMAL}"
  elif [[ -f "$target" && -f "$source" && $(sha256sum "$source" | awk '{print $2}') == $(sha256sum "$target" | awk '{print $2}') ]]; then
    echo -e "${GREEN}~/$base exists and was identical to your dotfile.  Overriding with symlink.${NORMAL}"
    symlink "$source" "$target"
  elif [[ -a "$target" ]]; then
    read -p "${YELLOW}/$base exists and differs from your dotfile. Skipping.${NORMAL}" -n 1
  else
    echo -e "${GREEN}~/$base does not exist. Symlinking to dotfile.${GREEN}"
    symlink "$source" "$target"
  fi
}

for file in home/.[^.]*; do
  path="$(pwd)/$file"
  target="$HOME/$(basename "$file")"
  link_node "$path" "$target"
done
