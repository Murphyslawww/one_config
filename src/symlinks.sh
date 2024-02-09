source .env

setopt GLOB_DOTS
#ANCHOR - Symlinks
for file in ${DOTFILES}/*; do
    ln -sfv "${file}" "${USER_HOME}"
done
unsetopt GLOB_DOTS
