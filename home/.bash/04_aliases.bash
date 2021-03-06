#! /bin/bash

# ls in color and nice variants
if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
  eval `dircolors ~/.dir_colors`
  alias ls='ls -l --color=auto'
else  # on Mac
  alias ls='ls -lG'
fi
alias ll='ls -AF'
alias la='ls -A'

# color greps
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# moving around
alias cd='pushd'
alias pd='popd'
alias ..='cd ..'
alias ...='cd ../..'

# https://github.com/github/hub
if command -v hub > /dev/null; then
  alias git=hub
fi
