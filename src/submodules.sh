#!/bin/zsh

# Source Variables
source .env

# Find git repositories & add them to .gitmodules
find ${ONE_CONFIG} -type d -name ".git" -exec sh -c 'echo "[submodule \"$(basename $(dirname {}))\"]" && echo "path = $(echo "{}" | sed -e "s|.*dotfiles/|dotfiles/|" -e "s|/\.git$||")" && echo "url = $(git --git-dir="{}" remote get-url origin)"' \; >${GITMODULES}
