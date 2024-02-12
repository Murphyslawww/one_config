#!/bin/zsh

#ANCHOR - Symlinks
echo "\n$RED Created Symlinks for: $CYAN"

IGNORE_SYMLINKS=($DOTFILES/.DS_Store)
setopt GLOB_DOTS

for item in ${DOTFILES}/*; do
    if [[ ! " ${IGNORE_SYMLINKS[@]} " =~ " ${item} " ]]; then
        ln -sfv "${item}" "$HOME"
    fi
done
unsetopt GLOB_DOTS
