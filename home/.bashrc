#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

for file in ~/.bash/*.bash; do
  source $file
done

unset DISPLAY

export NVM_DIR="/Users/oliverf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
