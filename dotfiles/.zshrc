# -----------------
# Zsh configuration
# -----------------

#ANCHOR - CUSTOM CONFIGURATION
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# RUBY
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh # source ruby version manager
source $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh   # enable auto switch ruby version
path() {
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
