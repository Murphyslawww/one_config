# -----------------
# Zsh configuration
# -----------------

#ANCHOR - CUSTOM CONFIGURATION
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
