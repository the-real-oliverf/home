#!/bin/bash

# Start from scratch
PS1=''

HOSTCOLOR='\[${RED}\]'
DIRCOLOR='\[${LIGHT_YELLOW}\]'

# Show the hostname if this is a remote ssh session
if [ ! -z "$SSH_TTY" ] && [ ! -z "$SSH_CLIENT" ] ; then
  PS1+="${HOSTCOLOR}[\\H] "
fi

# Show current directory only
PS1+="${DIRCOLOR}\\W"

# If we have __git_ps1 installed, then put it in the prompt. We do what we can
# from the previous two lines.
if command -v __git_ps1 > /dev/null 2>&1; then
  PS1+='\[${LIGHT_BLUE}\]$(__git_ps1 " (%s)")'
else
  echo '__git_ps1 not installed!'
fi

# Normalize prompt contents
PS1+="${DIRCOLOR}$ "
PS1+='\[${NORMAL}\]'
