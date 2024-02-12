#!/bin/zsh

echo "$RED Set File Permissions and Ownership for ${USER} in ${ONE_CONFIG} ? [y/n] \n $RESET"
read -k 1 answer

if [[ $answer = "n" ]]; then
    echo "\n\n$RED Exiting without changing permissions and ownership. $RESET"
    return 0
fi

IGNORE_PERMISSIONS=($DOTFILES $DOTFILES/* $ONE_CONFIG/.gitignore $ONE_CONFIG/.gitmodules $ONE_CONFIG/.git $ONE_CONFIG/.DS_Store)
setopt GLOB_DOTS

echo "\n\n${RED}Changed permissions and ownerships for: ${CYAN}"
for item in ${ONE_CONFIG}/* ${ONE_CONFIG}/.*; do
    if [[ ! " ${IGNORE_PERMISSIONS[@]} " =~ " ${item} " ]]; then
        chown -Rv ${USER} ${item}
        chmod -Rv 774 ${item}
    fi

    # Set SSH Permissions (~/.ssh)
    chmod -v 700 ${DOTFILES}/.ssh
    chmod -v 644 ${DOTFILES}/.ssh/known_hosts
    for pub_key in ${DOTFILES}/.ssh/*.pub; do
        chmod -v 644 "${pub_key}"
    done
    for file in ${DOTFILES}/.ssh/*; do
        if [[ ! ${file} == *.pub && ${file} != "${DOTFILES}/.ssh/known_hosts" ]]; then
            chmod -v 600 "${file}"
        fi
    done
done
unsetopt GLOB_DOTS
