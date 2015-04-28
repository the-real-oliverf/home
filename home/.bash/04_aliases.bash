#! /bin/bash

# https://github.com/github/hub
#if command -v hub > /dev/null; then
#  alias git=hub
#fi

# ls in color and nice variants
# TODO(oliverf): eat the output of this so it doesn't show
if ls --version | grep -q GNU; then  # not on Mac
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
