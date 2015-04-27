#!/bin/bash

if ls --version | grep -q GNU; then
  # only do this on Mac since all instance are logins
  . ~/.bashrc
fi
