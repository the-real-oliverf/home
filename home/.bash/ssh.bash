#!/bin/bash

if ls --version 2> /dev/null | grep -q GNU; then  # not on Mac
  eval `keychain --eval --agents ssh id_ed25519`
fi
