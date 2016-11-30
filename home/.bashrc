#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

for file in ~/.bash/*.bash; do
  source $file
done
