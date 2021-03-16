#!/bin/bash

if [[ -z $BASH_CONF ]]; then
    export BASH_CONF="bashrc"
fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load .bash_profile from current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$BASH_CONF" == "bashrc" ] && [[ -f "${DIR}/.bash_profile" ]]; then
    # shellcheck source=/dev/null
    source "${DIR}/.bash_profile"
fi

