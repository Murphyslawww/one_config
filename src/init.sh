#!/bin/zsh
#ANCHOR - Variables

ONE_CONFIG="$(cd "$(dirname "${0}")/.." && pwd)" # ROOT
DOTFILES="${ONE_CONFIG}/dotfiles"                # ROOT/dotfiles
SRC="${ONE_CONFIG}/src"                          # ROOT/src
ENV="${SRC}/.env"                                # ROOT/src/.env
GITIGNORE="${ONE_CONFIG}/.gitignore"             # ROOT/.gitignore
GITMODULES="${ONE_CONFIG}/.gitmodules"           # ROOT/.gitmodules
USER=$(whoami)
USER_HOME=$HOME

INITSCRIPT="${SRC}/init.sh"
SYMLINKSCRIPT="${SRC}/symlinks.sh"
SUBMODULESCRIPT="${SRC}/submodules.sh"

echo "## AUTO GENERATED BY INITSCRIPT ##" >${ENV}
{
    echo "ONE_CONFIG=${ONE_CONFIG}"
    echo "SRC=${SRC}"
    echo "ENV=${ENV}"
    echo "GITIGNORE=${GITIGNORE}"
    echo "GITMODULES=${GITMODULES}"
    echo "USER=${USER}"
    echo "USER_HOME=${USER_HOME}"
    echo "DOTFILES=${DOTFILES}"
    echo "INITSCRIPT=${INITSCRIPT}"
    echo "SYMLINKSCRIPT=${SYMLINKSCRIPT}"
    echo "SUBMODULESCRIPT=${SUBMODULESCRIPT}"
} >>${ENV}

#ANCHOR - Permissions
setopt GLOB_DOTS
chown -R ${USER} ${ONE_CONFIG}
chmod -R 774 ${ONE_CONFIG}
unsetopt GLOB_DOTS

source "$SYMLINKSCRIPT"
source "$SUBMODULESCRIPT"
