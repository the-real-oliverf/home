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

# TODO(oliver): Delete this since Phabricator is gone
if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
  export PATH=$PATH:/home/vagrant/src/phacility/arcanist/bin/
  source /home/vagrant/src/phacility/arcanist/resources/shell/bash-completion
else
  export PATH=$PATH:/Users/oliverf/phacility/arcanist/bin/
  source /Users/oliverf/phacility/arcanist/resources/shell/bash-completion
fi
