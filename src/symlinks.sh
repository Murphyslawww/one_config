source .env

#ANCHOR - Symlinks
setopt GLOB_DOTS
for file in ${DOTFILES}/*; do
    ln -sfv "${file}" "${USER_HOME}"
done
unsetopt GLOB_DOTS
