#!/bin/zsh

# Define an array for keys and values
keys=()
values=()

# Define a function to set a variable and add it to the arrays
set_var() {
    local name=$1
    local value=$2
    eval $name=$value
    keys+=($name)
    values+=($value)
}

# Use the function to set the variables
set_var "ONE_CONFIG" "$(cd "$(dirname "${0}")/.." && pwd)" # ROOT
set_var "DOTFILES" "${ONE_CONFIG}/dotfiles"                # ROOT/dotfiles
set_var "SRC" "${ONE_CONFIG}/src"                          # ROOT/src                                # ROOT/src/.env
set_var "GITIGNORE" "${ONE_CONFIG}/.gitignore"             # ROOT/.gitignore
set_var "GITMODULES" "${ONE_CONFIG}/.gitmodules"           # ROOT/.gitmodules
set_var "USER" "$(whoami)"
set_var "USER_HOME" "$HOME"
set_var "VARIABLES_SCRIPT" "${SRC}/variables.sh"
set_var "PERMISSIONS_SCRIPT" "${SRC}/permissions.sh"
set_var "INIT_SCRIPT" "${SRC}/init.sh"
set_var "SYMLINKS_SCRIPT" "${SRC}/symlinks.sh"
set_var "SUBMODULES_SCRIPT" "${SRC}/submodules.sh"
set_var "COLORS_TEXT" "${SRC}/colors.env"
set_var "APPSUP" "$HOME/Library/Application\ Support"
