#!/bin/bash

confirm() {
    # call with a prompt string or use a default
    read -n1 -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

sudo apt-get update

confirm "Install keepassx? [y/N]" && sudo apt-get install -y keepassx

