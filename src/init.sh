#!/bin/zsh
ONE_CONFIG="$(cd "$(dirname "${0}")/.." && pwd)"
VARIABLES_SCRIPT="${ONE_CONFIG}/src/variables.sh"

source "$VARIABLES_SCRIPT"

source $COLORS_TEXT
source "$PERMISSIONS_SCRIPT"
source "$SYMLINKS_SCRIPT"
source "$SUBMODULES_SCRIPT"
