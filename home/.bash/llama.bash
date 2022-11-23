#!/bin/bash

export LLAMA_EDITOR=/usr/bin/vim
function ll {
  cd "$(llama "$@")"
}