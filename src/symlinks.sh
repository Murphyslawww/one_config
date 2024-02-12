#!/bin/zsh

#ANCHOR - Symlinks
echo "\n$RED Created Symlinks for: $CYAN"

IGNORE_SYMLINKS=($DOTFILES/.DS_Store $ONE_CONFIG/appsup/.DS_Store)
setopt GLOB_DOTS

# Symlinks from $DOTFILES -> $HOME (repo -> home)
for item in ${DOTFILES}/*; do
    if [[ ! " ${IGNORE_SYMLINKS[@]} " =~ " ${item} " ]]; then
        ln -sfv "${item}" "$HOME"
    fi
done

# Symlinks from $APPSUP -> $DOTFILES/appsup (repo <- application support)
ln -sfv "$APPSUP/Firefox" "$ONE_CONFIG/appsup"
ln -sfv "$APPSUP/Sublime Text" "$ONE_CONFIG/appsup"

unsetopt GLOB_DOTS
