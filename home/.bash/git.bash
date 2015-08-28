#!/bin/bash

# bash completion scripts - if not already installed
if ! command -v __git_ps1 > /dev/null 2>&1; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  source /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi

# Phabricator Arcanist stuff
export PATH=$PATH:/Users/oliverf/phacility/arcanist/bin/
source /Users/oliverf/phacility/arcanist/resources/shell/bash-completion

