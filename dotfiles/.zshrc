[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
# ------------------------------
# SOURCE OTHER ZSH CONFIGS
# ------------------------------
source $ZSH_CUSTOM

# -----------------
# ZSH CONFIG
# -----------------

# list path variables under each other
onepath() {
  echo "Path Variable:"
  echo "$PATH" | tr ':' '\n'
}

# list ls output under each other
function onels() {
  case "$1" in
  "-a")
    ls -a | tr " " "\n"
    ;;
  *)
    ls | tr " " "\n"
    ;;
  esac
}
# list all ansi text colors
function onecolors() {
  for COLOR in {0..255}; do
    for STYLE in "38;5"; do
      TAG="\033[${STYLE};${COLOR}m"
      STR="${STYLE};${COLOR}"
      echo -ne "${TAG}${STR}${NONE}  "
    done
    echo
  done
}
# list all ansi background colors
function onecolorsbg() {
  for COLOR in {0..255}; do
    for STYLE in "48;5"; do
      TAG="\033[${STYLE};${COLOR}m"
      STR="${STYLE};${COLOR}"
      echo -ne "${TAG}${STR}${NONE}  "
    done
    echo
  done
}

# -----------------
# ZIMRC CONFIG
# -----------------
ZIM_HOME=$HOME/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
    https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# -----------------
# STARSHIP CONFIG
# -----------------
eval "$(starship init zsh)"
