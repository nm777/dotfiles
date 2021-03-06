#!/bin/bash

if [[ -z $BASH_CONF ]]; then
    export BASH_CONF="bash_profile"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$BASH_CONF" == "bash_profile" ] && [[ -f "${DIR}/.bashrc" ]]; then
    # shellcheck source=/dev/null
    source "${DIR}/.bashrc"
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ${DIR}/.{bash_prompt,aliases,functions,path,dockerfunc,extra,exports}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Attempt to save all lines of a multiple-line command in the same entry
shopt -s cmdhist

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT='%F %T '

# Use vim as the fc editor
FCEDIT=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Enable Keychain http://www.funtoo.org/Keychain
keychain_path=$(which keychain 2>/dev/null)
if [ -x "$keychain_path" ] ; then
    eval `keychain --eval id_rsa`
fi

# Command-line completion for git commands
source ${DIR}/git-completion.bash

# Things that are different between Linux and Mac
if [ "$(uname)" == "Darwin" ]; then
    # Command line completion of docker commands on Mac OS
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do Linux-specific things here
    echo -n ""
fi
