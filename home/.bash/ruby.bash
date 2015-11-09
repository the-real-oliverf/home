#!/bin/bash

export PATH="$HOME/.rbenv/bin:$PATH"
if [[ -x /usr/local/bin/rbenv ]]; then
  eval "$(rbenv init -)"
fi

export BACKTRACE=1
export PRY=1

alias be='bundle exec'
alias bi='bundle install --jobs 4'
