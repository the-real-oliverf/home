#!/bin/bash

export PATH="$HOME/.rbenv/bin:$PATH"
if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
  if [[ -x "$HOME/.rbenv/bin/rbenv" ]]; then
    eval "$(rbenv init -)"
  fi
else  # on Mac so use homebrew
  if [[ -x /opt/homebrew/bin/rbenv ]]; then
    eval "$(rbenv init -)"
  fi
  # Set PATH, MANPATH, etc. for Homebrew.
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export BACKTRACE=1
export PRY=1

alias be='bundle exec'
alias bi='bundle install --jobs 4'
