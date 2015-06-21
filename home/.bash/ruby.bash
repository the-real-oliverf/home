#!/bin/bash

export PATH="$HOME/.rbenv/bin:$PATH"
if [[ -x /usr/local/bin/rbenv ]]; then
  eval "$(rbenv init -)"
fi
