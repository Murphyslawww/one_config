#############################
#  PATH ATTACHED VARIABLES  #
#############################
export PATH=/opt/homebrew/opt/ruby/bin:$PATH # RUBY
###########################
#  ENVIRONMENT VARIABLES  #
###########################
export XDG_CONFIG_HOME=$HOME/.config
# CUSTOM
export NAS_HOME=/opt/NAS_HOME/
export DEV=$NAS_HOME/development
export APPSUP=$HOME/Library/Application\ Support/
export DOTFILES=$HOME/.dotfiles

# RUBY
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/ruby/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/ruby/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/ruby/lib/pkgconfig"
