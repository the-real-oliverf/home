#!/bin/bash

# bash completion scripts - if not already installed
if ! command -v __git_ps1 > /dev/null 2>&1; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  source /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi

# Phabricator Arcanist stuff
if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
  export PATH=$PATH:/home/vagrant/src/phacility/arcanist/bin/
  source /home/vagrant/src/phacility/arcanist/resources/shell/bash-completion
else
  export PATH=$PATH:/Users/oliverf/phacility/arcanist/bin/
  source /Users/oliverf/phacility/arcanist/resources/shell/bash-completion
fi
