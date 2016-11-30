#!/bin/bash

# bash completion scripts - if not already installed
if ! command -v __git_ps1 > /dev/null 2>&1; then
  if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
    source /usr/share/bash-completion/completions/git
    source /etc/bash_completion.d/git-prompt
  else  # on Mac
    source /usr/local/etc/bash_completion.d/git-completion.bash
    source /usr/local/etc/bash_completion.d/git-prompt.sh
  fi
fi
