#!/bin/bash

if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
  echo "Not on a mac, skipping Homebrew setup"
else  # on Mac
  # Set PATH, MANPATH, etc. for Homebrew.
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
