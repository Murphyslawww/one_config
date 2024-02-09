# -----------------
# ZSH CONFIG
# -----------------
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
onepath() {
  echo "Path Variable:"
  echo "$PATH" | tr ':' '\n'
}
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
