#!/bin/bash

# Notify immediatly on bg job completion
set -o notify

# Case insensitive autocompletion
shopt -s nocaseglob

if [[ -x /usr/local/bin/atom ]]; then
  export EDITOR='/usr/bin/code --wait'
else
  if [[ -x /usr/bin/nano ]]; then
    export EDITOR='/usr/bin/nano'
  else
    export EDITOR=/usr/bin/vim
  fi
fi

# To make Vim behave under xterm.
# Thanks, @teoljungberg
stty -ixon

export TERM=screen-256color
