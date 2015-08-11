#!/bin/bash

export PATH="$HOME/.rbenv/bin:$PATH"
if [[ -x /usr/local/bin/rbenv ]]; then
  eval "$(rbenv init -)"
fi

alias be='bundle exec'
alias bi='bundle install --jobs 4'
