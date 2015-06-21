#!/bin/bash

# Notify immediatly on bg job completion
set -o notify

# Case insensitive autocompletion
shopt -s nocaseglob

if [[ -x /usr/local/bin/atom ]]; then
  export EDITOR='/usr/local/bin/atom --wait'
else
  export EDITOR=/usr/bin/vim
  # Prefer user-installed one
  if [[ -x /usr/local/bin/vim ]]; then
    export EDITOR=/usr/local/bin/vim
  fi
fi

# To make Vim behave under xterm.
# Thanks, @teoljungberg
stty -ixon

export TERM=screen-256color
